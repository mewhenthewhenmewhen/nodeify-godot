class_name NodeifyGraphSaver
extends RefCounted

const FILE_EXTENSION = "nodeify"
const CONFIG_PATH = "res://addons/nodeify/graphs/"

static func save_graph(path: String, data: NodeifyGraphData) -> void:
	var json = JSON.stringify(data.serialize(), "\t")
	var f = FileAccess.open(path, FileAccess.WRITE)
	if f:
		f.store_string(json)
		f.close()
		print("Nodeify: Saved to ", path)

static func load_graph(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		push_error("Nodeify: File not found: " + path)
		return {}
	var f = FileAccess.open(path, FileAccess.READ)
	if f:
		var text = f.get_as_text()
		f.close()
		var json = JSON.new()
		var err = json.parse(text)
		if err == OK:
			return json.data
		push_error("Nodeify: Parse error in " + path)
	return {}

static func save_file_dialog(control: Control, callback: Callable) -> void:
	var dialog := FileDialog.new()
	dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
	dialog.access = FileDialog.ACCESS_FILESYSTEM
	dialog.filters = PackedStringArray(["*.nodeify ; Nodeify Graphs"])
	dialog.title = "Save Nodeify Graph"
	dialog.file_selected.connect(callback)
	control.add_child(dialog)
	dialog.popup_centered(Vector2i(500, 400))

static func open_file_dialog(control: Control, callback: Callable) -> void:
	var dialog := FileDialog.new()
	dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	dialog.access = FileDialog.ACCESS_FILESYSTEM
	dialog.filters = PackedStringArray(["*.nodeify ; Nodeify Graphs"])
	dialog.title = "Open Nodeify Graph"
	dialog.file_selected.connect(callback)
	control.add_child(dialog)
	dialog.popup_centered(Vector2i(500, 400))
