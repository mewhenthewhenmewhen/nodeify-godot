class_name NodeifyRegistry extends RefCounted

const CATEGORIES := {
	"events": {"label": "Events", "color": Color(0.85, 0.2, 0.2)},
	"node_ops": {"label": "Node Operations", "color": Color(0.2, 0.4, 0.85)},
	"transform_3d": {"label": "3D Transform", "color": Color(0.6, 0.3, 0.8)},
	"transform_2d": {"label": "2D Transform", "color": Color(0.2, 0.75, 0.3)},
	"physics": {"label": "Physics", "color": Color(0.9, 0.6, 0.1)},
	"input": {"label": "Input", "color": Color(0.1, 0.8, 0.8)},
	"logic": {"label": "Logic", "color": Color(0.1, 0.65, 0.65)},
	"math": {"label": "Math", "color": Color(0.85, 0.8, 0.2)},
	"string_ops": {"label": "String", "color": Color(0.65, 0.4, 0.65)},
	"array_ops": {"label": "Array", "color": Color(0.85, 0.4, 0.6)},
	"dict_ops": {"label": "Dictionary", "color": Color(0.3, 0.7, 0.3)},
	"flow": {"label": "Flow Control", "color": Color(0.9, 0.4, 0.15)},
	"variables": {"label": "Variables", "color": Color(0.15, 0.6, 0.6)},
	"type_conv": {"label": "Type Conversion", "color": Color(0.6, 0.4, 0.2)},
	"signals": {"label": "Signals", "color": Color(0.8, 0.3, 0.45)},
	"audio": {"label": "Audio", "color": Color(0.55, 0.3, 0.75)},
	"timer": {"label": "Timer", "color": Color(0.4, 0.7, 0.9)},
	"animation": {"label": "Animation", "color": Color(0.85, 0.55, 0.15)},
	"scene": {"label": "Scene Management", "color": Color(0.35, 0.3, 0.8)},
	"utility": {"label": "Utility", "color": Color(0.55, 0.55, 0.55)},
	"camera": {"label": "Camera", "color": Color(0.4, 0.55, 0.7)},
}
	"window": {"label": "Window", "color": Color(0.3, 0.5, 0.8)},
	"display": {"label": "Display (Scratch)", "color": Color(0.9, 0.7, 0.2)},

