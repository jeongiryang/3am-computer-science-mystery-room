# AGENTS.md

## Project Identity

This repository contains a Godot 4 project for a short 2D interactive mystery room game.

Game title:
3AM Computer Science: Mystery Room

Korean title:
새벽 3시, 컴퓨터공학과: 미스터리룸

Repository name:
3AM-Computer-Science-Mystery-Room

The game is set in a computer science department at 3 AM.  
The player wakes up inside a locked computer lab and must inspect objects, collect clues, solve a password puzzle, and escape.

This project is the first entry in a larger mystery/horror universe.  
A later project may expand the concept into a first-person horror exploration game set in a computer science building at 3 AM.

---

## Main Goal

Build a small but complete Godot game that can eventually be:

- managed on GitHub
- exported as a Windows build
- uploaded to itch.io
- recorded as a short gameplay video
- documented in README.md
- used as a personal portfolio project

The first milestone is project scaffolding only.

---

## Tech Stack

- Engine: Godot 4.x
- Language: GDScript
- Genre: 2D interactive mystery room
- Target platform: Windows
- Version control: Git / GitHub
- Main editor: Visual Studio Code
- Godot extension: godot-tools
- Git helper extension: GitLens

Do not use C# or the Godot .NET version unless explicitly requested.

---

## Current Milestone

Current milestone:
Initial repository and Godot project setup.

For this milestone, only create the project structure and documentation files.

Do not implement gameplay logic yet.

---

## Initial Setup Rules

For the initial setup task:

- Create the required folder structure.
- Create documentation files.
- Create a Godot 4 compatible `.gitignore`.
- Create placeholder `.gitkeep` files for empty folders that should be tracked by Git.
- Do not create a `.gitkeep` file inside `builds/`, because `builds/` is a local build output folder and should not be tracked by Git.
- Create a minimal `project.godot` file if it does not already exist.
- Do not create gameplay scenes yet.
- Do not create gameplay scripts yet.
- Do not add external assets yet.
- Do not generate binary build files.
- Do not create exported builds.
- Do not modify files outside the requested scope.

---

## Required Folder Structure

Create the following folder structure:

assets/
assets/art/
assets/art/characters/
assets/art/objects/
assets/art/rooms/
assets/art/ui/
assets/audio/
assets/audio/bgm/
assets/audio/sfx/
assets/fonts/

scenes/
scenes/main/
scenes/rooms/
scenes/player/
scenes/objects/
scenes/ui/

scripts/
scripts/core/
scripts/player/
scripts/objects/
scripts/ui/

docs/
screenshots/
builds/

Use `.gitkeep` files where needed so ordinary empty folders can be tracked by Git.
Do not use `.gitkeep` for `builds/`; `builds/` is a build output folder and must remain ignored by Git.

---

## Required Root Files

Create or update these files at the repository root:

README.md
AGENTS.md
.gitignore
project.godot

Do not remove AGENTS.md.

---

## Required Documentation Files

Create these files inside the `docs/` folder:

docs/game-design-document.md
docs/development-log.md
docs/asset-credits.md

---

## Godot Project Rules

The project should be compatible with Godot 4.

The Godot project display name should be:

3AM Computer Science: Mystery Room

For the initial setup, do not set a main scene unless an actual `Main.tscn` scene is created later.

Do not create placeholder `.tscn` scene files during the first scaffolding task unless explicitly requested.

Do not create placeholder `.gd` scripts during the first scaffolding task unless explicitly requested.

---

## .gitignore Rules

The `.gitignore` should be suitable for a Godot 4 project.

Do not commit:

.godot/
.import/
builds/
*.exe
*.pck
*.zip
*.tmp
*.bak
.DS_Store
Thumbs.db
.vscode/

Commit these if they exist:

project.godot
README.md
AGENTS.md
docs/
assets/
scenes/
scripts/
screenshots/

Do not ignore `.tscn`, `.gd`, `.tres`, `.tscn`, `.png`, `.wav`, `.ogg`, or `.import` source assets unless there is a clear reason.

---

## README Requirements

README.md must include:

- Project title
- Korean title
- Project overview
- Development environment
- Game concept
- Controls
- Core gameplay features
- Current development checklist
- Planned release flow
- Repository structure

Use clear Markdown headings.

The README should be written primarily in Korean, but file names, tools, and technical terms may remain in English.

---

## Game Design Document Requirements

`docs/game-design-document.md` must include:

- Game title
- Korean title
- Genre
- Estimated playtime
- Core concept
- Setting
- Player goal
- Main objects
- Main puzzle structure
- Ending concept
- Connection to the future first-person horror project

The game design document should be written in Korean.

---

## Development Log Requirements

`docs/development-log.md` must include an initial entry for:

2026-05-15

The entry should mention:

- project concept finalized
- repository name selected
- Godot 4 selected as the engine
- initial scaffolding planned
- future expansion into a first-person horror game

The development log should be written in Korean.

---

## Asset Credits Requirements

`docs/asset-credits.md` must state that no external assets have been added yet.

When external assets are added later, record:

