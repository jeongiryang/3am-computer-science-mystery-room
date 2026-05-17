# AI Simulation Log 0017 - README 스크린샷 정리와 MVP 상태 반영

## 1. 목적

`screenshots/` 폴더의 스크린샷을 원본 보관용 `raw`와 README 삽입용 `readme` 이미지로 정리하고, README를 현재 MVP 구현 상태에 맞게 최신화함.

## 2. 사용자 프롬프트 요약

사용자는 기존 및 새 스크린샷을 `screenshots/raw/`에 정리하고, 이미지 내용을 분석해 README 스크린샷 섹션에 적절히 매핑하도록 요청함.

게임 코드, Godot scene, GDScript 로직, `project.godot`, export 설정, 외부 에셋은 수정하지 말라고 요청함.

이번 작업은 낮은 위험 문서 작업이므로 AGENTS.md 기준에 따라 main 직접 커밋/push가 가능하다고 명시함.

## 3. Codex 응답 요약

`screenshots/raw/`와 `screenshots/readme/` 폴더를 생성함.

루트 `screenshots/`에 있던 PNG 스크린샷 원본을 `screenshots/raw/`로 이동함.

README 대표 이미지 4장을 `screenshots/readme/`에 영문 파일명으로 복사함.

README를 현재 MVP 상태, 플레이 흐름, 조작법, 주요 기능, 스크린샷, 실행 방법, AI/Codex 활용 방식, 향후 작업, 라이선스/에셋 상태 중심으로 최신화함.

`screenshots/**/*.png.import`가 커밋되지 않도록 `.gitignore`를 최소 보강함.

## 4. 변경된 파일

- `.gitignore`
- `README.md`
- `docs/ai-simulation-logs/0017-readme-screenshot-organization.md`
- `screenshots/raw/*.png`
- `screenshots/readme/*.png`

## 5. README 스크린샷 매핑

- `screenshots/readme/01-lab-room.png`: 실습실 전체 화면
- `screenshots/readme/02-inspection-dialogue.png`: 조사 텍스트 UI
- `screenshots/readme/03-password-input.png`: 비밀번호 입력 UI
- `screenshots/readme/04-ending-screen.png`: 엔딩 화면

## 6. raw 보관 스크린샷

- `screenshots/raw/스크린샷 2026-05-16 092606.png`
- `screenshots/raw/스크린샷 2026-05-17 161833.png`
- `screenshots/raw/스크린샷 2026-05-17 161838.png`
- `screenshots/raw/스크린샷 2026-05-17 161846.png`
- `screenshots/raw/스크린샷 2026-05-17 161852.png`
- `screenshots/raw/스크린샷 2026-05-17 161858.png`
- `screenshots/raw/스크린샷 2026-05-17 161907.png`
- `screenshots/raw/스크린샷 2026-05-17 162250.png`
- `screenshots/raw/스크린샷 2026-05-17 165501.png`
- `screenshots/raw/스크린샷 2026-05-17 182144.png`
- `screenshots/raw/스크린샷 2026-05-17 182154.png`
- `screenshots/raw/스크린샷 2026-05-17 182201.png`
- `screenshots/raw/스크린샷 2026-05-17 182209.png`
- `screenshots/raw/스크린샷 2026-05-17 182215.png`
- `screenshots/raw/스크린샷 2026-05-17 182220.png`
- `screenshots/raw/스크린샷 2026-05-17 182226.png`
- `screenshots/raw/스크린샷 2026-05-17 182232.png`

## 7. 매핑 보류

대표 이미지로 선택하지 않은 raw 스크린샷은 중복 장면 또는 이전 상태 캡처로 판단해 README 매핑을 보류함.

## 8. 검증 내용

- `git status -sb --ignored`로 main 최신 상태와 ignored sidecar 상태 확인함.
- `Get-ChildItem`으로 `screenshots/` 내부 PNG 파일과 import sidecar를 확인함.
- 이미지 내용을 직접 확인해 README 대표 장면 4개를 선택함.
- `Test-Path`로 README 이미지 경로 4개가 실제 파일과 일치함을 확인함.
- `git diff -- project.godot`으로 `project.godot` 변경이 없음을 확인함.
- 프로젝트 내부 녹화 영상 파일이 없음을 확인함.
- `screenshots/*.png.import`는 ignored 상태이며 커밋 대상에서 제외됨을 확인함.

## 9. 커밋 메시지

```text
[docs] README 최신화 - 스크린샷 정리와 MVP 상태 반영
```

## 10. 다음 작업

Godot 에디터에서 README 스크린샷과 실제 MVP 흐름을 함께 확인한 뒤, Windows export 설정 또는 최종 포트폴리오 문서 정리를 진행함.
