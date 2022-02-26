extends KinematicBody2D

var speed :float = 0.2
var destination = Vector2.ZERO

func _physics_process(delta):
	move_and_collide(destination * speed)
#	global_position = global_position.move_toward(destination, speed)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