const NODE_DEFS := {
	# ── Events ──
	"on_ready": {
		"category": "events",
		"label": "On Ready",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
		],
		"desc": "Fired when the node enters the scene tree.",
	},
	"on_process": {
		"category": "events",
		"label": "On Process",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "delta", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Called every frame.",
	},
	"on_physics_process": {
		"category": "events",
		"label": "On Physics Process",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "delta", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Called every physics frame.",
	},
	"on_input": {
		"category": "events",
		"label": "On Input",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
		],
		"desc": "Fired on any input event.",
	},
	"on_unhandled_input": {
		"category": "events",
		"label": "On Unhandled Input",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
		],
		"desc": "Fired on unhandled input.",
	},
	"on_key_pressed": {
		"category": "events",
		"label": "On Key Pressed",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "event", "type": "data"},
		],
		"inputs": [
		],
		"props": {"key": ""},
		"desc": "Fired when a specific key is pressed.",
	},
	"on_key_released": {
		"category": "events",
		"label": "On Key Released",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "event", "type": "data"},
		],
		"inputs": [
		],
		"props": {"key": ""},
		"desc": "Fired when a specific key is released.",
	},
	"on_body_entered": {
		"category": "events",
		"label": "On Body Entered 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "body", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Fired when a body enters the area.",
	},
	"on_body_exited": {
		"category": "events",
		"label": "On Body Exited 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "body", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Fired when a body exits the area.",
	},
	"on_body_entered_2d": {
		"category": "events",
		"label": "On Body Entered 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "body", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Fired when a 2D body enters.",
	},
	"on_body_exited_2d": {
		"category": "events",
		"label": "On Body Exited 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "body", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Fired when a 2D body exits.",
	},
	"on_area_entered": {
		"category": "events",
		"label": "On Area Entered 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "area", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Fired when an area enters.",
	},
	"on_area_entered_2d": {
		"category": "events",
		"label": "On Area Entered 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "area", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Fired when a 2D area enters.",
	},
	"on_timer_timeout": {
		"category": "events",
		"label": "On Timer Timeout",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
		],
		"desc": "Fired when the timer reaches zero.",
	},
	"on_animation_finished": {
		"category": "events",
		"label": "On Animation Finished",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
		],
		"desc": "Fired when the animation ends.",
	},
	# ── Node Operations ──
	"add_child": {
		"category": "node_ops",
		"label": "Add Child",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "child", "type": "data"},
		],
		"desc": "Adds a node as a child.",
	},
	"remove_child": {
		"category": "node_ops",
		"label": "Remove Child",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "child", "type": "data"},
		],
		"desc": "Removes a child node.",
	},
	"queue_free": {
		"category": "node_ops",
		"label": "Queue Free",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Queues the node for deletion.",
	},
	"instantiate_scene": {
		"category": "node_ops",
		"label": "Instantiate Scene",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"path": ""},
		"desc": "Instantiates a .tscn scene file.",
	},
	"get_node": {
		"category": "node_ops",
		"label": "Get Node",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"path": ""},
		"desc": "Returns a node at the given path.",
	},
	"get_node_or_null": {
		"category": "node_ops",
		"label": "Get Node Or Null",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"path": ""},
		"desc": "Returns a node or null.",
	},
	"get_parent": {
		"category": "node_ops",
		"label": "Get Parent",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the parent node.",
	},
	"get_children": {
		"category": "node_ops",
		"label": "Get Children",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns all children.",
	},
	"get_child": {
		"category": "node_ops",
		"label": "Get Child",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"props": {"index": "0"},
		"desc": "Returns child at index.",
	},
	"get_index": {
		"category": "node_ops",
		"label": "Get Index",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the node's index.",
	},
	"is_inside_tree": {
		"category": "node_ops",
		"label": "Is Inside Tree",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "True if node is in the tree.",
	},
	"is_node_in_group": {
		"category": "node_ops",
		"label": "Is In Group",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"props": {"group": ""},
		"desc": "True if node is in the group.",
	},
	"add_to_group": {
		"category": "node_ops",
		"label": "Add To Group",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"props": {"group": ""},
		"desc": "Adds node to a group.",
	},
	"remove_from_group": {
		"category": "node_ops",
		"label": "Remove From Group",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"props": {"group": ""},
		"desc": "Removes node from a group.",
	},
	"get_nodes_in_group": {
		"category": "node_ops",
		"label": "Get Nodes In Group",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"group": ""},
		"desc": "Returns all nodes in the group.",
	},
	"get_tree": {
		"category": "node_ops",
		"label": "Get Scene Tree",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the SceneTree.",
	},
	"get_root": {
		"category": "node_ops",
		"label": "Get Root",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the root viewport.",
	},
	"reparent": {
		"category": "node_ops",
		"label": "Reparent",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "new_parent", "type": "data"},
		],
		"desc": "Reparents the node.",
	},
	"set_name": {
		"category": "node_ops",
		"label": "Set Name",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "name", "type": "data"},
		],
		"desc": "Sets the node name.",
	},
	"get_name": {
		"category": "node_ops",
		"label": "Get Name",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the node name.",
	},
	"is_instance_valid": {
		"category": "node_ops",
		"label": "Is Instance Valid",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "instance", "type": "data"},
		],
		"desc": "True if the instance is valid.",
	},
	"is_class": {
		"category": "node_ops",
		"label": "Is Class",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"props": {"class_name": ""},
		"desc": "True if node is of the class.",
	},
	"get_class": {
		"category": "node_ops",
		"label": "Get Class",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the node class name.",
	},
	# ── 3D Transform ──
	"set_position_3d": {
		"category": "transform_3d",
		"label": "Set Position 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "position", "type": "data"},
		],
		"desc": "Sets the global position in 3D.",
	},
	"get_position_3d": {
		"category": "transform_3d",
		"label": "Get Position 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the global position.",
	},
	"set_local_position_3d": {
		"category": "transform_3d",
		"label": "Set Local Position 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "position", "type": "data"},
		],
		"desc": "Sets the local position.",
	},
	"get_local_position_3d": {
		"category": "transform_3d",
		"label": "Get Local Position 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the local position.",
	},
	"set_rotation_3d": {
		"category": "transform_3d",
		"label": "Set Rotation 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "rotation", "type": "data"},
		],
		"desc": "Sets the rotation in radians.",
	},
	"get_rotation_3d": {
		"category": "transform_3d",
		"label": "Get Rotation 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the rotation.",
	},
	"set_scale_3d": {
		"category": "transform_3d",
		"label": "Set Scale 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "scale", "type": "data"},
		],
		"desc": "Sets the scale in 3D.",
	},
	"get_scale_3d": {
		"category": "transform_3d",
		"label": "Get Scale 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the scale.",
	},
	"look_at_3d": {
		"category": "transform_3d",
		"label": "Look At 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "target", "type": "data"},
		],
		"desc": "Rotates to face the target.",
	},
	"rotate_3d": {
		"category": "transform_3d",
		"label": "Rotate 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "axis", "type": "data"},
			{"name": "angle", "type": "data"},
		],
		"desc": "Rotates around an axis.",
	},
	"translate_3d": {
		"category": "transform_3d",
		"label": "Translate 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "offset", "type": "data"},
		],
		"desc": "Translates in local space.",
	},
	"global_translate_3d": {
		"category": "transform_3d",
		"label": "Global Translate 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "offset", "type": "data"},
		],
		"desc": "Translates in global space.",
	},
	"get_forward_3d": {
		"category": "transform_3d",
		"label": "Get Forward 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the forward direction vector.",
	},
	"get_global_transform_3d": {
		"category": "transform_3d",
		"label": "Get Global Transform 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the global Transform3D.",
	},
	"show_3d": {
		"category": "transform_3d",
		"label": "Show 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Makes the node visible.",
	},
	"hide_3d": {
		"category": "transform_3d",
		"label": "Hide 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Makes the node invisible.",
	},
	"is_visible_3d": {
		"category": "transform_3d",
		"label": "Is Visible 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "True if the node is visible.",
	},
	# ── 2D Transform ──
	"set_position_2d": {
		"category": "transform_2d",
		"label": "Set Position 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "position", "type": "data"},
		],
		"desc": "Sets the position in 2D.",
	},
	"get_position_2d": {
		"category": "transform_2d",
		"label": "Get Position 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the 2D position.",
	},
	"set_rotation_2d": {
		"category": "transform_2d",
		"label": "Set Rotation 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "rotation", "type": "data"},
		],
		"desc": "Sets the rotation in 2D.",
	},
	"get_rotation_2d": {
		"category": "transform_2d",
		"label": "Get Rotation 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the 2D rotation.",
	},
	"set_scale_2d": {
		"category": "transform_2d",
		"label": "Set Scale 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "scale", "type": "data"},
		],
		"desc": "Sets the 2D scale.",
	},
	"get_scale_2d": {
		"category": "transform_2d",
		"label": "Get Scale 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the 2D scale.",
	},
	"look_at_2d": {
		"category": "transform_2d",
		"label": "Look At 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "target", "type": "data"},
		],
		"desc": "Rotates to face the 2D target.",
	},
	"rotate_2d": {
		"category": "transform_2d",
		"label": "Rotate 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "angle", "type": "data"},
		],
		"desc": "Rotates by an angle.",
	},
	"translate_2d": {
		"category": "transform_2d",
		"label": "Translate 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "offset", "type": "data"},
		],
		"desc": "Translates the node.",
	},
	"get_angle_2d": {
		"category": "transform_2d",
		"label": "Get Angle To 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "point", "type": "data"},
		],
		"desc": "Returns angle to a point.",
	},
	"get_distance_to_2d": {
		"category": "transform_2d",
		"label": "Get Distance To 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "point", "type": "data"},
		],
		"desc": "Returns distance to a point.",
	},
	# ── Physics ──
	"move_and_slide": {
		"category": "physics",
		"label": "Move And Slide",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Moves with collision using the body's velocity.",
	},
	"apply_impulse_3d": {
		"category": "physics",
		"label": "Apply Impulse 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "impulse", "type": "data"},
		],
		"desc": "Applies a 3D impulse.",
	},
	"apply_impulse_2d": {
		"category": "physics",
		"label": "Apply Impulse 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "impulse", "type": "data"},
		],
		"desc": "Applies a 2D impulse.",
	},
	"apply_force_3d": {
		"category": "physics",
		"label": "Apply Force 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "force", "type": "data"},
		],
		"desc": "Applies a continuous 3D force.",
	},
	"apply_force_2d": {
		"category": "physics",
		"label": "Apply Force 2D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "force", "type": "data"},
		],
		"desc": "Applies a continuous 2D force.",
	},
	"apply_torque_3d": {
		"category": "physics",
		"label": "Apply Torque 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "torque", "type": "data"},
		],
		"desc": "Applies a 3D torque.",
	},
	"set_velocity_3d": {
		"category": "physics",
		"label": "Set Velocity 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
			{"name": "velocity", "type": "data"},
		],
		"desc": "Sets the body velocity.",
	},
	"get_velocity_3d": {
		"category": "physics",
		"label": "Get Velocity 3D",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "Returns the body velocity.",
	},
	"is_on_floor_3d": {
		"category": "physics",
		"label": "Is On Floor",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "True if the body is on the floor.",
	},
	"is_on_wall_3d": {
		"category": "physics",
		"label": "Is On Wall",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "True if the body is on a wall.",
	},
	"is_on_ceiling_3d": {
		"category": "physics",
		"label": "Is On Ceiling",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "node", "type": "data"},
		],
		"desc": "True if the body is on the ceiling.",
	},
	# ── Input ──
	"is_action_pressed": {
		"category": "input",
		"label": "Is Action Pressed",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"action": ""},
		"desc": "Returns true while the action is held.",
	},
	"is_action_just_pressed": {
		"category": "input",
		"label": "Is Action Just Pressed",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"action": ""},
		"desc": "True on the first frame the action is pressed.",
	},
	"is_action_just_released": {
		"category": "input",
		"label": "Is Action Just Released",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"action": ""},
		"desc": "True on the first frame the action is released.",
	},
	"is_key_pressed": {
		"category": "input",
		"label": "Is Key Pressed",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"key": ""},
		"desc": "True if the physical key is held.",
	},
	"get_input_axis": {
		"category": "input",
		"label": "Get Input Axis",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"negative": "", "positive": ""},
		"desc": "Returns -1/0/1 from two opposing actions.",
	},
	"get_input_vector": {
		"category": "input",
		"label": "Get Input Vector",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"neg_x": "", "pos_x": "", "neg_y": "", "pos_y": ""},
		"desc": "Returns a normalized Vector2 from four actions.",
	},
	"get_mouse_position": {
		"category": "input",
		"label": "Get Mouse Position",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Returns the mouse position in screen coordinates.",
	},
	"is_mouse_button_pressed": {
		"category": "input",
		"label": "Is Mouse Button Pressed",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"button": ""},
		"desc": "True if the mouse button is held.",
	},
	# ── Logic ──
	"if_else": {
		"category": "logic",
		"label": "If / Else",
		"outputs": [
			{"name": "exec_true", "type": "exec"},
			{"name": "exec_false", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "condition", "type": "data"},
		],
		"desc": "Routes execution based on a boolean.",
	},
	"compare": {
		"category": "logic",
		"label": "Compare",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"props": {"operator": "=="},
		"desc": "Compares two values.",
	},
	"and_gate": {
		"category": "logic",
		"label": "And",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"desc": "True only when both inputs are true.",
	},
	"or_gate": {
		"category": "logic",
		"label": "Or",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"desc": "True when either input is true.",
	},
	"not_gate": {
		"category": "logic",
		"label": "Not",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Inverts a boolean value.",
	},
	"is_equal": {
		"category": "logic",
		"label": "Is Equal",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"desc": "True if both inputs are deeply equal.",
	},
	"is_null": {
		"category": "logic",
		"label": "Is Null",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "True if the value is null.",
	},
	"type_cast": {
		"category": "logic",
		"label": "Type Cast",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"props": {"type": "Node"},
		"desc": "Casts a value to the specified type.",
	},
	# ── Math ──
	"number": {
		"category": "math",
		"label": "Number",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
		],
		"props": {"value": "0.0"},
		"desc": "A constant float value.",
	},
	"vector2": {
		"category": "math",
		"label": "Vector2",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "x", "type": "data"},
			{"name": "y", "type": "data"},
		],
		"desc": "Constructs a Vector2 from X and Y.",
	},
	"vector3": {
		"category": "math",
		"label": "Vector3",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "x", "type": "data"},
			{"name": "y", "type": "data"},
			{"name": "z", "type": "data"},
		],
		"desc": "Constructs a Vector3 from X, Y and Z.",
	},
	"math_op": {
		"category": "math",
		"label": "Math Operation",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"props": {"operator": "+"},
		"desc": "Performs +, -, *, / or % on two values.",
	},
	"math_func": {
		"category": "math",
		"label": "Math Function",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"props": {"function": "abs"},
		"desc": "Applies a math function (abs, sin, cos, etc).",
	},
	"lerp": {
		"category": "math",
		"label": "Lerp",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
			{"name": "weight", "type": "data"},
		],
		"desc": "Linearly interpolates between a and b.",
	},
	"clamp": {
		"category": "math",
		"label": "Clamp",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
			{"name": "min", "type": "data"},
			{"name": "max", "type": "data"},
		],
		"desc": "Clamps a value between min and max.",
	},
	"min_val": {
		"category": "math",
		"label": "Min",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"desc": "Returns the smaller of two values.",
	},
	"max_val": {
		"category": "math",
		"label": "Max",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"desc": "Returns the larger of two values.",
	},
	"random_range": {
		"category": "math",
		"label": "Random Range",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "from", "type": "data"},
			{"name": "to", "type": "data"},
		],
		"desc": "Returns a random float between from and to.",
	},
	"random_int": {
		"category": "math",
		"label": "Random Int",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "from", "type": "data"},
			{"name": "to", "type": "data"},
		],
		"desc": "Returns a random integer between from and to.",
	},
	"deg_to_rad": {
		"category": "math",
		"label": "Deg to Rad",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "degrees", "type": "data"},
		],
		"desc": "Converts degrees to radians.",
	},
	"rad_to_deg": {
		"category": "math",
		"label": "Rad to Deg",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "radians", "type": "data"},
		],
		"desc": "Converts radians to degrees.",
	},
	"abs_val": {
		"category": "math",
		"label": "Abs",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Returns the absolute value.",
	},
	"ceil_val": {
		"category": "math",
		"label": "Ceil",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Rounds up to the nearest integer.",
	},
	"floor_val": {
		"category": "math",
		"label": "Floor",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Rounds down to the nearest integer.",
	},
	"sign_val": {
		"category": "math",
		"label": "Sign",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Returns -1, 0 or 1.",
	},
	"sqrt_val": {
		"category": "math",
		"label": "Sqrt",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Returns the square root.",
	},
	"pow_val": {
		"category": "math",
		"label": "Power",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "base", "type": "data"},
			{"name": "exp", "type": "data"},
		],
		"desc": "Returns base raised to the power of exp.",
	},
	"fmod_val": {
		"category": "math",
		"label": "Fmod",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"desc": "Floating-point modulo.",
	},
	"snapped_val": {
		"category": "math",
		"label": "Snapped",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
			{"name": "step", "type": "data"},
		],
		"desc": "Snaps value to the given step.",
	},
	# ── String ──
	"string_value": {
		"category": "string_ops",
		"label": "String Value",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
		],
		"props": {"value": ""},
		"desc": "A constant string value.",
	},
	"string_length": {
		"category": "string_ops",
		"label": "Length",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
		],
		"desc": "Returns the number of characters.",
	},
	"string_concat": {
		"category": "string_ops",
		"label": "Concat",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"desc": "Joins two strings together.",
	},
	"string_substr": {
		"category": "string_ops",
		"label": "Substring",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
		],
		"props": {"start": "0", "length": "1"},
		"desc": "Extracts a portion of the string.",
	},
	"string_replace": {
		"category": "string_ops",
		"label": "Replace",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
		],
		"props": {"from": "", "to": ""},
		"desc": "Replaces all occurrences.",
	},
	"string_contains": {
		"category": "string_ops",
		"label": "Contains",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
			{"name": "what", "type": "data"},
		],
		"desc": "True if string contains substring.",
	},
	"string_to_upper": {
		"category": "string_ops",
		"label": "To Upper",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
		],
		"desc": "Converts to uppercase.",
	},
	"string_to_lower": {
		"category": "string_ops",
		"label": "To Lower",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
		],
		"desc": "Converts to lowercase.",
	},
	"string_to_int": {
		"category": "string_ops",
		"label": "To Int",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
		],
		"desc": "Parses string as integer.",
	},
	"string_to_float": {
		"category": "string_ops",
		"label": "To Float",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
		],
		"desc": "Parses string as float.",
	},
	"string_split": {
		"category": "string_ops",
		"label": "Split",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
		],
		"props": {"delimiter": ","},
		"desc": "Splits into an array.",
	},
	"string_find": {
		"category": "string_ops",
		"label": "Find",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
			{"name": "search", "type": "data"},
		],
		"desc": "Returns index of first match, or -1.",
	},
	"string_begins_with": {
		"category": "string_ops",
		"label": "Begins With",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
			{"name": "prefix", "type": "data"},
		],
		"desc": "True if string starts with prefix.",
	},
	"string_ends_with": {
		"category": "string_ops",
		"label": "Ends With",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
			{"name": "suffix", "type": "data"},
		],
		"desc": "True if string ends with suffix.",
	},
	"string_join": {
		"category": "string_ops",
		"label": "Join",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "parts", "type": "data"},
		],
		"props": {"delimiter": ", "},
		"desc": "Joins array with delimiter.",
	},
	"string_pad_zeros": {
		"category": "string_ops",
		"label": "Pad Zeros",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "string", "type": "data"},
		],
		"props": {"width": "2"},
		"desc": "Pads with leading zeros.",
	},
	"string_hex_to_int": {
		"category": "string_ops",
		"label": "Hex to Int",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "hex", "type": "data"},
		],
		"desc": "Parses hex string as integer.",
	},
	"string_num_int64": {
		"category": "string_ops",
		"label": "Num to String",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "number", "type": "data"},
		],
		"desc": "Converts number to string.",
	},
	"string_num_scientific": {
		"category": "string_ops",
		"label": "Scientific Notation",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "number", "type": "data"},
		],
		"desc": "Converts to scientific notation.",
	},
	# ── Array ──
	"array_create": {
		"category": "array_ops",
		"label": "Create Array",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Creates a new empty array.",
	},
	"array_append": {
		"category": "array_ops",
		"label": "Append",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
			{"name": "value", "type": "data"},
		],
		"desc": "Appends a value to the array.",
	},
	"array_remove": {
		"category": "array_ops",
		"label": "Remove at Index",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"props": {"index": "0"},
		"desc": "Removes element at index.",
	},
	"array_size": {
		"category": "array_ops",
		"label": "Size",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"desc": "Returns the number of elements.",
	},
	"array_has": {
		"category": "array_ops",
		"label": "Has",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
			{"name": "value", "type": "data"},
		],
		"desc": "True if array contains value.",
	},
	"array_find": {
		"category": "array_ops",
		"label": "Find",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
			{"name": "value", "type": "data"},
		],
		"desc": "Returns index of value, or -1.",
	},
	"array_sort": {
		"category": "array_ops",
		"label": "Sort",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"desc": "Sorts in ascending order.",
	},
	"array_clear": {
		"category": "array_ops",
		"label": "Clear",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"desc": "Removes all elements.",
	},
	"array_pop_back": {
		"category": "array_ops",
		"label": "Pop Back",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"desc": "Removes and returns last element.",
	},
	"array_pop_front": {
		"category": "array_ops",
		"label": "Pop Front",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"desc": "Removes and returns first element.",
	},
	"array_push_back": {
		"category": "array_ops",
		"label": "Push Back",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
			{"name": "value", "type": "data"},
		],
		"desc": "Adds element to the end.",
	},
	"array_front": {
		"category": "array_ops",
		"label": "Front",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"desc": "Returns the first element.",
	},
	"array_back": {
		"category": "array_ops",
		"label": "Back",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"desc": "Returns the last element.",
	},
	"array_shuffle": {
		"category": "array_ops",
		"label": "Shuffle",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"desc": "Randomizes element order.",
	},
	"array_slice": {
		"category": "array_ops",
		"label": "Slice",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"props": {"begin": "0", "end": "-1"},
		"desc": "Returns a sub-array.",
	},
	"array_duplicate": {
		"category": "array_ops",
		"label": "Duplicate",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "array", "type": "data"},
		],
		"desc": "Returns a shallow copy.",
	},
	# ── Dictionary ──
	"dict_create": {
		"category": "dict_ops",
		"label": "Create Dict",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
		],
		"desc": "Creates a new empty dictionary.",
	},
	"dict_set": {
		"category": "dict_ops",
		"label": "Set",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "dict", "type": "data"},
			{"name": "value", "type": "data"},
		],
		"props": {"key": ""},
		"desc": "Sets a key-value pair.",
	},
	"dict_get": {
		"category": "dict_ops",
		"label": "Get",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "dict", "type": "data"},
		],
		"props": {"key": ""},
		"desc": "Returns the value at the key.",
	},
	"dict_has": {
		"category": "dict_ops",
		"label": "Has",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "dict", "type": "data"},
			{"name": "key", "type": "data"},
		],
		"desc": "True if key exists.",
	},
	"dict_keys": {
		"category": "dict_ops",
		"label": "Keys",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "dict", "type": "data"},
		],
		"desc": "Returns all keys as array.",
	},
	"dict_values": {
		"category": "dict_ops",
		"label": "Values",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "dict", "type": "data"},
		],
		"desc": "Returns all values as array.",
	},
	"dict_erase": {
		"category": "dict_ops",
		"label": "Erase",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "dict", "type": "data"},
			{"name": "key", "type": "data"},
		],
		"desc": "Removes the key.",
	},
	"dict_size": {
		"category": "dict_ops",
		"label": "Size",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "dict", "type": "data"},
		],
		"desc": "Returns the number of entries.",
	},
	"dict_clear": {
		"category": "dict_ops",
		"label": "Clear",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "dict", "type": "data"},
		],
		"desc": "Removes all entries.",
	},
	"dict_merge": {
		"category": "dict_ops",
		"label": "Merge",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "a", "type": "data"},
			{"name": "b", "type": "data"},
		],
		"desc": "Merges two dicts (b overrides).",
	},
	# ── Flow Control ──
	"sequence": {
		"category": "flow",
		"label": "Sequence",
		"outputs": [
			{"name": "then", "type": "exec"},
			{"name": "then_2", "type": "exec"},
			{"name": "then_3", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Fires multiple outputs in order.",
	},
	"delay": {
		"category": "flow",
		"label": "Delay",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"seconds": "1.0"},
		"desc": "Waits before continuing.",
	},
	"for_loop": {
		"category": "flow",
		"label": "For Loop",
		"outputs": [
			{"name": "loop_body", "type": "exec"},
			{"name": "completed", "type": "exec"},
			{"name": "index", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"count": "10"},
		"desc": "Iterates count times.",
	},
	"while_loop": {
		"category": "flow",
		"label": "While Loop",
		"outputs": [
			{"name": "loop_body", "type": "exec"},
			{"name": "completed", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "condition", "type": "data"},
		],
		"desc": "Loops while condition is true.",
	},
	"do_once": {
		"category": "flow",
		"label": "Do Once",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Only allows execution through once.",
	},
	"switch": {
		"category": "flow",
		"label": "Switch",
		"outputs": [
			{"name": "exec_0", "type": "exec"},
			{"name": "exec_1", "type": "exec"},
			{"name": "exec_2", "type": "exec"},
			{"name": "exec_default", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"props": {"cases": "3"},
		"desc": "Routes to one of N outputs.",
	},
	"return": {
		"category": "flow",
		"label": "Return",
		"outputs": [
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Returns a value from the function.",
	},
	"print": {
		"category": "flow",
		"label": "Print",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Prints a value to output.",
	},
	"break_loop": {
		"category": "flow",
		"label": "Break Loop",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Breaks out of the current loop.",
	},
	"continue_loop": {
		"category": "flow",
		"label": "Continue Loop",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Skips to the next iteration.",
	},
	# ── Variables ──
	"set_var": {
		"category": "variables",
		"label": "Set Variable",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"props": {"name": "my_var"},
		"desc": "Sets a named variable.",
	},
	"get_var": {
		"category": "variables",
		"label": "Get Variable",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"name": "my_var"},
		"desc": "Reads a named variable.",
	},
	"increment_var": {
		"category": "variables",
		"label": "Increment Variable",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"name": "my_var", "amount": "1"},
		"desc": "Adds amount to a variable.",
	},
	# ── Type Conversion ──
	"to_int": {
		"category": "type_conv",
		"label": "To Int",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Converts any value to int.",
	},
	"to_float": {
		"category": "type_conv",
		"label": "To Float",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Converts any value to float.",
	},
	"to_string": {
		"category": "type_conv",
		"label": "To String",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Converts any value to String.",
	},
	"to_bool": {
		"category": "type_conv",
		"label": "To Bool",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Converts any value to bool.",
	},
	"to_vector2": {
		"category": "type_conv",
		"label": "To Vector2",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Converts to Vector2.",
	},
	"to_vector3": {
		"category": "type_conv",
		"label": "To Vector3",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Converts to Vector3.",
	},
	"typeof_node": {
		"category": "type_conv",
		"label": "Type Of",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Returns the TYPE_* constant.",
	},
	# ── Signals ──
	"emit_signal": {
		"category": "signals",
		"label": "Emit Signal",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "args", "type": "data"},
		],
		"props": {"signal_name": "my_signal"},
		"desc": "Emits a named signal.",
	},
	"connect_signal": {
		"category": "signals",
		"label": "Connect Signal",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "callback", "type": "data"},
		],
		"props": {"signal_name": "my_signal"},
		"desc": "Connects a signal to a callable.",
	},
	"await_signal": {
		"category": "signals",
		"label": "Await Signal",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
		],
		"props": {"signal_name": "my_signal"},
		"desc": "Pauses until signal is emitted.",
	},
	# ── Audio ──
	"play_audio": {
		"category": "audio",
		"label": "Play Audio",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "stream", "type": "data"},
		],
		"props": {"bus": "Master"},
		"desc": "Plays an audio stream.",
	},
	"stop_audio": {
		"category": "audio",
		"label": "Stop Audio",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Stops the current audio.",
	},
	"set_audio_volume": {
		"category": "audio",
		"label": "Set Volume",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "volume", "type": "data"},
		],
		"props": {"bus": "Master"},
		"desc": "Sets volume in dB.",
	},
	"get_audio_volume": {
		"category": "audio",
		"label": "Get Volume",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"bus": "Master"},
		"desc": "Returns volume in dB.",
	},
	"is_audio_playing": {
		"category": "audio",
		"label": "Is Playing",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "True if audio is playing.",
	},
	# ── Timer ──
	"timer_start": {
		"category": "timer",
		"label": "Timer Start",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"wait_time": "1.0", "one_shot": "true"},
		"desc": "Starts a timer.",
	},
	"timer_stop": {
		"category": "timer",
		"label": "Timer Stop",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Stops the timer.",
	},
	"timer_get_time_left": {
		"category": "timer",
		"label": "Get Time Left",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Returns seconds remaining.",
	},
	"timer_set_wait_time": {
		"category": "timer",
		"label": "Set Wait Time",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"wait_time": "1.0"},
		"desc": "Changes the wait time.",
	},
	# ── Animation ──
	"animation_play": {
		"category": "animation",
		"label": "Play Animation",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"name": "", "speed": "1.0", "reverse": "false"},
		"desc": "Plays an animation.",
	},
	"animation_stop": {
		"category": "animation",
		"label": "Stop Animation",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Stops the animation.",
	},
	"animation_seek": {
		"category": "animation",
		"label": "Seek",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"position": "0.0"},
		"desc": "Seeks to a position.",
	},
	"animation_is_playing": {
		"category": "animation",
		"label": "Is Playing",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "True if animation is playing.",
	},
	"animation_get_current": {
		"category": "animation",
		"label": "Get Current",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Returns current animation name.",
	},
	# ── Scene Management ──
	"load_scene": {
		"category": "scene",
		"label": "Load Scene",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"path": ""},
		"desc": "Preloads a scene from path.",
	},
	"instantiate_scene_node": {
		"category": "scene",
		"label": "Instantiate Scene",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "packed_scene", "type": "data"},
		],
		"desc": "Creates an instance of PackedScene.",
	},
	"change_scene": {
		"category": "scene",
		"label": "Change Scene",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"path": ""},
		"desc": "Changes to a new scene.",
	},
	"reload_scene": {
		"category": "scene",
		"label": "Reload Scene",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Reloads the current scene.",
	},
	# ── Utility ──
	"print_value": {
		"category": "utility",
		"label": "Print Value",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "value", "type": "data"},
		],
		"desc": "Prints any value.",
	},
	"push_error": {
		"category": "utility",
		"label": "Push Error",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "message", "type": "data"},
		],
		"desc": "Pushes an error message.",
	},
	"push_warning": {
		"category": "utility",
		"label": "Push Warning",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "message", "type": "data"},
		],
		"desc": "Pushes a warning message.",
	},
	"set_meta": {
		"category": "utility",
		"label": "Set Meta",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "value", "type": "data"},
		],
		"props": {"name": ""},
		"desc": "Sets metadata on a node.",
	},
	"get_meta": {
		"category": "utility",
		"label": "Get Meta",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
		],
		"props": {"name": ""},
		"desc": "Gets metadata from a node.",
	},
	# ── Camera ──
	"camera_make_current": {
		"category": "camera",
		"label": "Make Current",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Makes camera the active camera.",
	},
	"set_camera_fov": {
		"category": "camera",
		"label": "Set FOV",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "fov", "type": "data"},
		],
		"props": {"fov": "70.0"},
		"desc": "Sets the field of view.",
	},
	"get_camera_fov": {
		"category": "camera",
		"label": "Get FOV",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Returns the field of view.",
	},
	"set_camera_background": {
		"category": "camera",
		"label": "Set Background",
		"outputs": [
			{"name": "exec", "type": "exec"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"props": {"color": "0.2,0.2,0.3"},
		"desc": "Sets the background color.",
	},
	"camera_get_position": {
		"category": "camera",
		"label": "Get Position",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
		],
		"desc": "Returns the camera position.",
	},
}

