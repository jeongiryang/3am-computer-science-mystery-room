extends Node

const CORRECT_PASSWORD := "0300"

var exit_door_unlocked := false
var has_seen_55516_log := false
var has_checked_office_record := false
var has_seen_55110_hint := false
var has_seen_lobby_security_message := false
var has_seen_server_room_log := false
var seen_event_states: Dictionary = {}

func _ready() -> void:
	add_to_group("game_state")

func is_correct_password(password: String) -> bool:
	return password == CORRECT_PASSWORD

func unlock_exit_door() -> void:
	exit_door_unlocked = true

func is_exit_door_unlocked() -> bool:
	return exit_door_unlocked

func mark_state_seen(state_key: String) -> void:
	match state_key:
		"has_seen_55516_log":
			has_seen_55516_log = true
		"has_checked_office_record":
			has_checked_office_record = true
		"has_seen_55110_hint":
			has_seen_55110_hint = true
		"has_seen_lobby_security_message":
			has_seen_lobby_security_message = true
		"has_seen_server_room_log":
			has_seen_server_room_log = true
		_:
			seen_event_states[state_key] = true

func has_seen_state(state_key: String) -> bool:
	match state_key:
		"has_seen_55516_log":
			return has_seen_55516_log
		"has_checked_office_record":
			return has_checked_office_record
		"has_seen_55110_hint":
			return has_seen_55110_hint
		"has_seen_lobby_security_message":
			return has_seen_lobby_security_message
		"has_seen_server_room_log":
			return has_seen_server_room_log
		_:
			return seen_event_states.get(state_key, false)
