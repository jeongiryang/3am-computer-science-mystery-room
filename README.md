# 3AM Computer Science: Mystery Room

## 한국어 제목

새벽 3시, 컴퓨터공학과: 미스터리룸

## 프로젝트 개요

`3AM Computer Science: Mystery Room`은 Godot 4로 제작하는 짧은 2D 인터랙티브 미스터리 룸 게임입니다.

플레이어는 새벽 3시 컴퓨터공학과 실습실 안에서 깨어나고, 잠긴 공간을 조사하며 단서와 비밀번호를 찾아 탈출해야 합니다. 이 프로젝트는 추후 컴퓨터공학관을 배경으로 한 1인칭 호러 탐험 게임으로 확장될 수 있는 미스터리/호러 세계관의 첫 번째 작은 프로토타입입니다.

현재 단계는 초기 저장소 및 Godot 프로젝트 스캐폴딩입니다. 아직 실제 게임플레이, 씬, 스크립트, 외부 에셋은 포함되어 있지 않습니다.

## 개발 환경

- Engine: Godot 4.x
- Language: GDScript
- Genre: 2D interactive mystery room
- Target platform: Windows
- Version control: Git / GitHub
- Main editor: Visual Studio Code
- Godot extension: godot-tools
- Git helper extension: GitLens

## 게임 콘셉트

플레이어는 밤늦게 텅 빈 컴퓨터공학과 실습실에서 깨어납니다. 문은 잠겨 있고, 실습실 안에는 이상하게 남겨진 메모, 컴퓨터 화면, 화이트보드, 잠금 장치가 있습니다.

플레이어는 공간을 탐색하며 단서를 모으고, 단서 사이의 관계를 추론해 비밀번호를 알아내야 합니다. 최종적으로 잠긴 문을 열고 실습실에서 탈출하는 것이 목표입니다.

## 조작

아직 조작 시스템은 구현되지 않았습니다. 이후 첫 플레이어블 버전에서는 다음 조작을 기본으로 계획합니다.

- 이동: `WASD` 또는 방향키
- 상호작용: `E`
- UI 닫기 또는 메뉴: `Esc`

## 핵심 게임플레이 기능

초기 플레이어블 버전에서 계획하는 핵심 기능은 다음과 같습니다.

- 2D 실습실 탐색
- 오브젝트 상호작용
- 단서와 메모 확인
- 비밀번호 퍼즐 풀이
- 잠긴 문 해제
- 짧은 엔딩 연출

## 현재 개발 체크리스트

- [x] 초기 폴더 구조 생성
- [x] Godot 4용 `.gitignore` 작성
- [x] 최소 `project.godot` 생성
- [x] README 작성
- [x] 기본 문서 파일 생성
- [ ] 메인 씬 생성
- [ ] 플레이어 이동 구현
- [ ] 상호작용 시스템 구현
- [ ] 비밀번호 퍼즐 구현
- [ ] 엔딩 흐름 구현
- [ ] Windows 빌드 테스트

## 계획된 릴리스 흐름

1. 초기 저장소 및 문서 구조 정리
2. Godot 4 프로젝트 기본 설정
3. 최소 플레이어블 씬 제작
4. 실습실 오브젝트와 단서 배치
5. 비밀번호 퍼즐과 탈출 조건 구현
6. 사운드와 간단한 연출 추가
7. Windows 빌드 생성
8. itch.io 업로드
9. 짧은 게임플레이 영상 녹화
10. 포트폴리오용 README 보강

## 저장소 구조

```text
.
├── assets/
│   ├── art/
│   │   ├── characters/
│   │   ├── objects/
│   │   ├── rooms/
│   │   └── ui/
│   ├── audio/
│   │   ├── bgm/
│   │   └── sfx/
│   └── fonts/
├── scenes/
│   ├── main/
│   ├── rooms/
│   ├── player/
│   ├── objects/
│   └── ui/
├── scripts/
│   ├── core/
│   ├── player/
│   ├── objects/
│   └── ui/
├── docs/
│   ├── game-design-document.md
│   ├── development-log.md
│   └── asset-credits.md
├── screenshots/
├── builds/
├── AGENTS.md
├── README.md
├── .gitignore
└── project.godot
```

`builds/`는 내보낸 실행 파일과 패키지 파일을 보관하는 로컬 출력 폴더입니다. 빌드 결과물은 Git에 포함하지 않습니다.
