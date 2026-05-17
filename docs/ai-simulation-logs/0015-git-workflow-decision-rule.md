# AI Simulation Log 0015 - Git 작업 방식 판단 규칙 추가

## 1. 목적

Codex 작업에서 모든 변경을 무조건 Issue/PR로 처리하지 않고, 작업 성격에 따라 PR 방식과 main 직접 커밋 방식을 구분하는 규칙을 AGENTS.md에 추가함.

## 2. 사용자 프롬프트 요약

사용자는 기능 구현, 코드 로직 변경, Godot scene 변경, 빌드/export 설정 변경은 계속 Issue + 작업 브랜치 + PR + merge 방식으로 진행하도록 요청함.

사소한 문서 정리, AI 작업 로그 추가, `.uid` 파일 추적 정리, `.gitignore` 최소 보강 같은 낮은 위험 작업은 main 브랜치에 직접 커밋하고 push할 수 있도록 허용함.

이번 작업은 낮은 위험의 운영 규칙 보강 작업이므로 main 직접 커밋/push를 허용함.

## 3. Codex 응답 요약

`AGENTS.md`에 Git 작업 방식 판단 기준을 추가함.

PR이 필요한 작업과 낮은 위험으로 main 직접 커밋할 수 있는 작업을 구분함.

main 직접 push 전후 확인 절차와 계속 금지되는 작업 목록을 명시함.

이번 작업의 AI 작업 로그를 `0015-git-workflow-decision-rule.md`로 추가함.

## 4. 변경된 파일

- `AGENTS.md`
- `docs/ai-simulation-logs/0015-git-workflow-decision-rule.md`

## 5. 검증 내용

- `git status -sb --ignored`로 현재 branch와 미추적/무시 파일 상태 확인함.
- `git diff`로 변경 범위가 `AGENTS.md`와 새 AI 작업 로그에 제한됨을 확인함.
- `git diff --check`에서 whitespace error 없음 확인함.
- `godot --headless --path . --quit`은 종료 코드 0으로 끝났지만 출력은 없음.

## 6. 커밋 메시지

```text
[chore] Git 작업 방식 - PR 필요 여부 판단 규칙 추가
```

## 7. 다음 작업

Godot 에디터에서 MVP 전체 흐름을 수동 확인하고, README 최신화 또는 Windows export 설정 작업을 진행함.
