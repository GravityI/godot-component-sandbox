Template for a group-based turn system

Setup:
	- Attach "TurnManager.tscn" to the root node of the scene.
	- Create a group for each group of actors in the scene and add them to the groups variable in the inspector.
	- Implement the enable_group and disable_group methods on the TurnManager node.
	- Implement the conditions for passing the turn (likely to be on your actors' scripts) that calls the pass_turn method on the TurnManager node.
