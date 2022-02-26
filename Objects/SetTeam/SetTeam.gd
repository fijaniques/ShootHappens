extends Node2D

enum{ONE, TWO, THREE, FOUR}
var team

func _ready():
	var parent = get_parent().get_parent()
	
	if(parent.has_node("SetTeam")):
		parent.get_node("SetTeam").team = TWO 
		team = parent.get_node("SetTeam").team
		match team:
			ONE:
				get_parent().set_collision_layer_bit(1, true)
			TWO:
				get_parent().set_collision_layer_bit(2, true)
			THREE:
				get_parent().set_collision_layer_bit(3, true)
			FOUR:
				get_parent().set_collision_layer_bit(4, true)

