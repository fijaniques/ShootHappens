extends KinematicBody2D

var speed :float = 5
var destination = Vector2.ZERO

func _physics_process(delta):
# warning-ignore:return_value_discarded
	move_and_collide(destination * speed * delta)
	_bounce(delta)

func _bounce(delta):
	var collision = move_and_collide(destination * delta)
	if collision:
		destination = destination.bounce(collision.normal)

func _on_Lifetime_timeout():
	queue_free()
