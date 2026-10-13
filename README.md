# 🛡️ ZKRYPTON 블록체인 분석 & 리서치 프로젝트

지크립토(zkrypto)의 차세대 블록체인 **ZKRYPTON**에 대한 기술적·사업적 심층 분석과 글로벌 블록체인 프로젝트 리서치 및 벤치마킹을 체계적으로 수행·관리하기 위한 프로젝트 저장소입니다.

---

## 🎯 프로젝트 목적

1. **ZKRYPTON 자체 블록체인 심층 분석 및 문서화**
   - 아키텍처(체인 어댑터, 정책 엔진, 합의 메커니즘 등) 체계화
   - 영지식 증명(ZKP) 기반 프라이버시 보호 구조 및 회로 설계 분석
   - 키 관리 및 보안 모델(MPC 셰어볼트, HSM/sHSM, AMD SEV, eBPF & SELinux, HD 월렛) 정리
   - 인프라(Blockscout, SCP 자원 등) 및 마일스톤(SDS 협력, 연말 제품화, PoC) 관리
2. **글로벌 블록체인 프로젝트 리서치 & 벤치마킹**
   - ZK/Privacy L1/L2, 엔터프라이즈 컨소시엄, 모듈러 롤업, 기관용 MPC 커스터디 프로젝트 조사
   - ZKRYPTON과의 기술·비즈니스 비교 분석(Comparative Matrix) 도출 및 차별화 전략 수립
3. **대내외 기술 문서 및 커뮤니케이션 자산화**
   - 기술 명세(API, Data Model), 경영진/팀 내부 보고서, 대외 파트너/IR 발표 자료 표준화

---

## 📂 디렉토리 구조

```text
ZKRYPTON/
├── 00_Templates_References/             # 공통 문서 템플릿 및 외부 참고자료
│   ├── Templates/                       # ZKRYPTON 분석 및 리서치 표준 템플릿
│   │   ├── zkrypton_analysis_template.md
│   │   └── project_research_template.md
│   └── References/                      # 백서, 학술 논문, 발표자료 및 링크 모음
│
├── 01_ZKRYPTON_Analysis/                # [자사] ZKRYPTON 심층 분석 & 기술 정리
│   ├── 01_Architecture/                 # 시스템 아키텍처, 체인 어댑터, 정책 엔진
│   ├── 02_ZKP_Privacy/                  # 영지식 증명(ZKP), 회로 설계, 프라이버시 트랜잭션
│   ├── 03_Key_Management_Security/     # 키 관리 (MPC, HSM/sHSM, SEV, eBPF, HD Wallet)
│   ├── 04_Ecosystem_Infra/              # 익스플로러(Blockscout), 노드/클라우드 자원(SCP), SDK
│   └── 05_Roadmap_Milestones/           # 개발 로드맵, SDS 등 협력 과제, PoC 진행 현황
│
├── 02_Market_Research/                  # [외부] 블록체인 프로젝트 리서치 & 벤치마킹
│   ├── 01_ZK_Privacy_Chains/            # ZK/Privacy 체인 (Aleo, Mina, Aztec, Starknet 등)
│   ├── 02_Enterprise_Consortium/        # 엔터프라이즈 체인 (Nexledger, Hyperledger, Quorum 등)
│   ├── 03_Modular_Rollup/               # 모듈러 블록체인 (Celestia, Rollup 솔루션)
│   ├── 04_MPC_Institutional_Custody/    # MPC 지갑 & 기관용 커스터디 (Fireblocks 등)
│   └── 05_Comparative_Analysis/         # ZKRYPTON vs 경쟁사 비교 분석표 및 종합 리포트
│
├── 03_Technical_Specs/                  # ZKRYPTON 세부 기술 명세서
│   ├── API_Specs/                       # 체인 어댑터, RPC, 정책 엔진 API 명세
│   └── Data_Models/                     # 트랜잭션/블록 스키마, Proof 직렬화 포맷
│
├── 04_Presentations_Reports/            # 대내외 브리핑 & 발표 자료
│   ├── Internal_Briefings/              # 경영진/팀 공유용 요약 보고서 및 회의 안건
│   └── External_Materials/              # 파트너 미팅(SDS 등), IR, 대외 기술 소개서
│
└── wiki/                                # 🏛️ 금융 인프라 & 규제 심층 분석 WIKI
    ├── Home.md                          # 위키 메인 허브 및 총괄 개요
    ├── 01_Canton_Network_Deep_Dive.md   # Canton Network 개요 (Daml, 프라이버시, DvP)
    ├── 02_Circle_Arc_Chain_Deep_Dive.md # Circle Arc L1 개요 (USDC 가스, Malachite 합의)
    ├── 03_Regulatory_Compliance_Analysis.md # 금감원·금융위 3대 의제(스테이블코인, 자본시장, STO)
    ├── 04_Comparative_Matrix_and_ZKRYPTON_Strategy.md # 4대 축 비교 및 ZKRYPTON 전략
    ├── 05_Canton_Network_Developer_Guide.md  # Canton & Daml 개발자 심층 가이드
    ├── 06_Circle_Arc_Developer_Guide.md      # Circle Arc EVM & CCTP 개발자 심층 가이드
    ├── 07_Canton_Network_Compliance_Guide.md # Canton 금융 법제 & 감독 가시성 가이드
    ├── 08_Circle_Arc_Compliance_Guide.md     # Circle Arc 준비자산 & 사법집행 동결권 가이드
    └── 09_ZKRYPTON_FAQ_and_Canton_Comparison.md # ZKRYPTON 장단점, Canton 커밋먼트 비교 & 고객사 FAQ 20선
```

