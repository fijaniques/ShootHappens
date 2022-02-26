extends KinematicBody2D

#MOVEMENT
var speed :float = 10000
var hDir = Vector2.ZERO
var vDir = Vector2.ZERO

var velocity = Vector2.ZERO

#COMBAT
export (PackedScene) var gun
var gInstance
var shield = preload("res://Objects/Shield/Shield.tscn")
var sInstance

var defending :bool = false

#TEAM
enum{ONE, TWO, THREE, FOUR}
var team

func _ready():
	_set_team()
	_add_gun()
	_add_shield()

func _physics_process(delta):
	_get_input()
	_movement(delta)
	_aim()

func _get_input():
	hDir = Input.get_action_strength("d") - Input.get_action_strength("a")
	vDir = Input.get_action_strength("s") - Input.get_action_strength("w")
	
	if(Input.is_action_just_pressed("space")):
		_shield()
	elif(Input.is_action_just_released("space")):
		_shield()

func _movement(delta):
	velocity.x = hDir * speed * delta
	velocity.y = vDir * speed * delta
	
	velocity = move_and_slide(velocity)
	velocity = velocity.normalized()

func _aim():
	gInstance.look_at(get_global_mouse_position())

func _shield():
	if(!defending):
		defending = true
		sInstance.get_node("Collision").disabled = false
	else:
		defending = false
		sInstance.get_node("Collision").disabled = true

func _set_team():
	team = FOUR
	match team:
		ONE:
			set_collision_layer_bit(1, true)
		TWO:
			set_collision_layer_bit(2, true)
		THREE:
			set_collision_layer_bit(3, true)
		FOUR:
			set_collision_layer_bit(4, true)

func _add_shield():
	sInstance = shield.instance()
	sInstance.team = team
	add_child(sInstance)

func _add_gun():
	gInstance = gun.instance()
	add_child(gInstance)
	
#	canAim = true