# ── Options for property dropdowns ──
	# ── Window ──
	"get_window_position": {
		"category": "window",
		"label": "Get Window Position",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "position", "type": "data"},
		],
		"inputs": [{"name": "exec", "type": "exec"}],
		"desc": "Returns the window position on screen.",
	},
	"set_window_position": {
		"category": "window",
		"label": "Set Window Position",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "position", "type": "data"},
		],
		"desc": "Moves the window to the given screen position.",
	},
	"move_window_by": {
		"category": "window",
		"label": "Move Window By",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "offset", "type": "data"},
		],
		"desc": "Moves the window by a pixel offset.",
	},
	"get_window_size": {
		"category": "window",
		"label": "Get Window Size",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "size", "type": "data"},
		],
		"inputs": [{"name": "exec", "type": "exec"}],
		"desc": "Returns the window size in pixels.",
	},
	"set_window_size": {
		"category": "window",
		"label": "Set Window Size",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "size", "type": "data"},
		],
		"desc": "Resizes the window.",
	},
	"center_window": {
		"category": "window",
		"label": "Center Window",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [{"name": "exec", "type": "exec"}],
		"desc": "Centers the window on the screen.",
	},
	"set_window_title": {
		"category": "window",
		"label": "Set Window Title",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "title", "type": "data"},
		],
		"desc": "Sets the window title text.",
	},
	"set_window_fullscreen": {
		"category": "window",
		"label": "Set Fullscreen",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "enabled", "type": "data"},
		],
		"desc": "Toggles fullscreen mode.",
	},
	"set_window_always_on_top": {
		"category": "window",
		"label": "Always On Top",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "enabled", "type": "data"},
		],
		"desc": "Sets whether the window stays on top.",
	},
	"set_window_resizable": {
		"category": "window",
		"label": "Set Resizable",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "enabled", "type": "data"},
		],
		"desc": "Toggles window resizability.",
	},
	# ── Display (Scratch-like) ──
	"show_node": {
		"category": "display",
		"label": "Show",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
		],
		"desc": "Makes a node visible.",
	},
	"hide_node": {
		"category": "display",
		"label": "Hide",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
		],
		"desc": "Hides a node.",
	},
	"set_transparency": {
		"category": "display",
		"label": "Set Transparency",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "alpha", "type": "data"},
		],
		"desc": "Sets the alpha (transparency) of a node.",
	},
	"set_color": {
		"category": "display",
		"label": "Set Color",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "color", "type": "data"},
		],
		"desc": "Sets the modulate color.",
	},
	"set_modulate": {
		"category": "display",
		"label": "Set Modulate",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "color", "type": "data"},
		],
		"desc": "Sets the self_modulate color.",
	},
	"set_z_index": {
		"category": "display",
		"label": "Set Z Index",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "z_index", "type": "data"},
		],
		"desc": "Sets the rendering order (z_index).",
	},
	"set_flip_h": {
		"category": "display",
		"label": "Set Flip H",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "flipped", "type": "data"},
		],
		"desc": "Flips the sprite horizontally.",
	},
	"set_flip_v": {
		"category": "display",
		"label": "Set Flip V",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "flipped", "type": "data"},
		],
		"desc": "Flips the sprite vertically.",
	},
	"go_to_x_y": {
		"category": "display",
		"label": "Go To X Y",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "position", "type": "data"},
		],
		"desc": "Instantly teleports to the given position.",
	},
	"glide_to": {
		"category": "display",
		"label": "Glide To",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "position", "type": "data"},
		],
		"props": {"duration": "1.0"},
		"desc": "Smoothly moves to a position over duration seconds.",
	},
	"set_size": {
		"category": "display",
		"label": "Set Size",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "size", "type": "data"},
		],
		"desc": "Sets the size of a Control node.",
	},
	"change_size": {
		"category": "display",
		"label": "Change Size By",
		"outputs": [{"name": "exec", "type": "exec"}],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
			{"name": "delta", "type": "data"},
		],
		"desc": "Adds to the current Control size.",
	},
	"get_color": {
		"category": "display",
		"label": "Get Color",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "color", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
		],
		"desc": "Returns the modulate color.",
	},
	"is_visible_node": {
		"category": "display",
		"label": "Is Visible",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "result", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
		],
		"desc": "Returns true if the node is visible.",
	},
	"get_size": {
		"category": "display",
		"label": "Get Size",
		"outputs": [
			{"name": "exec", "type": "exec"},
			{"name": "size", "type": "data"},
		],
		"inputs": [
			{"name": "exec", "type": "exec"},
			{"name": "target", "type": "data"},
		],
		"desc": "Returns the Control node size.",
	},
