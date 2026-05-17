extends CanvasLayer

@onready var panel: Panel = $Panel
@onready var message_label: Label = $Panel/MarginContainer/MessageLabel

func _ready() -> void:
	add_to_group("dialogue_box")
	hide_message()

func show_message(message: String) -> void:
	message_label.text = message
	panel.visible = true

func hide_message() -> void:
	panel.visible = false

func is_open() -> bool:
	return panel.visible
