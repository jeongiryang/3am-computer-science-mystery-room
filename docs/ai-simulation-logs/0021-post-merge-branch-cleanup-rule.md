# AI Simulation Log 0021 - PR merge 후 브랜치 정리 규칙 추가

## 1. 목적

PR merge 후 원격 작업 브랜치, 로컬 작업 브랜치, 로컬 `main` 최신화 상태를 Codex가 일관되게 정리하고 보고하도록 AGENTS.md 운영 규칙을 보강함.

## 2. 사용자 프롬프트 요약

사용자는 게임 기능 구현이 아니라 운영 규칙 보강을 요청함.

PR merge 시 가능한 경우 `gh pr merge <PR_NUMBER> --squash --delete-branch`를 우선 사용하고, merge 후 `git checkout main`, `git pull --ff-only origin main`, `git fetch --prune`를 수행하도록 규칙을 추가하라고 요청함.

작업 완료 보고에는 PR merge 여부, merge 방식, 원격/로컬 작업 브랜치 삭제 여부, `git fetch --prune` 실행 여부, main 최신화 여부, cleanup 실패 이유를 포함하라고 요청함.

## 3. Codex 응답 요약

AGENTS.md에 GitHub Issue and Pull Request Rule, Post-Merge Branch Cleanup Rule, Allowed Terminal Commands, End-of-Run Report Rule을 추가함.

Restricted Operations의 branch deletion 규칙은 Post-Merge Branch Cleanup Rule 또는 사용자 명시 요청에 한해서만 허용되도록 충돌을 정리함.

이번 작업은 낮은 위험 운영 규칙 보강 작업이며, 사용자가 main 직접 커밋/push를 허용했기 때문에 PR 없이 main 직접 커밋 방식으로 진행함.

## 4. 변경된 파일

- `AGENTS.md`
- `docs/ai-simulation-logs/0021-post-merge-branch-cleanup-rule.md`

## 5. 검증 내용

- `git status -sb --ignored`로 main과 origin/main 상태 및 ignored 파일을 확인함.
- `git diff`로 변경 범위가 AGENTS.md와 이번 AI 작업 로그에 한정됨을 확인함.
- `git diff --check`로 Markdown 공백 오류를 확인함.
- `godot --headless --path . --quit`로 프로젝트 로드 오류가 없는지 확인함.

## 6. 커밋 메시지

```text
[chore] Git 작업 방식 - PR merge 후 브랜치 정리 규칙 추가
```

## 7. 다음 작업

다음 PR 기반 작업부터 merge 시 `--delete-branch`, `git pull --ff-only origin main`, `git fetch --prune`, branch cleanup 보고 항목을 실제 운영에 적용함.
