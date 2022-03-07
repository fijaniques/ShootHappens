extends Weapon

func _ready():
	rTimer.wait_time = 1
	initialAmmo = 2
	ammo = initialAmmo


func _shoot():
	for d in $Destinations.get_child_count():
		var bInstance = bullet.instance()
		var destination = str("D", d + 1)
		bInstance.global_position = $GunPoint.global_position
		bInstance.destination = $Destinations.get_node(destination).global_position - $GunPoint.global_position
		bInstance.get_node("Timers/Lifetime").wait_time = 0.3
		get_tree().current_scene.add_child(bInstance)
