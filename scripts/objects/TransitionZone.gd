extends Area2D

@export var target_room_id: String = ""
@export var target_spawn_name: String = "Default"
@export var transition_name: String = "이동"
@export_multiline var prompt_text: String = "다른 공간으로 이동할 수 있다."
@export var visual_color: Color = Color(0.16, 0.56, 0.66, 1.0)

@onready var visual: Polygon2D = $Visual
@onready var zone_label: Label = $ZoneLabel

func _ready() -> void:
	add_to_group("transition_zone")
	visual.color = visual_color
	zone_label.text = transition_name

func inspect() -> String:
	return prompt_text

func transition() -> void:
	var room_manager = get_tree().get_first_node_in_group("room_manager")
	if room_manager != null and room_manager.has_method("change_room"):
		room_manager.change_room(target_room_id, target_spawn_name)
		return

	var dialogue = get_tree().get_first_node_in_group("dialogue_box")
	if dialogue != null and dialogue.has_method("show_message"):
		dialogue.show_message("이동할 수 있는 연결 지점을 확인할 수 없다.")
