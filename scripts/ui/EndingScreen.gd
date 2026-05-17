extends Control

const UI_STYLE := preload("res://scripts/ui/UiStyle.gd")
const MAIN_SCENE_PATH := "res://scenes/main/Main.tscn"

@onready var background: ColorRect = $Background
@onready var panel: Panel = $CenterContainer/Panel
@onready var accent_line: ColorRect = $CenterContainer/Panel/AccentLine
@onready var status_label: Label = $CenterContainer/Panel/MarginContainer/VBoxContainer/StatusLabel
@onready var title_label: Label = $CenterContainer/Panel/MarginContainer/VBoxContainer/TitleLabel
@onready var ending_text: Label = $CenterContainer/Panel/MarginContainer/VBoxContainer/EndingText
@onready var restart_button: Button = $CenterContainer/Panel/MarginContainer/VBoxContainer/RestartButton

func _ready() -> void:
	_apply_style()
	restart_button.pressed.connect(_restart_game)
	restart_button.grab_focus()

func _restart_game() -> void:
	get_tree().change_scene_to_file(MAIN_SCENE_PATH)

func _apply_style() -> void:
	UI_STYLE.apply_background(background)
	UI_STYLE.apply_terminal_panel(panel)
	UI_STYLE.apply_accent_line(accent_line)
	UI_STYLE.apply_hint(status_label)
	UI_STYLE.apply_title(title_label)
	UI_STYLE.apply_label(ending_text, UI_STYLE.TEXT, 18)
	UI_STYLE.apply_button(restart_button, true)
