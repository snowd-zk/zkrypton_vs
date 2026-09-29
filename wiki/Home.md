# 🏛️ 금융 인프라 블록체인 심층 분석 WIKI
## Canton Network · Circle Arc · ZKRYPTON & 금융당국 규제 분석 허브

본 위키는 **금융감독원, 금융위원회, 한국은행** 등 국내 금융당국이 주목하고 있는 글로벌 차세대 기관용 금융 블록체인 인프라(**Canton Network**, **Circle Arc**)의 기술 아키텍처와 규제 준수성을 심층 분석하고, 지크립토(zkrypto)의 차세대 기관용 블록체인 **ZKRYPTON**의 기술적 차별화 및 제도적 포지셔닝 전략을 체계화한 지식베이스입니다.

---

## 📌 배경 및 리서치 목적

2026년 하반기, 글로벌 및 국내 금융권은 블록체인 기술의 단순 PoC 단계를 넘어 **실제 자본시장 및 제도권 통화 인프라의 블록체인화(On-Chain Institutional Settlement)** 단계에 본격 진입하였습니다.

1. **글로벌 금융 시장의 지각변동**:
   - **Canton Network (Digital Asset)**: DTCC, Euroclear, BNY Mellon, Goldman Sachs 등 글로벌 초대형 금융기관들이 참여하여 프라이버시 보장과 원장 간 원자적 동시결제(Atomic DvP)를 구현하는 상호운용 금융 네트워크로 부상.
   - **Circle Arc (Circle L1)**: 2026년 9월 메인넷을 공식 출시하며, 휘발성 네이티브 토큰 대신 **USDC를 네이티브 가스 토큰**으로 채택하고 BlackRock, Visa, Mastercard, DTCC 등 초대형 금융 컨소시엄을 밸리데이터로 확보하여 '인터넷의 경제 OS'를 표방.
2. **국내 금융당국(금감원·금융위·한국은행)의 정책적 관심 집중**:
   - **토큰증권(STO)**: 분산원장의 법적 효력 인정, 계좌관리기관 인가 요건, 투자자 보호 및 분산원장 기재 요건 법제화.
   - **스테이블코인 및 예금토큰**: 가상자산이용자보호법 2단계(디지털자산기본법), 원화/외화 스테이블코인 규율체계, 한국은행 CBDC 및 아고라(Agora) 프로젝트 연계.
   - **기관 자본시장 인프라 & 금융 망분리**: 전자금융감독규정 개정에 따른 SaaS·클라우드·블록체인 활용 가이드라인, 결제완결성(채무자회생법 특례) 보장.
3. **ZKRYPTON의 전략적 포지셔닝**:
   - Rust Reth/Revm 고성능 EVM 엔진, zkBFT 합의, 네이티브 계정 추상화(NAA), Arkworks 기반 BN254 영지식 증명(ZKP) 프리컴파일을 탑재한 ZKRYPTON이 글로벌 외산 체인 대비 제공할 수 있는 **프라이버시-컴플라이언스 양립 구조**와 **국내 제도권 최적화 전략** 확립.

---

## 🧭 위키 문서 구조 (Wiki Navigation)

```text
wiki/
├── Home.md                                   # [현재 문서] 위키 메인 및 총괄 개요
├── 01_Canton_Network_Deep_Dive.md            # Canton Network 아키텍처 및 기관 금융 생태계 심층 분석
├── 02_Circle_Arc_Chain_Deep_Dive.md          # Circle Arc L1 체인, USDC 가스 모델 및 결제 인프라 심층 분석
├── 03_Regulatory_Compliance_Analysis.md      # 금감원·금융위 3대 핵심 의제(스테이블코인, 자본시장, STO) 규제 분석
├── 04_Comparative_Matrix_and_ZKRYPTON_Strategy.md # 4대 축 비교 매트릭스 및 ZKRYPTON 차별화 전략
├── 05_Canton_Network_Developer_Guide.md      # Canton & Daml 스마트 계약, Ledger API 및 개발자 가이드
├── 06_Circle_Arc_Developer_Guide.md          # Circle Arc EVM 아키텍처, USDC 가스리스 및 CCTP 개발자 가이드
├── 07_Canton_Network_Compliance_Guide.md     # Canton 계약 법률 강제, 금융 프라이버시 및 감독 가시성 가이드
├── 08_Circle_Arc_Compliance_Guide.md         # Circle Arc 준비자산 신탁, 사법 집행 동결권 및 트래블룰 가이드
├── _Sidebar.md                               # GitHub Wiki 사이드바 네비게이션
└── _Footer.md                                # 위키 공통 푸터
```

### 📑 모듈별 핵심 내용 요약

