extends CanvasLayer

const UI_STYLE := preload("res://scripts/ui/UiStyle.gd")

@onready var panel: Panel = $Panel
@onready var accent_line: ColorRect = $Panel/AccentLine
@onready var title_label: Label = $Panel/MarginContainer/VBoxContainer/TitleLabel
@onready var subtitle_label: Label = $Panel/MarginContainer/VBoxContainer/SubtitleLabel
@onready var input_line: LineEdit = $Panel/MarginContainer/VBoxContainer/InputLine
@onready var feedback_label: Label = $Panel/MarginContainer/VBoxContainer/FeedbackLabel
@onready var hint_label: Label = $Panel/MarginContainer/VBoxContainer/HintLabel
@onready var submit_button: Button = $Panel/MarginContainer/VBoxContainer/ButtonRow/SubmitButton
@onready var cancel_button: Button = $Panel/MarginContainer/VBoxContainer/ButtonRow/CancelButton

var filtering_text := false

func _ready() -> void:
	add_to_group("password_input")
	_apply_style()
	submit_button.pressed.connect(_submit_password)
	cancel_button.pressed.connect(close)
	input_line.text_submitted.connect(_on_text_submitted)
	input_line.text_changed.connect(_on_text_changed)
	close()

func _unhandled_input(event: InputEvent) -> void:
	if not is_open():
		return

	if event is InputEventKey and event.pressed and not event.echo and event.keycode == KEY_ESCAPE:
		close()
		get_viewport().set_input_as_handled()

func open() -> void:
	feedback_label.text = ""
	UI_STYLE.apply_feedback_idle(feedback_label)
	input_line.text = ""
	panel.visible = true
	input_line.grab_focus()

func close() -> void:
	panel.visible = false
	input_line.release_focus()

func is_open() -> bool:
	return panel.visible

func _on_text_submitted(_text: String) -> void:
	_submit_password()

func _on_text_changed(new_text: String) -> void:
	if filtering_text:
		return

	var digits_only := ""
	for index in range(new_text.length()):
		var character := new_text.substr(index, 1)
		if character >= "0" and character <= "9":
			digits_only += character

	if digits_only == new_text:
		return

	filtering_text = true
	input_line.text = digits_only
	input_line.caret_column = digits_only.length()
	filtering_text = false

func _submit_password() -> void:
	var game_state = get_tree().get_first_node_in_group("game_state")
	if game_state == null:
		UI_STYLE.apply_feedback_error(feedback_label)
		feedback_label.text = "비밀번호 장치를 확인할 수 없다."
		return

	if game_state.is_correct_password(input_line.text):
		game_state.unlock_exit_door()
		close()
		var dialogue = get_tree().get_first_node_in_group("dialogue_box")
		if dialogue != null:
			dialogue.show_message("잠금이 해제되었다.")
		return

	UI_STYLE.apply_feedback_error(feedback_label)
	feedback_label.text = "비밀번호가 맞지 않는다. 다시 입력해 보자."
	input_line.select_all()
	input_line.grab_focus()

func _apply_style() -> void:
	UI_STYLE.apply_terminal_panel(panel)
	UI_STYLE.apply_accent_line(accent_line)
	UI_STYLE.apply_title(title_label)
	UI_STYLE.apply_hint(subtitle_label)
	UI_STYLE.apply_line_edit(input_line)
	UI_STYLE.apply_feedback_idle(feedback_label)
	UI_STYLE.apply_hint(hint_label)
	UI_STYLE.apply_button(submit_button, true)
	UI_STYLE.apply_button(cancel_button)
