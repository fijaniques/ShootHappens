extends Weapon

func _ready():
	$GunPoint/Line2D.visible = false
	var pos = Vector2($Destinations/D2.global_position.x, 0)
	$GunPoint/Line2D.set_point_position(1, pos)

func _process(delta):
	_shoot()

func _shoot():
	if(Input.is_action_pressed("l_click")):
		$GunPoint/Line2D.visible = true
	else:
		$GunPoint/Line2D.visible = false
