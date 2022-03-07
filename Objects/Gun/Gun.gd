extends Position2D

class_name Weapon

onready var rTimer = $Timers/Reload

var bullet = preload("res://Objects/Attacks/BaseBullet/BaseBullet.tscn")
var initialAmmo :float
var ammo :float
var reloading :bool = false


func _ready():
	rTimer.wait_time = 0.5
	initialAmmo = 2
	ammo = initialAmmo


func _unhandled_input(event):
	if(Input.is_action_just_pressed("l_click")):
		if(!reloading):
			if(ammo > 0):
				_shoot()
				ammo -= 1
			else:
				reloading = true
				_reload()


func _shoot():
	var bInstance = bullet.instance()
	bInstance.global_position = $GunPoint.global_position
	bInstance.destination = $Destinations/D2.global_position - $GunPoint.global_position
	get_tree().current_scene.add_child(bInstance)


func _reload():
	reloading = true
	rTimer.start()


func _on_Reload_timeout():
	print("OK")
	reloading = false
	ammo = initialAmmo
