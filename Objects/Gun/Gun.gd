extends Position2D

class_name Weapon

var bullet = preload("res://Objects/Attacks/BaseBullet/BaseBullet.tscn")

func _unhandled_input(event):
	if(Input.is_action_just_pressed("l_click")):
		_shoot()

func _shoot():
	var bInstance = bullet.instance()
	bInstance.global_position = $GunPoint.global_position
	bInstance.destination = $Destinations/D2.global_position - $GunPoint.global_position
	get_tree().current_scene.add_child(bInstance)