const COLOR_OPTIONS := [
	"WHITE", "BLACK", "RED", "GREEN", "BLUE", "YELLOW", "CYAN", "MAGENTA",
	"Color(1, 1, 1)", "Color(0, 0, 0)", "Color(1, 0, 0)", "Color(0, 1, 0)",
	"Color(0, 0, 1)", "Color(1, 1, 0)", "Color(0, 1, 1)", "Color(1, 0, 1)",
]

const WINDOW_MODE_OPTIONS := ["true", "false"]

const OPERATOR_OPTIONS := {
	"compare": ["==", "!=", ">", "<", ">=", "<="],
	"math_op": ["+", "-", "*", "/", "%"],
}

const MATH_FUNC_OPTIONS := [
	"abs", "sin", "cos", "tan", "sqrt", "pow", "log", "exp",
	"floor", "ceil", "round", "sign", "deg_to_rad", "rad_to_deg",
	"lerp", "clamp", "snapped", "fmod", "fposmod",
	"inverse_lerp", "remap", "move_toward", "angle_difference", "lerp_angle",
]

const KEY_OPTIONS := [
	"KEY_SPACE", "KEY_ENTER", "KEY_ESCAPE", "KEY_TAB",
	"KEY_BACKSPACE", "KEY_DELETE", "KEY_INSERT",
	"KEY_W", "KEY_A", "KEY_S", "KEY_D", "KEY_E", "KEY_Q", "KEY_R", "KEY_F", "KEY_Z", "KEY_X", "KEY_C", "KEY_V",
	"KEY_UP", "KEY_DOWN", "KEY_LEFT", "KEY_RIGHT",
	"KEY_SHIFT", "KEY_CTRL", "KEY_ALT",
	"KEY_0", "KEY_1", "KEY_2", "KEY_3", "KEY_4", "KEY_5", "KEY_6", "KEY_7", "KEY_8", "KEY_9",
	"KEY_F1", "KEY_F2", "KEY_F3", "KEY_F4", "KEY_F5", "KEY_F6", "KEY_F7", "KEY_F8", "KEY_F9", "KEY_F10", "KEY_F11", "KEY_F12",
]

