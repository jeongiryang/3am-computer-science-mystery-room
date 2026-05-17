# AI Simulation Log 0020 - 멀티룸 구조와 공간 이동 구현

## 1. 목적

단일 `LabRoom` 중심 MVP를 확장해 10분 분량 2D 미스터리 탐험 게임의 기반이 되는 멀티룸 scene 구조와 interact 기반 공간 이동 시스템을 구현함.

## 2. 사용자 프롬프트 요약

사용자는 기능 작업이므로 Issue, 작업 브랜치, PR, merge 방식으로 진행하라고 요청함.

최소 공간으로 55516, 5층 복도, 과사무실, 층 이동 구간, 55110, 공과대학 메인 건물 내부 또는 로비, 서버실 또는 최종 접근 제한 공간을 임시 블록아웃 scene으로 구성하라고 요청함.

각 공간에는 임시 도형, 텍스트 라벨, 벽 충돌 경계, 1~2개 안내/조사 오브젝트를 배치하고, interact 입력으로 다음 공간으로 이동할 수 있게 하라고 요청함.

외부 에셋, 최종 비주얼 패스, 사운드, 복잡한 새 퍼즐, README 수정, export 설정은 제외하라고 요청함.

## 3. Codex 응답 요약

GitHub Issue를 생성하고 `feature/multiroom-transition-blockout` 브랜치를 생성함.

`RoomManager.gd`를 추가해 `Main.tscn`에서 현재 room scene을 동적으로 로드하고, 전환 후 Player 위치를 spawn marker로 이동하게 함.

`TransitionZone.gd`와 `TransitionZone.tscn`을 추가해 기존 Player interact 흐름 안에서 공간 이동 지점을 처리함.

`Player.gd`에 transition 처리와 nearby interactable 초기화 함수를 추가함.

`Main.tscn`은 직접 `LabRoom`을 배치하는 구조에서 `RoomContainer`에 `RoomManager`가 현재 room을 로드하는 구조로 변경함.

7개 room scene을 임시 블록아웃으로 추가함.

## 4. 변경된 파일

- `scenes/main/Main.tscn`
- `scenes/objects/TransitionZone.tscn`
- `scenes/rooms/Room55516.tscn`
- `scenes/rooms/Hallway5F.tscn`
- `scenes/rooms/DepartmentOffice.tscn`
- `scenes/rooms/Stairwell.tscn`
- `scenes/rooms/Room55110.tscn`
- `scenes/rooms/MainBuildingLobby.tscn`
- `scenes/rooms/ServerRoom.tscn`
- `scripts/core/RoomManager.gd`
- `scripts/core/RoomManager.gd.uid`
- `scripts/objects/TransitionZone.gd`
- `scripts/objects/TransitionZone.gd.uid`
- `scripts/player/Player.gd`
- `docs/ai-simulation-logs/0020-multiroom-transition-blockout.md`

## 5. 구현 내용

- `RoomManager`가 `room_55516`을 시작 공간으로 로드함.
- 각 room scene은 `SpawnPoints`를 가지며, 전환 후 지정된 spawn marker로 Player를 이동시킴.
- `TransitionZone`은 기존 interact 액션을 사용해 대상 room으로 이동함.
- 공간 이동 흐름은 `Room55516 -> Hallway5F -> DepartmentOffice -> Stairwell -> Room55110 -> MainBuildingLobby -> ServerRoom` 순서로 구성함.
- 기존 `ExitDoor` 비밀번호 입력과 Ending 전환 흐름은 `Room55516` 안에 유지함.
- 기존 `LabRoom.tscn`은 삭제하지 않고 호환성을 위해 보존함.

## 6. 검증 내용

- `git status -sb --ignored`로 변경 파일과 ignored sidecar 상태를 확인함.
- `git diff --check`로 공백 오류가 없음을 확인함.
- `godot --version`을 실행했으며 종료 코드 0을 확인함. 출력은 없음.
- `godot --headless --path . --quit`로 프로젝트 로드 오류가 없음을 확인함.
- `godot --headless --path . --quit --scene ...`로 `Main.tscn`과 새 room scene들의 headless 로드 오류가 없음을 확인함.
- 실제 Player 이동, interact 전환, UI 흐름은 Godot 에디터 수동 테스트 필요함.

## 7. 커밋 메시지

```text
[feat] 멀티룸 구조 - 공간 이동 시스템과 임시 블록아웃 구현
```

## 8. 다음 작업

Godot 에디터에서 전체 이동 흐름을 수동 플레이 테스트한 뒤, 멀티룸 오브젝트와 단서 흐름을 확장함.
