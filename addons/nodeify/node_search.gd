class_name NodeifyNodeSearch
extends Window

signal node_selected(type: String)

var search_input: LineEdit
var list_container: ItemList
var all_items: Array = []

static func create_popup() -> Window:
	var popup = NodeifyNodeSearch.new()
	popup.title = "Add Node"
	popup.size = Vector2i(360, 500)
	popup.window_mode = Window.WINDOW_MODE_POPUP
	popup.transparent = true
	popup.popup_exclusive = true
	return popup

func _ready() -> void:
	var style := StyleBoxFlat.new()
	style.bg_color = Color(0.14, 0.14, 0.16)
	style.border_color = Color(0.3, 0.3, 0.35)
	style.set_border_width_all(1)
	style.set_corner_radius_all(6)
	style.set_content_margin_all(8)
	add_theme_stylebox_override("panel", style)

	var vbox := VBoxContainer.new()
	vbox.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	vbox.add_theme_constant_override("separation", 4)
	add_child(vbox)

	search_input = LineEdit.new()
	search_input.placeholder_text = "Search nodes..."
	search_input.placeholder_alpha = 0.5
	search_input.text_changed.connect(_on_search)
	vbox.add_child(search_input)

	list_container = ItemList.new()
	list_container.size_flags_vertical = Control.SIZE_EXPAND_FILL
	list_container.allow_reselect = true
	list_container.item_selected.connect(_on_item_selected)
	vbox.add_child(list_container)

	_populate_list("")
	search_input.call_deferred("grab_focus")

func _populate_list(filter: String) -> void:
	list_container.clear()
	all_items.clear()
	var f = filter.to_lower()

	for type in NodeifyRegistry.NODE_DEFS:
		var def = NodeifyRegistry.NODE_DEFS[type]
		var label = def.get("label", type)
		var cat = def.get("category", "")
		if f and not label.to_lower().contains(f) and not type.to_lower().contains(f):
			continue
		var color = NodeifyRegistry.get_category_color(cat)
		var cat_label = NodeifyRegistry.CATEGORIES.get(cat, {}).get("label", cat)
		var idx = list_container.add_item(label)
		list_container.set_item_custom_fg_color(idx, color)
		list_container.set_item_metadata(idx, type)
		all_items.append({"type": type, "label": label, "cat": cat_label})

func _on_search(text: String) -> void:
	_populate_list(text)

func _on_item_selected(idx: int) -> void:
	var type = list_container.get_item_metadata(idx)
	node_selected.emit(type)
