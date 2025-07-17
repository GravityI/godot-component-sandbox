extends Node

@export var up_action : String = "ui_up"
@export var down_action : String = "ui_down"
@export var left_action : String = "ui_left"
@export var right_action : String = "ui_right"
@export var movement_speed : float = 10
@export var tile_size : int = 64
@export var input_delay : float = 0.01
var movement_time : float = 0
var target_position : Vector2
var keys_pressed : Array = []
var can_move : bool = false

func handle_input(action : String, direction : Vector2) -> void:
	if Input.is_action_just_pressed(action):
		keys_pressed.append([action, direction])
		move(action, direction)
	if Input.is_action_just_released(action):
		keys_pressed.erase([action, direction])

func move(action : String, direction : Vector2) -> void:
	if can_move:
		get_node("InputTimer").start(input_delay)
		target_position = get_parent().position + (direction * tile_size)
		can_move = false
		movement_time = 0

func _process(delta: float) -> void:
	handle_input(up_action, Vector2.UP)
	handle_input(down_action, Vector2.DOWN)
	handle_input(left_action, Vector2.LEFT)
	handle_input(right_action, Vector2.RIGHT)
	
	if can_move:
		if keys_pressed.size() == 1:
			move(keys_pressed[0][0], keys_pressed[0][1])
	else:
		movement_time += delta
		if get_parent().position == target_position:
			can_move = true
		else:
			get_parent().position = get_parent().position.move_toward(target_position, movement_time * movement_speed)

func _on_input_timer_timeout() -> void:
	if can_move:
		if keys_pressed.size() == 1:
			move(keys_pressed[0][0], keys_pressed[0][1])