| 영역 | 문서 | 대상 체인 / 주제 | 주요 다룸 내용 |
| :--- | :--- | :--- | :--- |
| **코어 아키텍처** | [**01. Canton Network 개요**](https://github.com/snowd-zk/zkrypton_vs/wiki/01_Canton_Network_Deep_Dive) | Canton Network | Daml 계약 모델, Sub-transaction Privacy, Global Synchronizer |
| **코어 아키텍처** | [**02. Circle Arc 개요**](https://github.com/snowd-zk/zkrypton_vs/wiki/02_Circle_Arc_Chain_Deep_Dive) | Circle Arc L1 | USDC 네이티브 가스, Malachite 합의, BlackRock/Visa 밸리데이터셋 |
| **개발자 실무** | [**05. Canton 개발자 가이드**](https://github.com/snowd-zk/zkrypton_vs/wiki/05_Canton_Network_Developer_Guide) | Daml & Canton API | Daml STO/DvP 코드 예제, gRPC Ledger API, JSON API v2 연동 |
| **개발자 실무** | [**06. Circle Arc 개발자 가이드**](https://github.com/snowd-zk/zkrypton_vs/wiki/06_Circle_Arc_Developer_Guide) | Arc EVM & CCTP | USDC 가스 측정, EIP-3009 가스리스 서명, Foundry 배포, CCTP v2 |
| **컴플라이언스** | [**07. Canton 컴플라이언스**](https://github.com/snowd-zk/zkrypton_vs/wiki/07_Canton_Network_Compliance_Guide) | 금융 법제 & 감독 | 전자서명 구속력, 금융실명법/신용정보법 준수, Auditor 노드 SupTech |
| **컴플라이언스** | [**08. Circle Arc 컴플라이언스**](https://github.com/snowd-zk/zkrypton_vs/wiki/08_Circle_Arc_Compliance_Guide) | 준비자산 & 사법집행 | 100% 분리 신탁(도산격리), blacklist 동결권 영장 집행, 트래블룰 |
| **금융당국 총괄** | [**03. 금융당국 3대 의제 분석**](https://github.com/snowd-zk/zkrypton_vs/wiki/03_Regulatory_Compliance_Analysis) | 금감원·금융위·한은 | 스테이블코인 2단계, 자본시장 결제완결성/망분리, STO 전자등록 |
| **종합 전략** | [**04. 종합 비교 및 전략**](https://github.com/snowd-zk/zkrypton_vs/wiki/04_Comparative_Matrix_and_ZKRYPTON_Strategy) | 종합 비교 & ZKRYPTON | 4대 축 종합 비교표, ZKRYPTON NAA(0x7a) & Arkworks ZKP 차별화 |

---

## 📊 종합 핵심 아키텍처 비교 한눈에 보기

```mermaid
flowchart TB
    subgraph Regulatory["🏛️ 대한민국 금융당국 (금감원 / 금융위 / 한국은행)"]
        REG1["가상자산이용자보호법 2단계<br>(스테이블코인 규율)"]
        REG2["전자등록법·자본시장법<br>(토큰증권 STO 제도화)"]
        REG3["전자금융감독규정<br>(망분리 완화 & 감사 가시성)"]
    end

    subgraph Canton["Canton Network (Digital Asset)"]
        C1["Daml 계약 모델"]
        C2["Sub-transaction Privacy<br>(Need-to-know 뷰 투영)"]
        C3["Global Synchronizer<br>(Sequencer + Mediator)"]
    end

    subgraph Arc["Circle Arc (Circle L1)"]
        A1["EVM 호환 (Chain ID 5042)"]
        A2["USDC 네이티브 가스 토큰"]
        A3["Malachite 합의<br>(BlackRock, Visa 등 밸리데이터)"]
    end

    subgraph Zkrypton["ZKRYPTON (zkrypto)"]
        Z1["Rust Reth/Revm 코어 + NAA (0x7a)"]
        Z2["Arkworks BN254 ZK 프리컴파일<br>(영지식 프라이버시 & 규제 감사)"]
        Z3["zkBFT 합의 + MPC/SEV/eBPF 보안"]
    end

    Regulatory -.-> Canton
    Regulatory -.-> Arc
    Regulatory ==> Zkrypton
```

---

## 👥 대상 독자 및 활용 가이드
- **사내 엔지니어링 & 연구진**: Canton의 Daml/동기화 프로토콜 및 Circle Arc의 가스 추상화 메커니즘을 ZKRYPTON의 zkBFT 및 NAA(Type 0x7a) 고도화에 참고.
- **사업개발(BD) & 금융 컨소시엄 기획팀**: 삼성SDS 등 엔터프라이즈 파트너와의 공동 금융 PoC, 은행권 토큰화 예금 및 STO 인프라 제안서 작성 시 벤치마킹 데이터로 활용.
- **대관 및 컴플라이언스 담당자**: 금감원, 금융위 디지털자산TF, 한국은행 CBDC 실증사업단과의 정책 질의 및 규제 샌드박스 신청 시 논리적 근거로 활용.
