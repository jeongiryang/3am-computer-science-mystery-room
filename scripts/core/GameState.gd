extends Node

const CORRECT_PASSWORD := "0300"

var exit_door_unlocked := false

func _ready() -> void:
	add_to_group("game_state")

func is_correct_password(password: String) -> bool:
	return password == CORRECT_PASSWORD

func unlock_exit_door() -> void:
	exit_door_unlocked = true

func is_exit_door_unlocked() -> bool:
	return exit_door_unlocked