- asset name
- creator
- source URL
- license
- usage location

---

## Naming Rules

Use English for:

- file names
- folder names
- scene names
- script names
- class names
- variable names
- function names

Korean may be used for:

- README text
- documentation
- in-game dialogue
- comments when helpful
- story text
- UI text shown to players

Use kebab-case for repository and documentation-friendly names when appropriate.

Use PascalCase for Godot scene names.

Use PascalCase for script file names that represent objects or systems.

Examples:

Main.tscn
LabRoom.tscn
Player.tscn
Door.tscn
Note.tscn
PasswordPanel.tscn

Player.gd
Door.gd
Note.gd
PasswordPanel.gd
GameState.gd

---

## Future Gameplay Architecture

Do not implement this during the initial setup milestone.

Later, the project may use:

Player.gd
Interactable.gd
Door.gd
Note.gd
PasswordPanel.gd
GameState.gd
DialogueBox.gd
NoteViewer.gd
PasswordInput.gd

Expected future systems:

- player movement
- object interaction
- clue collection
- note viewer UI
- password input UI
- door lock/unlock state
- scene transition
- ending scene

---

## Development Style for Future Work

When gameplay implementation begins later:

- Use GDScript.
- Keep scripts small and focused.
- Prefer clear names over short names.
- Separate scenes and scripts into their own folders.
- Avoid large monolithic scripts.
- Do not add features that are outside the requested milestone.
- Prefer simple, working systems over complex architecture.
- Keep the first playable version small.

---

## Git Workflow

For this solo project, keep the workflow simple.

Recommended branches:

