@tool
extends Control

var NodeSearchPopup = preload("res://addons/nodeify/node_search.gd")
var CodeGenerator = preload("res://addons/nodeify/codegen.gd")
var GraphSaver = preload("res://addons/nodeify/graph_saver.gd")

var data: NodeifyGraphData
var graph_edit: GraphEdit
var _selected_graph_node: GraphNode = null
var _inspector_container: VBoxContainer

func _ready() -> void:
	data = NodeifyGraphData.new()
	data.graph_changed.connect(_on_graph_changed)
	_build_ui()

func _build_ui() -> void:
	var root := VBoxContainer.new()
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	root.add_theme_constant_override("separation", 0)
	add_child(root)

	var toolbar := HBoxContainer.new()
	toolbar.add_theme_constant_override("separation", 4)
	var style_bar := StyleBoxFlat.new()
	style_bar.bg_color = Color(0.14, 0.14, 0.16)
	toolbar.add_theme_stylebox_override("panel", style_bar)
	root.add_child(toolbar)

	var btn_open := Button.new()
	btn_open.text = "Open"
	btn_open.pressed.connect(_on_open)
	toolbar.add_child(btn_open)

	var btn_save := Button.new()
	btn_save.text = "Save"
	btn_save.pressed.connect(_on_save)
	toolbar.add_child(btn_save)

	toolbar.add_child(VSeparator.new())

	var btn_add := Button.new()
	btn_add.text = "+ Add Node"
	btn_add.pressed.connect(_on_add_node_pressed)
	toolbar.add_child(btn_add)

	var btn_generate := Button.new()
	btn_generate.text = "Generate Script"
	btn_generate.pressed.connect(_on_generate)
	toolbar.add_child(btn_generate)

	toolbar.add_child(HSeparator.new())

	var btn_clear := Button.new()
	btn_clear.text = "Clear"
	btn_clear.pressed.connect(_on_clear)
	toolbar.add_child(btn_clear)

	var hsplit := HSplitContainer.new()
	hsplit.split_offset = -220
	hsplit.size_flags_vertical = Control.SIZE_EXPAND_FILL
	root.add_child(hsplit)

	graph_edit = GraphEdit.new()
	graph_edit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	graph_edit.size_flags_vertical = Control.SIZE_EXPAND_FILL
	graph_edit.minimap_enabled = true
	graph_edit.zoom_min = 0.2
	graph_edit.zoom_max = 3.0
	graph_edit.connection_request.connect(_on_connection_request)
	graph_edit.disconnection_request.connect(_on_disconnection_request)
	graph_edit.delete_nodes_request.connect(_on_delete_nodes)
	graph_edit.popup_request.connect(_on_popup_request)
	hsplit.add_child(graph_edit)

	var inspector_panel := PanelContainer.new()
	inspector_panel.custom_minimum_size.x = 220
	var insp_style := StyleBoxFlat.new()
	insp_style.bg_color = Color(0.14, 0.14, 0.16)
	inspector_panel.add_theme_stylebox_override("panel", insp_style)
	hsplit.add_child(inspector_panel)

	var scroll := ScrollContainer.new()
	scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	inspector_panel.add_child(scroll)

	_inspector_container = VBoxContainer.new()
	_inspector_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(_inspector_container)

	_show_inspector_placeholder()

	var bg := StyleBoxFlat.new()
	bg.bg_color = Color(0.12, 0.12, 0.14)
	graph_edit.add_theme_stylebox_override("panel", bg)

func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	data.add_connection(int(from_node), from_port, int(to_node), to_port)
	_sync_graph()

func _on_disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	data.remove_connection(int(from_node), from_port, int(to_node), to_port)
	_sync_graph()

func _on_delete_nodes(nodes_to_delete: Array[StringName]) -> void:
	for n in nodes_to_delete:
		data.remove_node(int(n))
	_sync_graph()

func _on_popup_request(at_position: Vector2) -> void:
	_show_search(at_position)

func _on_add_node_pressed() -> void:
	var center = graph_edit.get_scroll_offset() + Vector2(graph_edit.size.x / 2, graph_edit.size.y / 2) / graph_edit.zoom
	_show_search(center)

func _show_search(pos: Vector2) -> void:
	var popup = NodeSearchPopup.create_popup()
	popup.node_selected.connect(_on_search_node_selected.bind(pos))
	get_window().add_child(popup)
	popup.popup_centered(Vector2i(360, 500))

