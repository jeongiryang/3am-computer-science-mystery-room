extends Node2D

const ROOM_SCENES := {
	"room_55516": "res://scenes/rooms/Room55516.tscn",
	"hallway_5f": "res://scenes/rooms/Hallway5F.tscn",
	"department_office": "res://scenes/rooms/DepartmentOffice.tscn",
	"stairwell": "res://scenes/rooms/Stairwell.tscn",
	"room_55110": "res://scenes/rooms/Room55110.tscn",
	"main_building_lobby": "res://scenes/rooms/MainBuildingLobby.tscn",
	"server_room": "res://scenes/rooms/ServerRoom.tscn",
}

@export var initial_room_id: String = "room_55516"
@export var initial_spawn_name: String = "Default"

var current_room: Node2D
var is_changing_room := false

@onready var room_container: Node2D = $RoomContainer
@onready var player: CharacterBody2D = $Player

func _ready() -> void:
	add_to_group("room_manager")
	change_room(initial_room_id, initial_spawn_name)

func change_room(room_id: String, spawn_name: String = "Default") -> void:
	if is_changing_room:
		return

	if not ROOM_SCENES.has(room_id):
		push_warning("Unknown room id: %s" % room_id)
		return

	var room_scene := load(ROOM_SCENES[room_id]) as PackedScene
	if room_scene == null:
		push_warning("Could not load room scene: %s" % ROOM_SCENES[room_id])
		return

	is_changing_room = true
	_close_open_ui()
	_clear_player_interactables()

	if current_room != null:
		room_container.remove_child(current_room)
		current_room.queue_free()

	current_room = room_scene.instantiate() as Node2D
	room_container.add_child(current_room)
	_move_player_to_spawn(spawn_name)
	is_changing_room = false

func _move_player_to_spawn(spawn_name: String) -> void:
	if current_room == null or player == null:
		return

	var spawn_points := current_room.get_node_or_null("SpawnPoints")
	if spawn_points == null:
		return

	var spawn := spawn_points.get_node_or_null(spawn_name) as Marker2D
	if spawn == null:
		spawn = spawn_points.get_node_or_null("Default") as Marker2D

	if spawn != null:
		player.global_position = spawn.global_position

func _close_open_ui() -> void:
	var dialogue = get_tree().get_first_node_in_group("dialogue_box")
	if dialogue != null and dialogue.has_method("hide_message"):
		dialogue.hide_message()

	var password_input = get_tree().get_first_node_in_group("password_input")
	if password_input != null and password_input.has_method("close"):
		password_input.close()

func _clear_player_interactables() -> void:
	if player != null and player.has_method("clear_nearby_interactables"):
		player.clear_nearby_interactables()
