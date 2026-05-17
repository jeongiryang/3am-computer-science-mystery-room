extends CanvasLayer

const UI_STYLE := preload("res://scripts/ui/UiStyle.gd")
const CLOSE_HINT := "E 또는 Space: 닫기"

@onready var panel: Panel = $Panel
@onready var accent_line: ColorRect = $Panel/AccentLine
@onready var message_label: Label = $Panel/MarginContainer/VBoxContainer/MessageLabel
@onready var hint_label: Label = $Panel/MarginContainer/VBoxContainer/HintLabel

func _ready() -> void:
	add_to_group("dialogue_box")
	_apply_style()
	hide_message()

func show_message(message: String) -> void:
	message_label.text = message
	hint_label.text = CLOSE_HINT
	panel.visible = true

func hide_message() -> void:
	panel.visible = false
	message_label.text = ""
	hint_label.text = CLOSE_HINT

func is_open() -> bool:
	return panel.visible

func _apply_style() -> void:
	UI_STYLE.apply_panel(panel)
	UI_STYLE.apply_accent_line(accent_line)
	UI_STYLE.apply_label(message_label, UI_STYLE.TEXT, 18)
	UI_STYLE.apply_hint(hint_label)
