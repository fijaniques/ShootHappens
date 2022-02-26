extends KinematicBody2D

var speed :float = 20
var destination = Vector2.ZERO

func _physics_process(delta):
	move_and_collide(destination * speed * delta)
