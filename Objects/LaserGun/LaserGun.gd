extends Weapon


func _ready():
	$GunPoint/Line2D.visible = false
	var pos = Vector2($Destinations/D2.global_position.x, 0)
	$GunPoint/Line2D.set_point_position(1, pos)

	rTimer.wait_time = 2
	initialAmmo = 5
	ammo = initialAmmo

func _process(delta):
	_shoot()


func _unhandled_input(event):
	pass


func _shoot():
	if(Input.is_action_pressed("l_click") and !reloading):
		if(ammo > 0):
			ammo -= 0.1
			$GunPoint/Line2D.visible = true
			
		elif(ammo <= 0):
			$GunPoint/Line2D.visible = false
			_reload()
	
	if(Input.is_action_just_released("l_click")):
		$GunPoint/Line2D.visible = false