func _on_search_node_selected(type: String, pos: Vector2) -> void:
	data.create_node(type, pos / graph_edit.zoom)
	_sync_graph()

func _on_open() -> void:
	GraphSaver.open_file_dialog(self, _on_open_file)

func _on_open_file(path: String) -> void:
	var loaded = GraphSaver.load_graph(path)
	if loaded:
		data.deserialize(loaded)
		_sync_graph()

func _on_save() -> void:
	GraphSaver.save_file_dialog(self, _on_save_file)

func _on_save_file(path: String) -> void:
	GraphSaver.save_graph(path, data)

func _on_generate() -> void:
	var code = CodeGenerator.generate(data, _find_owner_node())
	if code.is_empty():
		push_warning("Nodeify: Nothing to generate")
		return
	var path = "res://generated_nodeify.gd"
	DirAccess.remove_absolute(path)
	var f = FileAccess.open(path, FileAccess.WRITE)
	if f:
		f.store_string(code)
		f.close()
		print("Nodeify: Generated script at ", path)
		var owner = _find_owner_node()
		if owner:
			owner.set_script(load(path))
			print("Nodeify: Attached to ", owner.name)

func _on_clear() -> void:
	data.clear()
	_sync_graph()

func _find_owner_node() -> Node:
	return EditorInterface.get_edited_scene_root()

func _sync_graph() -> void:
	for child in graph_edit.get_children():
		if child is GraphNode:
			child.queue_free()

	for nd in data.nodes:
		var gn = _create_graph_node(nd)
		graph_edit.add_child(gn)

	for conn in data.connections:
		graph_edit.connect_node(str(conn["from_node"]), conn["from_port"], str(conn["to_node"]), conn["to_port"])

func _create_graph_node(nd: Dictionary) -> GraphNode:
	var gn := GraphNode.new()
	gn.name = str(nd["id"])
	gn.title = nd.get("label", nd["type"])
	gn.position_offset = Vector2(nd.get("x", 0), nd.get("y", 0))
	gn.size = Vector2(200, 0)

	var def = NodeifyRegistry.NODE_DEFS.get(nd["type"], {})
	var cat = def.get("category", "")
	var color = NodeifyRegistry.get_category_color(cat)

	var style := StyleBoxFlat.new()
	style.bg_color = color.darkened(0.6)
	style.border_color = color
	style.set_border_width_all(2)
	style.set_corner_radius_all(6)
	style.set_content_margin_all(8)
	gn.add_theme_stylebox_override("frame", style)

	var sel_style := style.duplicate()
	sel_style.set_border_width_all(3)
	gn.add_theme_stylebox_override("selected_frame", sel_style)

	gn.draggable = true
	gn.resizable = false

	var node_id = nd["id"]
	gn.gui_input.connect(_on_graph_node_input.bind(node_id))

	if def.has("inputs"):
		for i in def["inputs"]:
			var port_type = _port_type_to_int(i["type"])
			var slot_idx = gn.get_child_count()
			gn.set_slot(slot_idx, false, port_type, color, true, port_type, color)
			var label := Label.new()
			label.text = i.get("name", "")
			label.add_theme_font_size_override("font_size", 10)
			gn.add_child(label)

	if def.has("outputs"):
		for i in def["outputs"]:
			var port_type = _port_type_to_int(i["type"])
			var slot_idx = gn.get_child_count()
			gn.set_slot(slot_idx, true, port_type, color, false, port_type, color)
			var label := Label.new()
			label.text = i.get("name", "")
			label.add_theme_font_size_override("font_size", 10)
			gn.add_child(label)

	var props = nd.get("props", {})
	for key in props:
		var hbox := HBoxContainer.new()
		var lbl := Label.new()
		lbl.text = key
		lbl.custom_minimum_size.x = 70
		lbl.add_theme_font_size_override("font_size", 10)
		hbox.add_child(lbl)

		var options = NodeifyRegistry.get_options_for_prop(key, nd["type"])
		if options.size() > 0:
			var opt := OptionButton.new()
			for o in options:
				opt.add_item(str(o))
			var current_idx = options.find(props[key])
			if current_idx >= 0:
				opt.selected = current_idx
			var _key = key
			opt.item_selected.connect(_on_option_selected.bind(nd, _key, options))
			opt.add_theme_font_size_override("font_size", 10)
			hbox.add_child(opt)
		elif props[key] is float or props[key] is int:
			var spin := SpinBox.new()
			spin.value = props[key]
			spin.step = 0.01 if props[key] is float else 1
			var _key = key
			spin.value_changed.connect(_on_spin_changed.bind(nd, _key))
			spin.add_theme_font_size_override("font_size", 10)
			hbox.add_child(spin)
		else:
			var inp := LineEdit.new()
			inp.text = str(props[key])
			var _key = key
			inp.text_changed.connect(_on_text_changed.bind(nd, _key))
			inp.add_theme_font_size_override("font_size", 10)
			hbox.add_child(inp)

		gn.add_child(hbox)

	return gn

