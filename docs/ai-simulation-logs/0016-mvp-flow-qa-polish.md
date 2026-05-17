# AI Simulation Log 0016 - MVP 플레이 흐름 QA와 기본 UX 정리

## 1. 목적

현재 구현된 MVP 플레이 흐름을 점검하고, 사용자가 처음부터 엔딩까지 더 자연스럽게 진행할 수 있도록 기본 UX와 입력 흐름을 정리함.

## 2. 사용자 프롬프트 요약

사용자는 Player 이동, 벽 충돌, 조사 오브젝트 5개, DialogueBox, PasswordInput, 비밀번호 오답/정답 메시지, ExitDoor 엔딩 전환, Ending scene 다시 시작 흐름을 점검하고 필요한 문제를 수정하도록 요청함.

이번 작업은 코드/씬 수정 가능성이 있으므로 Issue, 작업 브랜치, PR, merge 방식으로 진행하도록 요청함.

README 최종 보강, export 설정, 외부 에셋, 사운드, 새 퍼즐, 새 방, 고급 연출은 제외하도록 요청함.

## 3. Codex 응답 요약

GitHub Issue #11을 생성하고 `fix/mvp-flow-qa-polish` 작업 브랜치를 생성함.

Main scene에 기본 조작 안내 UI를 추가함.

InspectableObject에 오브젝트 이름 라벨을 추가해 임시 도형 오브젝트를 구분하기 쉽게 정리함.

DialogueBox 메시지에 닫기 안내를 자동으로 붙이고, 닫을 때 텍스트를 비우도록 수정함.

PasswordInput에 제출/취소 안내 문구를 추가하고, 닫힐 때 입력 focus를 해제하도록 수정함.

PasswordInput이 열린 상태에서 interact 입력이 Player 상호작용으로 이어지지 않도록 입력을 처리함.

비밀번호 오답 메시지를 재입력 유도 문장으로 보강함.

## 4. 변경된 파일

- `scenes/main/Main.tscn`
- `scenes/objects/InspectableObject.tscn`
- `scenes/ui/PasswordInput.tscn`
- `scripts/objects/InteractableObject.gd`
- `scripts/player/Player.gd`
- `scripts/ui/DialogueBox.gd`
- `scripts/ui/PasswordInput.gd`
- `docs/ai-simulation-logs/0016-mvp-flow-qa-polish.md`

## 5. 검증 내용

- `git status -sb --ignored`로 main 최신 상태와 임시 screenshot PNG 제외 상태를 확인함.
- `git diff -- project.godot`으로 녹화 경로나 의미 없는 diff가 없음을 확인함.
- 프로젝트 내부 `recordings/` 폴더가 없고 임시 screenshot PNG만 존재함을 확인함.
- `git diff --stat`으로 변경 규모를 확인함.
- `git diff --check`에서 whitespace error 없음 확인함.
- `godot --headless --path . --quit`은 종료 코드 0으로 끝났지만 출력은 없음.
- `godot --headless --path . --scene res://scenes/main/Main.tscn --quit`은 종료 코드 0으로 끝났지만 출력은 없음.
- `godot --headless --path . --scene res://scenes/main/Ending.tscn --quit`은 종료 코드 0으로 끝났지만 출력은 없음.
- `godot --version`은 종료 코드 0으로 끝났지만 출력은 없음.
- 실제 키보드 입력, 벽 충돌, UI 표시 위치, 엔딩 전환, 다시 시작 후 상태 초기화는 Godot 에디터 수동 테스트 필요.

## 6. 커밋 메시지

```text
[fix] MVP 플레이 흐름 - 전체 QA와 기본 UX 정리
```

## 7. 다음 작업

Godot 에디터에서 MVP 전체 수동 테스트를 진행한 뒤, README 최신화와 플레이 스크린샷 반영 또는 Windows export 설정을 진행함.
