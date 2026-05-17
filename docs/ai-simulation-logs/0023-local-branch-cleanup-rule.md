# AI Simulation Log 0023 - 로컬 브랜치 정리 규칙 보강

## 1. 목적

PR squash merge 후 `git branch -d`가 실패하는 경우를 대비해, 안전한 조건에서만 로컬 작업 브랜치 강제 삭제를 허용하는 운영 규칙을 보강함.

## 2. 사용자 프롬프트 요약

사용자는 이전 PR #20에서 squash merge와 원격 브랜치 삭제는 완료됐지만, 로컬 작업 브랜치 `fix/multiroom-flow-qa-compatibility` 삭제가 실패한 상황을 설명함.

이번 작업에서는 `AGENTS.md`의 Post-Merge Branch Cleanup Rule, Restricted Operations, Allowed Terminal Commands를 보강하고, 조건이 충족되면 남아 있는 로컬 작업 브랜치를 정리하라고 요청함.

게임 기능, scene, script, `project.godot`, README 수정은 제외하라고 요청함.

## 3. Codex 응답 요약

`AGENTS.md`에 squash merge 후 `git branch -d` 실패 가능성과 제한 조건부 `git branch -D` 허용 규칙을 추가함.

`git branch -D`는 PR merge 완료, merge 방식 확인, 원격 브랜치 삭제 또는 삭제 대상 확인, local main 최신화, main 반영 확인, 보호 브랜치 제외, 작업 브랜치 미커밋 변경 없음 조건을 모두 만족할 때만 로컬 작업 브랜치 정리에 사용하도록 제한함.

PR #20 상태와 로컬 main 상태를 확인한 뒤 남아 있던 `fix/multiroom-flow-qa-compatibility` 로컬 브랜치를 정리함.

## 4. 변경된 파일

- `AGENTS.md`
- `docs/ai-simulation-logs/0023-local-branch-cleanup-rule.md`

## 5. 검증 내용

- `git status -sb --ignored`로 현재 브랜치와 ignored 파일 상태를 확인함.
- `git branch -vv`로 남아 있는 로컬 작업 브랜치를 확인함.
- GitHub PR #20이 merge 완료 상태임을 확인함.
- `git branch -r`로 원격 작업 브랜치가 남아 있지 않음을 확인함.
- `git branch -D fix/multiroom-flow-qa-compatibility`로 조건 충족 브랜치를 정리함.
- `git diff --check`로 공백 오류를 확인함.
- `git log --oneline --graph --decorate -10`으로 최근 이력을 확인함.
- `godot --headless --path . --quit`로 프로젝트 로드 오류를 확인함.

## 6. 커밋 메시지

```text
[chore] Git 작업 방식 - squash merge 후 로컬 브랜치 정리 규칙 추가
```

## 7. 다음 작업

이후 PR squash merge 작업에서는 새 조건을 기준으로 로컬 작업 브랜치 정리 여부를 판단하고, 정리 결과를 작업 완료 보고에 기록함.
