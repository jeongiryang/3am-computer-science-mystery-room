extends Control

const MAIN_SCENE_PATH := "res://scenes/main/Main.tscn"

@onready var restart_button: Button = $CenterContainer/VBoxContainer/RestartButton

func _ready() -> void:
	restart_button.pressed.connect(_restart_game)
	restart_button.grab_focus()

func _restart_game() -> void:
	get_tree().change_scene_to_file(MAIN_SCENE_PATH)
