extends Node

@export var controlled_object : Node
@export var initial_state : State
var current_state : State

func _ready() -> void:
	for state in get_children():
		state.controlled_object = controlled_object
	set_state(initial_state)

func set_state(new_state : State):
	new_state._enter_state()
	current_state = new_state
