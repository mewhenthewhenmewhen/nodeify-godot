class_name NodeifyGraphData
extends RefCounted

signal graph_changed

var nodes: Array[Dictionary] = []
var connections: Array[Dictionary] = []
var next_id: int = 0
var graph_name: String = "untitled"

func create_node(type: String, pos: Vector2, props: Dictionary = {}) -> Dictionary:
	var def = NodeifyRegistry.NODE_DEFS.get(type, {})
	var node := {
		"id": next_id,
		"type": type,
		"label": def.get("label", type),
		"x": pos.x,
		"y": pos.y,
		"props": {},
	}
	for key in def.get("props", {}):
		node["props"][key] = props.get(key, def["props"][key])
	nodes.append(node)
	next_id += 1
	_emit()
	return node

func remove_node(node_id: int) -> void:
	nodes = nodes.filter(func(n): return n["id"] != node_id)
	connections = connections.filter(func(c): return c["from_node"] != node_id and c["to_node"] != node_id)
	_emit()

func move_node(node_id: int, pos: Vector2) -> void:
	for n in nodes:
		if n["id"] == node_id:
			n["x"] = pos.x
			n["y"] = pos.y
			break

func get_node(node_id: int) -> Dictionary:
	for n in nodes:
		if n["id"] == node_id:
			return n
	return {}

func add_connection(from_node: int, from_port: int, to_node: int, to_port: int) -> void:
	connections = connections.filter(func(c):
		return not (c["to_node"] == to_node and c["to_port"] == to_port)
	)
	connections.append({
		"from_node": from_node,
		"from_port": from_port,
		"to_node": to_node,
		"to_port": to_port,
	})
	_emit()

func remove_connection(from_node: int, from_port: int, to_node: int, to_port: int) -> void:
	connections = connections.filter(func(c):
		return not (c["from_node"] == from_node and c["from_port"] == from_port and c["to_node"] == to_node and c["to_port"] == to_port)
	)
	_emit()

func get_input_connection(node_id: int, port: int) -> Dictionary:
	for c in connections:
		if c["to_node"] == node_id and c["to_port"] == port:
			return c
	return {}

func get_output_connections(node_id: int, port: int) -> Array:
	return connections.filter(func(c): return c["from_node"] == node_id and c["from_port"] == port)

func serialize() -> Dictionary:
	return {
		"graph_name": graph_name,
		"next_id": next_id,
		"nodes": nodes.duplicate(true),
		"connections": connections.duplicate(true),
	}

func deserialize(data: Dictionary) -> void:
	graph_name = data.get("graph_name", "untitled")
	next_id = data.get("next_id", 0)
	nodes.clear()
	for n in data.get("nodes", []):
		nodes.append(n.duplicate(true))
	connections.clear()
	for c in data.get("connections", []):
		connections.append(c.duplicate(true))
	_emit()

func clear() -> void:
	nodes.clear()
	connections.clear()
	next_id = 0
	_emit()

func _emit() -> void:
	graph_changed.emit()
