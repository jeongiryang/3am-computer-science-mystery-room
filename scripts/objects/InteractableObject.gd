extends Area2D

@export var object_id: String = ""
@export var object_name: String = ""
@export_multiline var inspection_text: String = ""
@export_multiline var repeat_inspection_text: String = ""
@export var is_progress_clue: bool = false
@export var state_key: String = ""
@export var visual_color: Color = Color(0.8, 0.8, 0.8, 1.0)
@export_range(0.0, 1.0, 0.05) var visual_alpha: float = 1.0
@export var show_object_label: bool = true

@onready var visual: Polygon2D = $Visual
@onready var object_label: Label = $ObjectLabel

func _ready() -> void:
	add_to_group("inspectable")
	visual.color = Color(visual_color.r, visual_color.g, visual_color.b, visual_alpha)
	object_label.text = object_name
	object_label.visible = show_object_label

func inspect() -> String:
	if object_id == "exit_door" and _is_exit_door_unlocked():
		return "출입문 잠금은 해제되어 있다. 문은 열릴 수 있을 것 같다."

	var game_state = _get_game_state()
	if state_key != "" and game_state != null and game_state.has_method("has_seen_state"):
		if game_state.has_seen_state(state_key):
			if repeat_inspection_text != "":
				return repeat_inspection_text
			return inspection_text

		if game_state.has_method("mark_state_seen"):
			game_state.mark_state_seen(state_key)

	return inspection_text

func should_open_password_input() -> bool:
	return object_id == "exit_door" and not _is_exit_door_unlocked()

func should_transition_to_ending() -> bool:
	return object_id == "exit_door" and _is_exit_door_unlocked()

func _is_exit_door_unlocked() -> bool:
	var game_state = _get_game_state()
	return game_state != null and game_state.is_exit_door_unlocked()

func _get_game_state():
	var game_state = get_tree().get_first_node_in_group("game_state")
	return game_state
