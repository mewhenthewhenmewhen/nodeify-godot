class_name NodeifyRegistry
extends RefCounted

const CATEGORIES = {
	"events": {"label": "Events", "color": Color(0.91, 0.3, 0.24), "icon": "\u26A1"},
	"nodes_3d": {"label": "3D Nodes", "color": Color(0.61, 0.35, 0.71), "icon": "\u25C6"},
	"nodes_2d": {"label": "2D Nodes", "color": Color(0.18, 0.8, 0.44), "icon": "\u25A0"},
	"logic": {"label": "Logic", "color": Color(0.18, 0.8, 0.44), "icon": "\u2661"},
	"math": {"label": "Math", "color": Color(0.95, 0.61, 0.07), "icon": "\u00B1"},
	"input": {"label": "Input", "color": Color(0.9, 0.49, 0.13), "icon": "\u2328"},
	"transform": {"label": "Transform", "color": Color(0.1, 0.74, 0.61), "icon": "\u21C4"},
	"flow": {"label": "Flow", "color": Color(1.0, 0.34, 0.13), "icon": "\u2192"},
	"variables": {"label": "Variables", "color": Color(0, 0.74, 0.83), "icon": "\u2261"},
	"signals": {"label": "Signals", "color": Color(0.93, 0.26, 0.55), "icon": "\u25CE"},
	"audio": {"label": "Audio", "color": Color(0.55, 0.35, 0.55), "icon": "\u266B"},
}

