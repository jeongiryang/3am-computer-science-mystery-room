# AI Simulation Log 0003 - builds 폴더 ignore 정리

## 1. 목적

builds/ 폴더를 빌드 출력 폴더로 취급하여 Git 추적 대상에서 제외한다.

## 2. 사용자 프롬프트 요약

builds/.gitkeep 파일을 삭제하고, .gitignore에서 builds/가 완전히 무시되도록 정리하며, AGENTS.md에서 일반 빈 폴더 추적 규칙과 builds/ 제외 규칙이 충돌하지 않도록 문장을 보강하도록 요청했다.

README.md, docs 문서, project.godot은 수정하지 말라고 명시했다.

## 3. Codex 응답 요약

builds/.gitkeep을 삭제하고, .gitignore의 !builds/.gitkeep 예외를 제거했다.

AGENTS.md에는 일반 빈 폴더는 .gitkeep으로 추적하지만 builds/는 빌드 출력 폴더이므로 Git에서 추적하지 않는다고 명시했다.

## 4. 변경된 파일

- AGENTS.md
- .gitignore

삭제된 파일:

- builds/.gitkeep

## 5. 검증 내용

- builds/.gitkeep 파일이 삭제되었는지 확인했다.
- git check-ignore로 builds/ 하위 파일이 무시되는지 확인했다.
- .gd, .tscn, 외부 에셋, 빌드 산출물이 생성되지 않았는지 확인했다.

## 6. 커밋 메시지

```text
chore: 빌드 출력 폴더 추적 제외
```

## 7. 다음 작업

첫 플레이어블 버전에서 구현할 범위를 game design document에 구체화한다.
