# AI Simulation Log 0012 - 엔딩 화면 전환

## 1. 목적

ExitDoor 잠금 해제 후 다시 상호작용하면 엔딩 화면으로 전환되고, 엔딩 화면에서 다시 시작 버튼으로 Main.tscn으로 돌아갈 수 있게 구현한다.

## 2. 사용자 프롬프트 요약

사용자는 MVP 기능 구현 작업으로 엔딩 화면 Scene 생성, ExitDoor 잠금 해제 후 엔딩 전환, 엔딩 문구 표시, 다시 시작 버튼 구현을 요청했다.

작업 범위 안에서는 Codex가 issue 생성, 작업 브랜치 생성, 코드 수정, 검증, 커밋, push, PR 생성, PR merge까지 수행할 수 있다고 명시했다.

README 최종 보강, Windows/Android export 설정, 모바일 입력, 외부 에셋, 사운드, 고급 연출, 메모 확대 보기 UI, 인벤토리, 세이브/로드는 제외하도록 요청했다.

## 3. Codex 응답 요약

GitHub issue를 생성하고 `feature/ending-scene-transition` 작업 브랜치를 만들었다.

`Ending.tscn`과 `EndingScreen.gd`를 추가해 엔딩 문구와 다시 시작 버튼을 구현했다.

ExitDoor가 잠금 해제된 상태에서 다시 상호작용하면 `res://scenes/main/Ending.tscn`으로 전환되도록 Player 상호작용 흐름과 InteractableObject 상태 판단을 확장했다.

다시 시작 버튼은 `res://scenes/main/Main.tscn`으로 돌아가도록 구현했다.

## 4. 변경된 파일

- scenes/main/Ending.tscn
- scripts/ui/EndingScreen.gd
- scripts/objects/InteractableObject.gd
- scripts/player/Player.gd
- scripts/core/GameState.gd.uid
- scripts/ui/PasswordInput.gd.uid
- docs/ai-simulation-logs/0012-ending-scene-transition.md

## 5. 검증 내용

- `git status --short --ignored`로 변경/미추적/무시 파일을 확인했다.
- `git pull --ff-only origin main`으로 main이 origin/main 최신 상태임을 확인했다.
- `git diff -- project.godot`으로 project.godot에 녹화 경로나 의미 있는 diff가 없음을 확인했다.
- 프로젝트 내부 녹화 파일과 `recordings/` 폴더가 없는지 확인했다.
- `git diff --stat`으로 변경 규모를 확인했다.
- `git diff --check`에서 whitespace error가 없음을 확인했다.
- `godot --version`은 종료 코드 0으로 끝났지만 출력은 없었다.
- `godot --headless --path . --quit`은 종료 코드 0으로 끝났지만 출력은 없었다.
- Godot 에디터에서 실제 엔딩 전환과 다시 시작 버튼 동작은 수동 테스트 필요.

## 6. 커밋 메시지

```text
[feat] 엔딩 흐름 - 출입문 해제 후 엔딩 전환 구현
```

## 7. 다음 작업

Godot 에디터에서 MVP 전체 흐름을 수동 확인한 뒤, README 보강과 플레이 스크린샷 반영 또는 Windows export 설정을 진행한다.
