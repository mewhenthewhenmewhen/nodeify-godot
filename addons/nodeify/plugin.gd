@tool
extends EditorPlugin

const GraphEditor = preload("res://addons/nodeify/graph_editor.gd")

var dock: Control
var graph_editor: Node

func _enter_tree() -> void:
	graph_editor = GraphEditor.new()
	graph_editor.name = "NodeifyGraph"
	dock = _wrap_in_panel(graph_editor)
	add_control_to_bottom_panel(dock, "Nodeify")

func _exit_tree() -> void:
	if dock:
		remove_control_from_bottom_panel(dock)
		dock.queue_free()

func _wrap_in_panel(child: Control) -> PanelContainer:
	var panel := PanelContainer.new()
	panel.name = "NodeifyPanel"
	var style := StyleBoxFlat.new()
	style.bg_color = Color(0.12, 0.12, 0.14)
	style.content_margin_left = 0
	style.content_margin_right = 0
	style.content_margin_top = 0
	style.content_margin_bottom = 0
	panel.add_theme_stylebox_override("panel", style)
	panel.add_child(child)
	return panel