---

## 🛠️ 작업 가이드라인 (Workflow)

### 1. ZKRYPTON 내부 기능/모듈 문서 작성 시
1. [`00_Templates_References/Templates/zkrypton_analysis_template.md`](00_Templates_References/Templates/zkrypton_analysis_template.md)를 복사하여 `01_ZKRYPTON_Analysis/` 하위 해당 폴더에 배치합니다.
2. 시스템 구조, 적용 기술, 보안 수준, 그리고 개발 현황(완료/미완/블로커)을 단계적으로 정리합니다.

### 2. 외부 블록체인 프로젝트 리서치 시
1. [`00_Templates_References/Templates/project_research_template.md`](00_Templates_References/Templates/project_research_template.md)를 복사하여 `02_Market_Research/` 하위 해당 폴더에 배치합니다.
2. 개요 및 기술 아키텍처 분석 후, 반드시 **"ZKRYPTON에 주는 시사점 및 차별화 포인트"**를 기록합니다.

---

## 📚 핵심 분석 문서 바로가기 (2026.09.28 기준)

- 🏗️ **코어 아키텍처 & 합의**: [`01_ZKRYPTON_Analysis/01_Architecture/01_rust_evm_core_architecture.md`](01_ZKRYPTON_Analysis/01_Architecture/01_rust_evm_core_architecture.md)
  - Rust Reth/Revm 기반 EVM 엔진, zkBFT 합의, BLS 집계 서명, Stable Leader N-블록 재임(Tenure) 알고리즘
- 🔐 **네이티브 계정 추상화 (NAA)**: [`01_ZKRYPTON_Analysis/01_Architecture/02_native_account_abstraction_naa.md`](01_ZKRYPTON_Analysis/01_Architecture/02_native_account_abstraction_naa.md)
  - Unsigned Type 0x7a, 2단계 검증(병렬)/실행(순차), 32B 인증키, Max-fee Escrow 사전 차감 및 정산
- ⚡ **실용적 ZK 검증 & 프리컴파일**: [`01_ZKRYPTON_Analysis/02_ZKP_Privacy/01_zk_verification_and_precompiles.md`](01_ZKRYPTON_Analysis/02_ZKP_Privacy/01_zk_verification_and_precompiles.md)
  - Arkworks BN254 프리컴파일 패치, 페어링 캐시(`ZKRYPTON_BN254_PAIR_CACHE_ENTRIES`), zkVoting 구조 및 IPC 프레이밍 분석
- 🛡️ **합의 안전성 & 키 관리**: [`01_ZKRYPTON_Analysis/03_Key_Management_Security/01_consensus_safety_and_recovery.md`](01_ZKRYPTON_Analysis/03_Key_Management_Security/01_consensus_safety_and_recovery.md)
  - State WAL / Signing WAL 이원화 영속성, Monotonic Signing Floor(`SafetyTransactionV1`), 원격 서명자(Remote Signer)
- 📊 **성능 벤치마크 & 출시 로드맵**: [`01_ZKRYPTON_Analysis/05_Roadmap_Milestones/01_performance_benchmarks_and_roadmap.md`](01_ZKRYPTON_Analysis/05_Roadmap_Milestones/01_performance_benchmarks_and_roadmap.md)
  - 1k~10k TPS 부하 테스트 결과, 4-Validator E2E 검증, F1~F6 현안 및 10월 초 테스트넷 / 10월 말 메인넷 로드맵
- 📑 **경영진 브리핑 리포트**: [`04_Presentations_Reports/Internal_Briefings/2026-09-28_ZKRYPTON_Executive_Summary.md`](04_Presentations_Reports/Internal_Briefings/2026-09-28_ZKRYPTON_Executive_Summary.md)
  - 전사 공유용 종합 요약 및 권고사항
- 🏛️ **금융 인프라 & 금융당국 규제 분석 WIKI**: [`wiki/Home.md`](wiki/Home.md)
  - Canton Network · Circle Arc 심층 리서치, 금감원 3대 금융의제(스테이블코인, 자본시장, STO) 분석 및 ZKRYPTON 종합 전략

