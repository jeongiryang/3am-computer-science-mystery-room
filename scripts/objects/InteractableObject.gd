extends Area2D

@export var object_id: String = ""
@export var object_name: String = ""
@export_multiline var inspection_text: String = ""
@export var visual_color: Color = Color(0.8, 0.8, 0.8, 1.0)

@onready var visual: Polygon2D = $Visual
@onready var object_label: Label = $ObjectLabel

func _ready() -> void:
	add_to_group("inspectable")
	visual.color = visual_color
	object_label.text = object_name

func inspect() -> String:
	if object_id == "exit_door" and _is_exit_door_unlocked():
		return "출입문 잠금은 해제되어 있다. 문은 열릴 수 있을 것 같다."

	return inspection_text

func should_open_password_input() -> bool:
	return object_id == "exit_door" and not _is_exit_door_unlocked()

func should_transition_to_ending() -> bool:
	return object_id == "exit_door" and _is_exit_door_unlocked()

func _is_exit_door_unlocked() -> bool:
	var game_state = get_tree().get_first_node_in_group("game_state")
	return game_state != null and game_state.is_exit_door_unlocked()
