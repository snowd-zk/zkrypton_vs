# 💻 Canton Network 개발자 심층 가이드
## Daml 스마트 컨트랙트, Ledger API 및 시스템 연동 아키텍처

- **문서 목적**: 금융 소프트웨어 엔지니어를 위한 Canton Network 및 Daml 개발 환경, 스마트 계약 구현 패턴, 백엔드 연동 명세 제공
- **대상 독자**: 블록체인 코어 개발자, 금융기관 백엔드 아키텍트, STO 플랫폼 개발팀

---

## 1. 개발 환경 구축 및 툴체인 (Toolchain & Setup)

Canton Network의 스마트 컨트랙트는 **Daml (Digital Asset Modeling Language)**로 작성되며, 개발 생태계는 Digital Asset이 제공하는 전용 SDK를 통해 제공됩니다.

### A. Daml SDK 설치 및 프로젝트 초기화
```bash
# Daml SDK 최신 버전 설치 (macOS / Linux)
curl -sSL https://get.daml.com/ | sh

# 환경 변수 반영
export PATH="$HOME/.daml/bin:$PATH"

# 금융 토큰 프로젝트 템플릿 생성
daml new financial-token-demo --template skeleton
cd financial-token-demo
```

### B. `daml.yaml` 설정 파일 구조
```yaml
sdk-version: 3.2.0
name: financial-token-demo
source: daml
version: 1.0.0
dependencies:
  - daml-prim
  - daml-stdlib
```

---

## 2. Daml 스마트 컨트랙트 핵심 프로그래밍 모델

Daml은 객체 지향이나 명령형 언어가 아닌, **선언적 함수형 언어(Haskell 기반)**입니다. 계약의 생성, 변경, 소멸 및 권한(Who can do What)을 명시적으로 선언합니다.

### A. 핵심 권한 키워드
- `signatory`: 계약의 생성 및 변경에 반드시 디지털 서명이 요구되는 필수 당사자.
- `observer`: 계약의 내용을 열람할 정당한 권한을 가진 당사자 (Sub-transaction Privacy의 복호화 대상).
- `controller`: 특정 선택 조항(`choice`)을 실행하여 계약 상태를 변경할 수 있는 주체.
- `ensure`: 계약이 생성되기 위해 만족해야 하는 사전 조건(Invariant 검증).

---

## 3. 실무 금융 스마트 컨트랙트 코드 예제

### A. 규제 준수형 토큰증권 (STO) 템플릿
```haskell
-- daml/SecurityToken.daml
module SecurityToken where

-- | 토큰증권 권리 명부 계약
template SecurityToken
  with
    issuer : Party         -- 증권 발행사
    custodian : Party      -- 계좌관리기관 (증권사/신탁사)
    owner : Party          -- 투자자 (증권 소유자)
    isin : Text            -- 표준 종목 코드
    amount : Decimal       -- 증권 수량
    isFrozen : Bool        -- 사법/규제 동결 플래그
  where
    signatory issuer, custodian
    observer owner

    ensure amount > 0.0

    -- [Choice 1] 권리 양도 제안 (소유자가 수탁사 및 신규 매수인에게 제안)
    nonconsuming choice ProposeTransfer : ContractId TransferProposal
      with
        newOwner : Party
        transferAmount : Decimal
      controller owner
      do
        assertMsg "Token is currently frozen" (not isFrozen)
        assertMsg "Insufficient amount" (amount >= transferAmount)
        create TransferProposal with
          tokenCid = self
          issuer
          custodian
          currentOwner = owner
          newOwner
          transferAmount

    -- [Choice 2] 규제 당국/수탁사의 강제 이전/동결 권한 (사법 집행)
    choice FreezeOrForceTransfer : ContractId SecurityToken
      with
        targetOwner : Party
        freezeStatus : Bool
      controller custodian
      do
        create this with
          owner = targetOwner
          isFrozen = freezeStatus

-- | 양수인의 수락을 대기하는 전송 제안 계약
template TransferProposal
  with
    tokenCid : ContractId SecurityToken
    issuer : Party
    custodian : Party
    currentOwner : Party
    newOwner : Party
    transferAmount : Decimal
  where
    signatory issuer, custodian, currentOwner
    observer newOwner

    choice AcceptTransfer : (ContractId SecurityToken, Optional (ContractId SecurityToken))
      controller newOwner
      do
        token <- fetch tokenCid
        archive tokenCid
        
        -- 신규 매수인 증권 생성
        newCid <- create token with
          owner = newOwner
          amount = transferAmount

        -- 잔여 수량 원소유주 재발행
        remainingCid <- if token.amount > transferAmount
          then Some <$> create token with amount = token.amount - transferAmount
          else return None

        return (newCid, remainingCid)
```

