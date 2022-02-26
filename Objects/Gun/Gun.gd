extends Position2D

var bullet = preload("res://Objects/Attacks/BaseBullet/BaseBullet.tscn")

func _unhandled_input(event):
	if(Input.is_action_just_pressed("l_click")):
		_shoot()

func _shoot():
	var bInstance = bullet.instance()
	bInstance.global_position = $GunPoint.global_position
	bInstance.destination = $Destinations/D2.global_position - $GunPoint.global_position
	if(name == "ShotGun"):
		var time = 0.3
		var bInstance2 = bullet.instance()
		var bInstance3 = bullet.instance()
		bInstance2.global_position = $GunPoint.global_position
		bInstance3.global_position = $GunPoint.global_position
		bInstance2.destination = $Destinations/D1.global_position - $GunPoint.global_position
		bInstance3.destination = $Destinations/D3.global_position - $GunPoint.global_position
		bInstance.get_node("Timers/Lifetime").wait_time = time
		bInstance2.get_node("Timers/Lifetime").wait_time = time
		bInstance3.get_node("Timers/Lifetime").wait_time = time
		get_tree().current_scene.add_child(bInstance2)
		get_tree().current_scene.add_child(bInstance3)

	get_tree().current_scene.add_child(bInstance)

