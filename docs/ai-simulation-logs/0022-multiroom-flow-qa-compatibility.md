# AI Simulation Log 0022 - 멀티룸 플레이 흐름 QA와 호환성 정리

## 1. 목적

멀티룸 구조와 공간 이동 시스템이 기존 조사 UI, 비밀번호 입력 UI, ExitDoor 잠금/해제, Ending 전환 흐름과 충돌하지 않도록 점검하고 필요한 최소 수정만 적용함.

## 2. 사용자 프롬프트 요약

사용자는 기능 QA 작업이므로 Issue, 작업 브랜치, PR, merge 방식으로 진행하라고 요청함.

점검 범위는 `Main.tscn` 시작 흐름, `Room55516` spawn, 7개 room 이동 흐름, 벽 충돌, 전환 후 Player 위치, TransitionZone과 InspectableObject 입력 충돌, DialogueBox/PasswordInput 열린 상태의 중복 입력 방지, 기존 조사/비밀번호/엔딩 흐름 유지 여부임.

새 room, 새 퍼즐, 외부 에셋, 최종 비주얼/사운드 패스, export 설정, README 수정은 제외하라고 요청함.

## 3. Codex 응답 요약

GitHub Issue를 생성하고 `fix/multiroom-flow-qa-compatibility` 브랜치를 생성함.

기존 멀티룸 구조와 Player 상호작용 흐름을 점검함.

`RoomManager.gd`에 room 전환 중 중복 호출을 막는 `is_changing_room` guard를 추가함.

`Player.gd`에 유효하지 않은 nearby interactable 참조를 정리하는 `_prune_invalid_interactables()`를 추가함.

DialogueBox와 PasswordInput이 열린 상태에서는 기존 Player 입력 처리 순서상 공간 이동이 발생하지 않음을 확인함.

## 4. 변경된 파일

- `scripts/core/RoomManager.gd`
- `scripts/player/Player.gd`
- `docs/ai-simulation-logs/0022-multiroom-flow-qa-compatibility.md`

## 5. 검증 내용

- `git status -sb --ignored`로 변경 파일과 ignored sidecar 상태를 확인함.
- `git diff --check`로 공백 오류를 확인함.
- `godot --version`을 실행함.
- `godot --headless --path . --quit`로 프로젝트 로드 오류를 확인함.
- 주요 scene을 `godot --headless --path . --quit --scene ...`로 로드 검증함.
- 실제 키 입력 기반 공간 이동, 벽 충돌, 기존 비밀번호/엔딩 흐름은 Godot 에디터 수동 테스트 필요함.

## 6. 커밋 메시지

```text
[fix] 멀티룸 플레이 흐름 - 공간 이동 QA와 기존 기능 호환성 정리
```

## 7. 다음 작업

Godot 에디터에서 전체 멀티룸 이동과 기존 MVP 비밀번호/엔딩 흐름을 수동 QA한 뒤, 공간별 단서와 이벤트를 확장함.