### B. 원자적 동시결제 (Atomic DvP) 스왑 계약
별도의 브릿지나 에스크로 없이, 서로 다른 서브넷(도메인)에 있는 토큰증권과 자금(예금토큰/USDC)을 단일 트랜잭션에서 원자적으로 맞교환합니다.

```haskell
-- daml/AtomicDvP.daml
module AtomicDvP where

import SecurityToken

template DvPSwapOffer
  with
    buyer : Party
    seller : Party
    custodian : Party
    securityISIN : Text
    securityAmount : Decimal
    cashAmount : Decimal
    currency : Text
  where
    signatory buyer, custodian
    observer seller

    choice SettleDvP : ()
      with
        sellerTokenCid : ContractId SecurityToken
      controller seller
      do
        token <- fetch sellerTokenCid
        assertMsg "ISIN mismatch" (token.isin == securityISIN)
        assertMsg "Amount mismatch" (token.amount == securityAmount)
        
        -- 1. 증권 소유권 이전
        archive sellerTokenCid
        create token with owner = buyer

        -- 2. 자금 결제 (원자적 실행 보장: 실패 시 전체 롤백)
        -- 실제 연동 시 CashToken.Transfer 호출
        return ()
```

---

## 4. Canton Ledger API 및 백엔드 연동

Canton 노드는 외부 엔터프라이즈 시스템(코어 뱅킹, 원장 관리 시스템)과의 통신을 위해 **gRPC Ledger API**와 **HTTP JSON API v2**를 제공합니다.

### A. JSON API v2를 통한 계약 생성 호출 (REST)
```http
POST /v2/commands/submit-and-wait HTTP/1.1
Host: canton-participant.bank.com:7575
Content-Type: application/json
Authorization: Bearer <JWT_TOKEN_WITH_PARTY_CLAIMS>

{
  "commands": [
    {
      "create": {
        "templateId": "SecurityToken:SecurityToken",
        "arguments": {
          "issuer": "Party::BankIssuer::1220a1b2...",
          "custodian": "Party::SecuritiesFirm::1220c3d4...",
          "owner": "Party::InvestorA::1220e5f6...",
          "isin": "KR7005930003",
          "amount": "1000.0",
          "isFrozen": false
        }
      }
    }
  ]
}
```

### B. Canton Participant Node 환경 설정 (`canton.conf`)
```hocon
canton {
  participants {
    bank_participant {
      storage {
        type = postgres
        config {
          dataSourceClass = "org.postgresql.ds.PGSimpleDataSource"
          properties = {
            serverName = "localhost"
            portNumber = "5432"
            databaseName = "canton_ledger"
            user = "canton"
            password = "secure_password"
          }
        }
      }
      admin-api {
        port = 5012
        address = "127.0.0.1"
      }
      ledger-api {
        port = 5011
        address = "0.0.0.0"
      }
    }
  }
}
```

---

## 5. Canton Network vs ZKRYPTON 개발자 관점 종합 비교

| 개발 분석 항목 | 🏛️ Canton Network | 🛡️ ZKRYPTON (zkrypto) | 개발자 관점 평가 및 시사점 |
| :--- | :--- | :--- | :--- |
| **스마트 컨트랙트 언어** | **Daml** (Haskell 기반 함수형 도메인 특화 언어) | **Solidity / Vyper** (완전 EVM 호환) | ZKRYPTON은 기존 Solidity 라이브러리(OpenZeppelin 등) 및 스마트 계약 100% 재사용 가능 |
| **개발 툴체인 & CLI** | Daml SDK, Daml Studio (VSCode Extension) | **Foundry (`forge`, `cast`), Hardhat, Revm CLI** | ZKRYPTON이 업계 표준 Web3 빌드/테스트 자동화 도구와 완벽 호환 |
| **클라이언트 API 프로토콜** | gRPC Ledger API, 전용 JSON API v2 | **표준 이더리움 JSON-RPC (`eth_*`)** | Ethers.js, Viem, Web3.py 등 현존하는 모든 Web3 SDK 즉시 연결 가능 |
| **단위 테스트 & 시뮬레이션** | Daml Script (시나리오 기반 함수형 테스트) | **Foundry 속성 기반(Property) 및 퍼징(Fuzzing) 테스트** | ZKRYPTON의 초고속 Rust Revm 테스트 러너로 수천 건의 유닛 테스트 수 초 내 완료 |
| **계정 및 서명 체계** | Party 기반 비대칭 키쌍 및 OIDC JWT 토큰 연동 | **NAA (0x7a) 32B 인증키, 세션키 및 다중서명** | ZKRYPTON은 기업용 HSM/MPC 원격 서명자를 프로토콜 차원에서 네이티브 지원 |
| **개발자 풀 (Ecosystem Pool)** | 전 세계 수천 명 수준 (진입 장벽 높음) | **수십만 명의 글로벌 EVM/Solidity 개발자 풀** | ZKRYPTON 도입 시 엔지니어 채용 및 유지보수 비용 대폭 절감 |
