extends CharacterBody2D

@export var move_speed: float = 220.0

var nearby_interactables: Array[Area2D] = []

@onready var interaction_area: Area2D = $InteractionArea

func _ready() -> void:
	interaction_area.area_entered.connect(_on_interaction_area_area_entered)
	interaction_area.area_exited.connect(_on_interaction_area_area_exited)

func _physics_process(_delta: float) -> void:
	if _is_ui_blocking():
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * move_speed
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("interact"):
		return

	if _is_password_input_open():
		return

	var dialogue = _get_dialogue_box()
	if dialogue != null and dialogue.is_open():
		dialogue.hide_message()
		get_viewport().set_input_as_handled()
		return

	var interactable := _get_closest_interactable()
	if interactable == null or not interactable.has_method("inspect"):
		return

	if interactable.has_method("should_open_password_input") and interactable.should_open_password_input():
		var password_input = _get_password_input()
		if password_input != null:
			password_input.open()
			get_viewport().set_input_as_handled()
		return

	if interactable.has_method("should_transition_to_ending") and interactable.should_transition_to_ending():
		get_viewport().set_input_as_handled()
		get_tree().change_scene_to_file("res://scenes/main/Ending.tscn")
		return

	if dialogue != null:
		dialogue.show_message(interactable.inspect())
		get_viewport().set_input_as_handled()

func _on_interaction_area_area_entered(area: Area2D) -> void:
	if area.has_method("inspect") and not nearby_interactables.has(area):
		nearby_interactables.append(area)

func _on_interaction_area_area_exited(area: Area2D) -> void:
	nearby_interactables.erase(area)

func _get_closest_interactable() -> Area2D:
	var closest: Area2D = null
	var closest_distance := INF

	for interactable in nearby_interactables:
		if not is_instance_valid(interactable):
			continue

		var distance := global_position.distance_squared_to(interactable.global_position)
		if distance < closest_distance:
			closest = interactable
			closest_distance = distance

	return closest

func _get_dialogue_box():
	return get_tree().get_first_node_in_group("dialogue_box")

func _get_password_input():
	return get_tree().get_first_node_in_group("password_input")

func _is_password_input_open() -> bool:
	var password_input = _get_password_input()
	return password_input != null and password_input.is_open()

func _is_dialogue_open() -> bool:
	var dialogue = _get_dialogue_box()
	return dialogue != null and dialogue.is_open()

func _is_ui_blocking() -> bool:
	return _is_dialogue_open() or _is_password_input_open()
