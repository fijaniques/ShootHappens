extends KinematicBody2D

var bullet = preload("res://Objects/Attacks/BaseBullet/BaseBullet.tscn")
onready var gun = $Gun

var speed :float = 10000
var hDir = Vector2.ZERO
var vDir = Vector2.ZERO

var velocity = Vector2.ZERO

func _physics_process(delta):
	_get_input()
	_movement(delta)
	_aim()
	

func _get_input():
	hDir = Input.get_action_strength("d") - Input.get_action_strength("a")
	vDir = Input.get_action_strength("s") - Input.get_action_strength("w")

func _unhandled_input(event):
	if(Input.is_action_just_pressed("l_click")):
		_shoot()

func _movement(delta):
	velocity.x = hDir * speed * delta
	velocity.y = vDir * speed * delta
	
	velocity = move_and_slide(velocity)
	velocity = velocity.normalized()

func _aim():
	gun.look_at(get_global_mouse_position())

func _shoot():
	var bInstance = bullet.instance()
	bInstance.global_position = gun.get_node("GunPoint").global_position
	bInstance.destination = (gun.get_node("GunPoint").global_position - global_position) * 100000
	get_tree().current_scene.add_child(bInstance)
