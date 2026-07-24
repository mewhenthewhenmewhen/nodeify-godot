# Nodeify - Visual Scripting for Godot 4

A node-based visual scripting editor plugin for Godot 4. Build game logic by connecting nodes instead of writing code.

## Features

- **Visual Graph Editor** — Drag-and-drop nodes with GraphEdit integration
- **30+ Node Types** — Events, 3D/2D transforms, logic, math, flow control, variables, signals, audio
- **Code Generation** — Generates clean GDScript from your graph
- **Search Palette** — Quick node search with fuzzy matching
- **Property Inspector** — Edit node properties inline
- **Save/Load** — Persist graphs as `.nodeify` files
- **Dark Theme** — Matches Godot's editor aesthetic

## Installation

1. Copy `addons/nodeify/` into your Godot project's `addons/` folder
2. Go to **Project > Project Settings > Plugins**
3. Enable the **Nodeify** plugin
4. Open the **Nodeify** dock at the bottom of the editor

## Usage

1. Click **+ Add Node** or right-click the graph to add nodes
2. Connect node ports by dragging from output to input
3. Edit properties in the inspector panel
4. Click **Generate Script** to create GDScript from your graph
5. Save/load graphs with the toolbar buttons

## Node Categories

| Category | Nodes |
|----------|-------|
| Events | On Ready, On Process, On Input, On Key Pressed, On Body Entered, On Timer Timeout |
| 3D Nodes | Instantiate Scene, Get Node 3D, Set Position/Rotation/Scale 3D, Move Toward, Apply Impulse, Look At |
| 2D Nodes | Instantiate Scene 2D, Get Node 2D, Set Position/Rotation/Scale 2D, Apply Impulse 2D |
| Logic | If/Else, Compare, AND, OR, NOT, Type Cast, Is Valid, Is Null |
| Math | Number, Vector2, Vector3, Math Op, Math Function, Lerp, Random Range |
| Input | Is Action Pressed, Is Key Pressed, Get Axis, Get Vector |
| Transform | Set/Get Property, Translate, Call Method |
| Flow | Sequence, Delay, For Loop, While Loop, Do Once, Switch, Return, Print |
| Variables | Set/Get/Increment Variable |
| Signals | Emit/Connect Signal |
| Audio | Play/Stop Audio |

## Example

The test project includes a sample scene. Open it in Godot, enable the plugin, and experiment with the graph editor.

## License

MIT
