extends Area2D

@export var object_id: String = ""
@export var object_name: String = ""
@export_multiline var inspection_text: String = ""
@export var visual_color: Color = Color(0.8, 0.8, 0.8, 1.0)

@onready var visual: Polygon2D = $Visual

func _ready() -> void:
	add_to_group("inspectable")
	visual.color = visual_color

func inspect() -> String:
	return inspection_text
