extends Node2D

@onready var ShockwaveRect = get_node("FXCanvas/ShockwaveRect")

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		ShockwaveRect.trigger_shockwave(get_global_mouse_position())
