extends Node
class_name State

#Export all states that the state can transition into
#Example:
#@export var JumpState : State

@onready var StateMachine = get_parent()
var controlled_object : Node

func _enter_state():
	#Logic to be executed when entering this state.
	pass

func _state_process(delta : float):
	#Handle state logic and transitions
	#Transition Example:
	#if Input.is_action_just_pressed("ui_up"):
		#StateMachine.change_state(JumpState)
	pass

func _state_physics_process(delta : float):
	pass