const NODE_DEFS = {
	"on_ready": {
		"category": "events", "label": "On Ready",
		"outputs": [{"name": "", "type": "exec"}], "inputs": [],
		"desc": "Fires when the node enters the scene tree",
	},
	"on_process": {
		"category": "events", "label": "On Process",
		"outputs": [{"name": "Delta", "type": "data"}, {"name": "", "type": "exec"}], "inputs": [],
		"desc": "Fires every frame with delta time",
	},
	"on_physics_process": {
		"category": "events", "label": "On Physics Process",
		"outputs": [{"name": "Delta", "type": "data"}, {"name": "", "type": "exec"}], "inputs": [],
		"desc": "Fires every physics frame",
	},
	"on_input": {
		"category": "events", "label": "On Input",
		"outputs": [{"name": "Event", "type": "data"}, {"name": "", "type": "exec"}], "inputs": [],
		"desc": "Fires on any input event",
	},
	"on_key_pressed": {
		"category": "events", "label": "On Key Pressed",
		"outputs": [{"name": "Keycode", "type": "data"}, {"name": "", "type": "exec"}], "inputs": [],
		"props": {"key": "KEY_SPACE"},
		"desc": "Fires when a specific key is pressed",
	},
	"on_body_entered": {
		"category": "events", "label": "On Body Entered",
		"outputs": [{"name": "Body", "type": "data"}, {"name": "", "type": "exec"}], "inputs": [],
		"desc": "Fires when a body enters an Area",
	},
	"on_signal": {
		"category": "signals", "label": "On Signal",
		"outputs": [{"name": "", "type": "exec"}], "inputs": [],
		"props": {"signal_name": "my_signal"},
		"desc": "Fires when a custom signal is emitted",
	},
	"on_timer_timeout": {
		"category": "events", "label": "On Timer Timeout",
		"outputs": [{"name": "", "type": "exec"}], "inputs": [],
		"desc": "Fires when a Timer node times out",
	},

	"instantiate_scene": {
		"category": "nodes_3d", "label": "Instantiate Scene",
		"outputs": [{"name": "Node", "type": "data"}, {"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}],
		"props": {"path": ""},
		"desc": "Instances a scene and returns the root node",
	},
	"get_node_3d": {
		"category": "nodes_3d", "label": "Get Node 3D",
		"outputs": [{"name": "Node", "type": "data"}],
		"inputs": [{"name": "Path", "type": "data"}],
		"props": {"path": ""},
		"desc": "Gets a Node3D by path",
	},
	"set_position_3d": {
		"category": "nodes_3d", "label": "Set Position 3D",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Node", "type": "data"}, {"name": "Position", "type": "data"}],
		"desc": "Sets the global position of a Node3D",
	},
	"set_rotation_3d": {
		"category": "nodes_3d", "label": "Set Rotation 3D",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Node", "type": "data"}, {"name": "Rotation", "type": "data"}],
		"desc": "Sets the rotation (Euler) of a Node3D",
	},
	"set_scale_3d": {
		"category": "nodes_3d", "label": "Set Scale 3D",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Node", "type": "data"}, {"name": "Scale", "type": "data"}],
		"desc": "Sets the scale of a Node3D",
	},
	"move_toward_3d": {
		"category": "nodes_3d", "label": "Move Toward 3D",
		"outputs": [{"name": "Position", "type": "data"}, {"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Current", "type": "data"}, {"name": "Target", "type": "data"}, {"name": "Speed", "type": "data"}],
		"desc": "Moves a position toward a target",
	},
	"apply_impulse_3d": {
		"category": "nodes_3d", "label": "Apply Impulse 3D",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Body", "type": "data"}, {"name": "Impulse", "type": "data"}],
		"desc": "Applies an impulse to a RigidBody3D",
	},
	"look_at_3d": {
		"category": "nodes_3d", "label": "Look At 3D",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Node", "type": "data"}, {"name": "Target", "type": "data"}],
		"desc": "Makes a Node3D look at a target position",
	},

	"instantiate_scene_2d": {
		"category": "nodes_2d", "label": "Instantiate Scene 2D",
		"outputs": [{"name": "Node", "type": "data"}, {"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}],
		"props": {"path": ""},
		"desc": "Instances a 2D scene",
	},
	"get_node_2d": {
		"category": "nodes_2d", "label": "Get Node 2D",
		"outputs": [{"name": "Node", "type": "data"}],
		"inputs": [{"name": "Path", "type": "data"}],
		"props": {"path": ""},
		"desc": "Gets a Node2D by path",
	},
	"set_position_2d": {
		"category": "nodes_2d", "label": "Set Position 2D",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Node", "type": "data"}, {"name": "Position", "type": "data"}],
		"desc": "Sets the global position of a Node2D",
	},
	"set_rotation_2d": {
		"category": "nodes_2d", "label": "Set Rotation 2D",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Node", "type": "data"}, {"name": "Angle", "type": "data"}],
		"desc": "Sets the rotation of a Node2D (radians)",
	},
	"set_scale_2d": {
		"category": "nodes_2d", "label": "Set Scale 2D",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Node", "type": "data"}, {"name": "Scale", "type": "data"}],
		"desc": "Sets the scale of a Node2D",
	},
	"apply_impulse_2d": {
		"category": "nodes_2d", "label": "Apply Impulse 2D",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Body", "type": "data"}, {"name": "Impulse", "type": "data"}],
		"desc": "Applies an impulse to a RigidBody2D",
	},

	"if_else": {
		"category": "logic", "label": "If / Else",
		"outputs": [{"name": "True", "type": "exec"}, {"name": "False", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Condition", "type": "data"}],
		"desc": "Branches based on condition",
	},
	"compare": {
		"category": "logic", "label": "Compare",
		"outputs": [{"name": "Result", "type": "data"}],
		"inputs": [{"name": "A", "type": "data"}, {"name": "B", "type": "data"}],
		"props": {"operator": "=="},
		"desc": "==, !=, >, <, >=, <=",
	},
	"and_gate": {"category": "logic", "label": "AND", "outputs": [{"name": "Result", "type": "data"}], "inputs": [{"name": "A", "type": "data"}, {"name": "B", "type": "data"}], "desc": "Logical AND"},
	"or_gate":  {"category": "logic", "label": "OR",  "outputs": [{"name": "Result", "type": "data"}], "inputs": [{"name": "A", "type": "data"}, {"name": "B", "type": "data"}], "desc": "Logical OR"},
	"not_gate": {"category": "logic", "label": "NOT", "outputs": [{"name": "Result", "type": "data"}], "inputs": [{"name": "A", "type": "data"}], "desc": "Logical NOT"},

	"math_op": {
		"category": "math", "label": "Math",
		"outputs": [{"name": "Result", "type": "data"}],
		"inputs": [{"name": "A", "type": "data"}, {"name": "B", "type": "data"}],
		"props": {"operator": "+"},
		"desc": "+, -, *, /, %",
	},
	"number": {
		"category": "math", "label": "Number",
		"outputs": [{"name": "Value", "type": "data"}],
		"inputs": [],
		"props": {"value": 0.0},
		"desc": "Constant number",
	},
	"vector3": {
		"category": "math", "label": "Vector3",
		"outputs": [{"name": "Vector", "type": "data"}],
		"inputs": [{"name": "X", "type": "data"}, {"name": "Y", "type": "data"}, {"name": "Z", "type": "data"}],
		"desc": "Creates a Vector3",
	},
	"vector2": {
		"category": "math", "label": "Vector2",
		"outputs": [{"name": "Vector", "type": "data"}],
		"inputs": [{"name": "X", "type": "data"}, {"name": "Y", "type": "data"}],
		"desc": "Creates a Vector2",
	},
	"math_func": {
		"category": "math", "label": "Math Function",
		"outputs": [{"name": "Result", "type": "data"}],
		"inputs": [{"name": "Value", "type": "data"}],
		"props": {"function": "abs"},
		"desc": "abs, sin, cos, sqrt, floor, ceil, round, deg_to_rad, rad_to_deg",
	},
	"lerp": {
		"category": "math", "label": "Lerp",
		"outputs": [{"name": "Result", "type": "data"}],
		"inputs": [{"name": "A", "type": "data"}, {"name": "B", "type": "data"}, {"name": "T", "type": "data"}],
		"desc": "Linear interpolation",
	},
	"random_range": {
		"category": "math", "label": "Random Range",
		"outputs": [{"name": "Value", "type": "data"}],
		"inputs": [{"name": "Min", "type": "data"}, {"name": "Max", "type": "data"}],
		"desc": "Random float between min and max",
	},

	"is_action_pressed": {
		"category": "input", "label": "Is Action Pressed",
		"outputs": [{"name": "Pressed", "type": "data"}],
		"inputs": [],
		"props": {"action": "ui_accept"},
		"desc": "True while action is held",
	},
	"is_action_just_pressed": {
		"category": "input", "label": "Is Action Just Pressed",
		"outputs": [{"name": "Pressed", "type": "data"}],
		"inputs": [],
		"props": {"action": "ui_accept"},
		"desc": "True on the frame action was pressed",
	},
	"is_key_pressed": {
		"category": "input", "label": "Is Key Pressed",
		"outputs": [{"name": "Pressed", "type": "data"}],
		"inputs": [],
		"props": {"key": "KEY_W"},
		"desc": "True while a key is held",
	},
	"get_axis": {
		"category": "input", "label": "Get Axis",
		"outputs": [{"name": "Value", "type": "data"}],
		"inputs": [],
		"props": {"negative": "ui_left", "positive": "ui_right"},
		"desc": "Returns -1 to 1 from two opposing actions",
	},
	"get_vector": {
		"category": "input", "label": "Get Vector",
		"outputs": [{"name": "Vector", "type": "data"}],
		"inputs": [],
		"props": {"negative_x": "ui_left", "positive_x": "ui_right", "negative_y": "ui_up", "positive_y": "ui_down"},
		"desc": "Returns a normalized Vector2 from four actions",
	},

	"set_property": {
		"category": "transform", "label": "Set Property",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Object", "type": "data"}, {"name": "Value", "type": "data"}],
		"props": {"property": "position"},
		"desc": "Sets a property on any object",
	},
	"get_property": {
		"category": "transform", "label": "Get Property",
		"outputs": [{"name": "Value", "type": "data"}],
		"inputs": [{"name": "Object", "type": "data"}],
		"props": {"property": "position"},
		"desc": "Gets a property from any object",
	},
	"translate": {
		"category": "transform", "label": "Translate",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Node", "type": "data"}, {"name": "Offset", "type": "data"}],
		"desc": "Translates a node by an offset",
	},

	"sequence": {
		"category": "flow", "label": "Sequence",
		"outputs": [{"name": "1", "type": "exec"}, {"name": "2", "type": "exec"}, {"name": "3", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}],
		"desc": "Executes outputs in order",
	},
	"delay": {
		"category": "flow", "label": "Delay",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}],
		"props": {"seconds": 1.0},
		"desc": "Waits before continuing (uses await)",
	},
	"for_loop": {
		"category": "flow", "label": "For Loop",
		"outputs": [{"name": "Loop", "type": "exec"}, {"name": "Done", "type": "exec"}, {"name": "Index", "type": "data"}],
		"inputs": [{"name": "", "type": "exec"}],
		"props": {"count": 10},
		"desc": "Loops N times",
	},
	"while_loop": {
		"category": "flow", "label": "While Loop",
		"outputs": [{"name": "Loop", "type": "exec"}, {"name": "Done", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Condition", "type": "data"}],
		"desc": "Loops while condition is true",
	},
	"do_once": {
		"category": "flow", "label": "Do Once",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}],
		"desc": "Only runs once",
	},
	"switch": {
		"category": "flow", "label": "Switch",
		"outputs": [{"name": "0", "type": "exec"}, {"name": "1", "type": "exec"}, {"name": "2", "type": "exec"}, {"name": "3", "type": "exec"}, {"name": "Default", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Value", "type": "data"}],
		"desc": "Routes execution based on integer value",
	},
	"return": {
		"category": "flow", "label": "Return",
		"outputs": [],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Value", "type": "data"}],
		"desc": "Returns from the function",
	},

	"set_var": {
		"category": "variables", "label": "Set Variable",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Value", "type": "data"}],
		"props": {"name": "my_var"},
		"desc": "Sets a local variable",
	},
	"get_var": {
		"category": "variables", "label": "Get Variable",
		"outputs": [{"name": "Value", "type": "data"}],
		"inputs": [],
		"props": {"name": "my_var"},
		"desc": "Gets a local variable",
	},
	"increment_var": {
		"category": "variables", "label": "Increment",
		"outputs": [{"name": "New Value", "type": "data"}, {"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}],
		"props": {"name": "score", "amount": 1},
		"desc": "Adds to a variable",
	},

	"emit_signal": {
		"category": "signals", "label": "Emit Signal",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}],
		"props": {"signal_name": "my_signal"},
		"desc": "Emits a custom signal",
	},
	"connect_signal": {
		"category": "signals", "label": "Connect Signal",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Object", "type": "data"}],
		"props": {"signal_name": "my_signal"},
		"desc": "Connects a signal to this graph",
	},

	"play_audio": {
		"category": "audio", "label": "Play Audio",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Stream", "type": "data"}],
		"props": {"bus": "Master"},
		"desc": "Plays an AudioStream on a node with AudioStreamPlayer",
	},
	"stop_audio": {
		"category": "audio", "label": "Stop Audio",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}],
		"desc": "Stops audio playback",
	},

	"call_method": {
		"category": "transform", "label": "Call Method",
		"outputs": [{"name": "Result", "type": "data"}, {"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Object", "type": "data"}],
		"props": {"method": ""},
		"desc": "Calls a method on an object",
	},
	"print": {
		"category": "flow", "label": "Print",
		"outputs": [{"name": "", "type": "exec"}],
		"inputs": [{"name": "", "type": "exec"}, {"name": "Value", "type": "data"}],
		"desc": "Prints to the output console",
	},
	"type_cast": {
		"category": "logic", "label": "Type Cast",
		"outputs": [{"name": "Object", "type": "data"}],
		"inputs": [{"name": "Object", "type": "data"}],
		"props": {"type": "Node3D"},
		"desc": "Casts an object to a specific type",
	},
	"is_instance_valid": {
		"category": "logic", "label": "Is Valid",
		"outputs": [{"name": "Valid", "type": "data"}],
		"inputs": [{"name": "Object", "type": "data"}],
		"desc": "Checks if an instance is valid",
	},
	"null_check": {
		"category": "logic", "label": "Is Null",
		"outputs": [{"name": "IsNull", "type": "data"}],
		"inputs": [{"name": "Object", "type": "data"}],
		"desc": "Checks if an object is null",
	},
}

const OPERATOR_OPTIONS = {
	"compare": ["==", "!=", ">", "<", ">=", "<="],
	"math_op": ["+", "-", "*", "/", "%"],
}

const MATH_FUNC_OPTIONS = ["abs", "sin", "cos", "sqrt", "floor", "ceil", "round", "deg_to_rad", "rad_to_deg"]

const KEY_OPTIONS = [
	"KEY_SPACE", "KEY_ENTER", "KEY_ESCAPE", "KEY_TAB",
	"KEY_W", "KEY_A", "KEY_S", "KEY_D",
	"KEY_UP", "KEY_DOWN", "KEY_LEFT", "KEY_RIGHT",
	"KEY_SHIFT", "KEY_CTRL", "KEY_ALT",
	"KEY_0", "KEY_1", "KEY_2", "KEY_3", "KEY_4",
	"KEY_5", "KEY_6", "KEY_7", "KEY_8", "KEY_9",
	"KEY_F1", "KEY_F2", "KEY_F3", "KEY_F4", "KEY_F5",
	"KEY_F6", "KEY_F7", "KEY_F8", "KEY_F9", "KEY_F10",
	"KEY_F11", "KEY_F12",
]

const TYPE_OPTIONS = ["Node", "Node2D", "Node3D", "CharacterBody2D", "CharacterBody3D", "RigidBody2D", "RigidBody3D", "Area2D", "Area3D", "Sprite2D", "MeshInstance3D", "Camera3D", "AudioStreamPlayer", "AudioStreamPlayer2D", "AudioStreamPlayer3D", "Timer", "Label", "RichTextLabel"]

static func get_options_for_prop(key: String, node_type: String) -> Array:
	if key == "operator" and OPERATOR_OPTIONS.has(node_type):
		return OPERATOR_OPTIONS[node_type]
	if key == "function":
		return MATH_FUNC_OPTIONS
	if key == "key":
		return KEY_OPTIONS
	if key == "type":
		return TYPE_OPTIONS
	return []

static func get_category_color(category: String) -> Color:
	if CATEGORIES.has(category):
		return CATEGORIES[category]["color"]
	return Color.WHITE
