extends RefCounted

const PANEL_BG := Color(0.025, 0.04, 0.055, 0.94)
const PANEL_BG_STRONG := Color(0.015, 0.028, 0.04, 0.97)
const FIELD_BG := Color(0.035, 0.06, 0.075, 0.98)
const BUTTON_BG := Color(0.08, 0.11, 0.13, 1.0)
const BUTTON_HOVER_BG := Color(0.11, 0.17, 0.19, 1.0)
const BUTTON_PRESSED_BG := Color(0.04, 0.08, 0.1, 1.0)
const BORDER := Color(0.36, 0.55, 0.62, 0.85)
const BORDER_DIM := Color(0.22, 0.34, 0.4, 0.75)
const ACCENT := Color(0.22, 0.74, 0.78, 1.0)
const DANGER := Color(0.78, 0.18, 0.18, 1.0)
const TEXT := Color(0.9, 0.94, 0.94, 1.0)
const TEXT_MUTED := Color(0.58, 0.68, 0.72, 1.0)

static func apply_panel(panel: Panel, strong: bool = false) -> void:
	var bg := PANEL_BG_STRONG if strong else PANEL_BG
	panel.add_theme_stylebox_override("panel", _style_box(bg, BORDER, 2, 5))

static func apply_terminal_panel(panel: Panel) -> void:
	panel.add_theme_stylebox_override("panel", _style_box(PANEL_BG_STRONG, ACCENT, 2, 4))

static func apply_label(label: Label, color: Color = TEXT, font_size: int = 18) -> void:
	label.add_theme_color_override("font_color", color)
	label.add_theme_font_size_override("font_size", font_size)

static func apply_title(label: Label) -> void:
	apply_label(label, TEXT, 24)

static func apply_hint(label: Label) -> void:
	apply_label(label, TEXT_MUTED, 14)

static func apply_feedback_error(label: Label) -> void:
	apply_label(label, DANGER, 16)

static func apply_feedback_idle(label: Label) -> void:
	apply_label(label, TEXT_MUTED, 16)

static func apply_line_edit(line_edit: LineEdit) -> void:
	line_edit.add_theme_stylebox_override("normal", _style_box(FIELD_BG, BORDER_DIM, 1, 3))
	line_edit.add_theme_stylebox_override("focus", _style_box(FIELD_BG, ACCENT, 2, 3))
	line_edit.add_theme_color_override("font_color", TEXT)
	line_edit.add_theme_color_override("font_placeholder_color", TEXT_MUTED)
	line_edit.add_theme_color_override("caret_color", ACCENT)
	line_edit.add_theme_color_override("selection_color", Color(0.18, 0.42, 0.48, 0.8))
	line_edit.add_theme_font_size_override("font_size", 22)

static func apply_button(button: Button, primary: bool = false) -> void:
	var border_color := ACCENT if primary else BORDER_DIM
	button.add_theme_stylebox_override("normal", _style_box(BUTTON_BG, border_color, 1, 4))
	button.add_theme_stylebox_override("hover", _style_box(BUTTON_HOVER_BG, ACCENT, 2, 4))
	button.add_theme_stylebox_override("pressed", _style_box(BUTTON_PRESSED_BG, ACCENT, 2, 4))
	button.add_theme_stylebox_override("focus", _style_box(BUTTON_HOVER_BG, ACCENT, 2, 4))
	button.add_theme_color_override("font_color", TEXT)
	button.add_theme_color_override("font_hover_color", TEXT)
	button.add_theme_color_override("font_pressed_color", ACCENT)
	button.add_theme_font_size_override("font_size", 16)

static func apply_accent_line(line: ColorRect, danger: bool = false) -> void:
	line.color = DANGER if danger else ACCENT

static func apply_background(background: ColorRect) -> void:
	background.color = Color(0.018, 0.026, 0.038, 1.0)

static func _style_box(bg_color: Color, border_color: Color, border_width: int, radius: int) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = bg_color
	style.border_color = border_color
	style.border_width_left = border_width
	style.border_width_top = border_width
	style.border_width_right = border_width
	style.border_width_bottom = border_width
	style.corner_radius_top_left = radius
	style.corner_radius_top_right = radius
	style.corner_radius_bottom_right = radius
	style.corner_radius_bottom_left = radius
	return style