const TYPE_OPTIONS := [
	"Node", "Node2D", "Node3D",
	"CharacterBody2D", "CharacterBody3D",
	"RigidBody2D", "RigidBody3D",
	"Area2D", "Area3D",
	"StaticBody2D", "StaticBody3D",
	"Sprite2D", "Sprite3D", "MeshInstance3D",
	"Camera3D", "Camera2D",
	"AudioStreamPlayer", "AudioStreamPlayer2D", "AudioStreamPlayer3D",
	"Timer", "Label", "RichTextLabel",
	"AnimationPlayer", "AnimationTree", "Tween",
	"CollisionShape2D", "CollisionShape3D",
	"NavigationAgent2D", "NavigationAgent3D",
	"Path2D", "Path3D",
]

static func get_options_for_prop(key: String, node_type: String) -> Array:
	if key == "operator" and OPERATOR_OPTIONS.has(node_type):
		return OPERATOR_OPTIONS[node_type]
	if key == "function":
		return MATH_FUNC_OPTIONS
	if key == "key":
		return KEY_OPTIONS
	if key == "type":
		return TYPE_OPTIONS
	if key == "color":
		return COLOR_OPTIONS
	if key == "enabled":
		return WINDOW_MODE_OPTIONS
	return []

static func get_category_color(category: String) -> Color:
	if CATEGORIES.has(category):
		return CATEGORIES[category]["color"]
	return Color.WHITE