func _on_graph_node_input(event: InputEvent, node_id: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_select_node(node_id)

func _on_option_selected(idx: int, nd: Dictionary, key: String, options: Array) -> void:
	nd["props"][key] = options[idx]

func _on_spin_changed(val: float, nd: Dictionary, key: String) -> void:
	nd["props"][key] = val

func _on_text_changed(t: String, nd: Dictionary, key: String) -> void:
	nd["props"][key] = t

func _port_type_to_int(type: String) -> int:
	if type == "exec":
		return 4
	return 0

func _select_node(node_id: int) -> void:
	var nd = data.get_node(node_id)
	if nd.is_empty():
		return
	_show_node_inspector(nd)

func _show_node_inspector(nd: Dictionary) -> void:
	for child in _inspector_container.get_children():
		child.queue_free()

	var def = NodeifyRegistry.NODE_DEFS.get(nd["type"], {})
	var cat = def.get("category", "")
	var color = NodeifyRegistry.get_category_color(cat)

	var title := Label.new()
	title.text = nd.get("label", nd["type"])
	title.add_theme_font_size_override("font_size", 14)
	title.add_theme_color_override("font_color", color)
	_inspector_container.add_child(title)

	var type_label := Label.new()
	type_label.text = nd["type"]
	type_label.add_theme_font_size_override("font_size", 10)
	type_label.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	_inspector_container.add_child(type_label)

	_inspector_container.add_child(HSeparator.new())

	var name_row := HBoxContainer.new()
	var name_lbl := Label.new()
	name_lbl.text = "Label"
	name_lbl.custom_minimum_size.x = 60
	name_row.add_child(name_lbl)
	var name_inp := LineEdit.new()
	name_inp.text = nd.get("label", "")
	name_inp.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_inp.text_changed.connect(_on_inspector_label_changed.bind(nd))
	name_row.add_child(name_inp)
	_inspector_container.add_child(name_row)

	var props = nd.get("props", {})
	for key in props:
		var row := HBoxContainer.new()
		var lbl := Label.new()
		lbl.text = key
		lbl.custom_minimum_size.x = 70
		lbl.add_theme_font_size_override("font_size", 10)
		row.add_child(lbl)

		var options = NodeifyRegistry.get_options_for_prop(key, nd["type"])
		if options.size() > 0:
			var opt := OptionButton.new()
			for o in options:
				opt.add_item(str(o))
			var idx = options.find(props[key])
			if idx >= 0:
				opt.selected = idx
			opt.item_selected.connect(_on_option_selected.bind(nd, key, options))
			opt.add_theme_font_size_override("font_size", 10)
			row.add_child(opt)
		elif props[key] is float or props[key] is int:
			var spin := SpinBox.new()
			spin.value = props[key]
			spin.step = 0.01 if props[key] is float else 1
			spin.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			spin.value_changed.connect(_on_spin_changed.bind(nd, key))
			row.add_child(spin)
		else:
			var inp := LineEdit.new()
			inp.text = str(props[key])
			inp.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			inp.text_changed.connect(_on_text_changed.bind(nd, key))
			row.add_child(inp)

		_inspector_container.add_child(row)

	var del_btn := Button.new()
	del_btn.text = "Delete Node"
	del_btn.add_theme_color_override("font_color", Color.RED)
	del_btn.pressed.connect(_on_delete_pressed.bind(nd))
	_inspector_container.add_child(del_btn)

func _on_inspector_label_changed(t: String, nd: Dictionary) -> void:
	nd["label"] = t
	_sync_graph()

func _on_delete_pressed(nd: Dictionary) -> void:
	data.remove_node(nd["id"])
	_sync_graph()
	_show_inspector_placeholder()

func _show_inspector_placeholder() -> void:
	for child in _inspector_container.get_children():
		child.queue_free()
	var lbl := Label.new()
	lbl.text = "Select a node to inspect"
	lbl.add_theme_font_size_override("font_size", 11)
	lbl.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_inspector_container.add_child(lbl)

func _on_graph_changed() -> void:
	pass