main
dev
feature/*

The `main` branch should contain stable project states.

For each task, summarize:

- changed files
- created files
- deleted files
- important decisions
- recommended commit message

Do not run destructive Git commands unless explicitly requested.

Do not force push.

Do not delete branches unless explicitly requested or allowed by the Post-Merge Branch Cleanup Rule.

---

## Branch and PR Decision Rule

Codex must decide the Git workflow at the start of each task based on task risk and scope.

- If the task is low-risk and centered on documentation, logs, or metadata, Codex may use direct commits on `main`.
- If the task includes code, Godot scenes, UI behavior, build settings, or core gameplay behavior, Codex must use the Issue + work branch + PR + merge workflow.
- If the risk level is ambiguous, prefer the PR workflow.
- If the user explicitly requests a specific workflow, follow that workflow within the safety rules of this file.
- Do not move into work outside the user-requested scope just because the current workflow allows automation.

---

## Direct Main Push Rule

Codex may commit and push directly to `main` only for low-risk work that the user explicitly allows or that falls under the Low-Risk Direct Commit Work section.

Before a direct `main` push, Codex must:

- confirm the current branch with `git status` or `git branch`
- confirm that changed files are limited to the low-risk scope
- review `git diff`
- run `git diff --check` when possible
- run `godot --headless --path . --quit` when possible for this Godot project
- keep unrelated untracked files out of the commit

After a direct `main` push, Codex must:

- confirm the new commit with `git log --oneline --graph`
- report why direct `main` push was selected
- include the commit hash and commit message in the final report

If direct `main` push feels unsafe or unclear, use the PR workflow.

---

## PR Required Work

The following work must use Issue creation, a work branch, PR creation, and merge:

- gameplay feature implementation
- GDScript logic changes
- Godot scene structure changes
- UI feature additions or behavior changes
- core flow changes involving Player, interaction, password, ending, or scene transition
- Windows export settings
- Android export settings
- mobile input support
- external asset additions
- build or deployment setting changes
- large README or documentation rewrites
- large final report or portfolio documentation work
- structural changes across multiple files
- any task where the user explicitly requests a PR

---

## GitHub Issue and Pull Request Rule

When a task uses the PR workflow, Codex should keep the GitHub trail clear enough that the user can understand the work from the Issue, PR, commits, and AI simulation log.

For PR workflow tasks, Codex should:

- create a GitHub Issue when the task scope is clear
- create a work branch from the latest `main`
- commit only files that belong to the requested scope
- push the work branch
- create a PR with a concrete title and body
- include verification results and manual test steps in the PR body
- include the AI simulation log path in the PR body
- merge the PR when verification passes and the user has allowed merge automation
- prefer squash merge unless the user explicitly requests another allowed merge method
- follow the Post-Merge Branch Cleanup Rule after merge

Do not close or delete a PR unless the user explicitly requests it. Do not use rebase merge.

---

## Post-Merge Branch Cleanup Rule

When Codex merges a PR, Codex should clean up the work branch when it is safe and allowed.

Default merge behavior:

- prefer squash merge
- if using GitHub CLI and branch cleanup is allowed, prefer:

```text
gh pr merge <PR_NUMBER> --squash --delete-branch
```

Branch cleanup rules:

- If the user explicitly asks to keep the work branch, do not delete the remote or local work branch.
- If `--delete-branch` is unavailable or fails, report the failure reason in the final report.
- If remote branch deletion fails, do not force push or use risky commands to remove it.
- After PR merge, update local `main`:

```text
git checkout main
git pull --ff-only origin main
```

- After PR merge, prune stale remote tracking branches when possible:

```text
git fetch --prune
```

- If local work branch cleanup is allowed, first switch away from the work branch and confirm the PR was merged, then use safe deletion only:

```text
git branch -d <work-branch>
```

- A squash merge may cause `git branch -d <work-branch>` to fail because Git does not see the local branch as fully merged.
- Codex may use `git branch -D <work-branch>` only for local work branch cleanup when all of these conditions are true:
  - the PR is confirmed as merged
  - the merge method is confirmed as squash merge or normal merge
  - the remote work branch is deleted or is the intended cleanup target
  - local `main` has been updated to the latest `origin/main`
  - the work is confirmed on `main` through the PR or merge commit
  - the target branch is not a protected branch such as `main`, `develop`, or `dev`
  - the target work branch has no uncommitted changes
- If any condition is not true, do not use `git branch -D`.
- `git branch -D` is allowed only for local work branch cleanup under this rule.
- Do not use forced remote branch deletion, force push, `git reset --hard`, or rebase.
- Confirm whether local `main` and `origin/main` match after merge.
- Always report PR merge status, merge method, remote branch deletion status, local branch deletion status, `git fetch --prune` status, local `main` update status, and any cleanup failure reason.

---

## Low-Risk Direct Commit Work

The following work may be committed and pushed directly to `main` when the user allows it or when this file's rules clearly permit it:

- AI simulation log additions
- documentation typo fixes
- documentation style normalization
- small README wording updates
- minimal `.gitignore` additions
- Godot `.uid` file tracking cleanup
- ignoring document-only temporary sidecars such as `screenshots/*.png.import`
- small additions to project operation rules
- documentation or metadata cleanup that does not affect existing behavior
- explanatory documentation additions that do not change code logic

---

## Allowed Terminal Commands

Codex may use these commands when they fit the current repository task and safety rules:

- `git status`
- `git diff`
- `git diff --check`
- `git log --oneline --graph --decorate`
- `git branch`
- `git checkout`
- `git checkout -b`
- `git add`
- `git commit`
- `git push`
- `git fetch`
- `git fetch --prune`
- `git pull --ff-only origin main`
- `git branch -d`
- `git branch -D` when all Post-Merge Branch Cleanup Rule conditions are met
- `gh issue create`
- `gh issue view`
- `gh issue list`
- `gh pr create`
- `gh pr view`
- `gh pr status`
- `gh pr merge --squash`
- `gh pr merge --squash --delete-branch`
- `gh pr merge --merge`
- `godot --version`
- `godot --headless --path . --quit`
- repository-local file and folder inspection commands
- repository-local file and folder creation commands

Only use branch deletion commands under the Post-Merge Branch Cleanup Rule or when the user explicitly requests branch cleanup.

---

## Restricted Operations

Codex must not perform these operations:

- force push
- `git reset --hard`
- rebase
- branch deletion outside the Post-Merge Branch Cleanup Rule or explicit user request
- forced local branch deletion except for the limited `git branch -D <work-branch>` case allowed by the Post-Merge Branch Cleanup Rule
- repository deletion
- modifying files outside the repository
- modifying user personal files
- implementing features outside the user's requested scope
- committing build artifacts
- committing `.godot/`, `.import/`, `builds/`, or `.vscode/`

---

## End-of-Run Report Rule

At the end of each task, Codex must write a concise completion report that matches the user-requested report structure.

When a PR is created or merged, the report must include:

- PR merge status
- merge method
- remote work branch deletion status
- local work branch deletion status
- whether `git fetch --prune` was run
- whether local `main` was updated to `origin/main`
- whether local `main` and `origin/main` match
- cleanup failure reason, if branch cleanup failed or was skipped

For direct `main` commits, report why direct `main` push was selected.

---

## AI Simulation Log Rules

After each Codex-assisted task, add one Markdown log file under:

docs/ai-simulation-logs/

Use the next sequential number after the existing logs.

File name format:

0008-task-name.md
0009-task-name.md

Each log file must use this structure:

- Purpose
- User prompt summary
- Codex response summary
- Changed files
- Verification details
- Commit message
- Next task

Keep the log factual. Do not claim that untested behavior was verified. If a test was not actually run, write that manual testing is required.

---

## Verification Rules

After making changes, report:

- created folders
- created files
- modified files
- files intentionally ignored by Git
- recommended next commit message

For the initial setup, the recommended commit message should be:

chore: initialize Godot project structure

Do not claim that the game is playable unless actual gameplay scenes and scripts exist.

---

## First Milestone Definition of Done

The first milestone is complete when:

- folder structure exists
- README.md exists
- AGENTS.md exists
- .gitignore exists
- project.godot exists
- docs/game-design-document.md exists
- docs/development-log.md exists
- docs/asset-credits.md exists
- ordinary empty folders are tracked with `.gitkeep`
- `builds/` remains untracked because it is reserved for build output
- no gameplay logic has been implemented
- no external assets have been added
- no build files have been generated
