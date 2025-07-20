extends Node

@export var groups : Array[String]
@export var random_starting_group : bool = true
#Starting Group is ignored if random_starting_group is true
@export var starting_group : String
var turn_count : int = 0
var current_group : String

func _ready() -> void:
	if random_starting_group:
		randomize()
		starting_group = groups[randi_range(0, groups.size())]
	current_group = starting_group
	enable_group(current_group)

#Call this method once the conditions for passing the turn are met
func pass_turn() -> void:
	turn_count += 1
	disable_group(current_group)
	current_group = groups[groups.find(current_group) + 1]
	enable_group(current_group)

func enable_group(group : String) -> void:
	for object in get_tree().get_nodes_in_group(group):
		#Add logic for enabling objects in group
		#Example:
		#object.can_move = true
		pass

func disable_group(group : String) -> void:
	for object in get_tree().get_nodes_in_group(group):
		#Add logic for disabling objects in group
		#Example:
		#object.can_move = false
		pass
