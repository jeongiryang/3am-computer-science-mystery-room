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

Do not delete branches unless explicitly requested.

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
