extends AnimatableBody2D

@export var speed: float = 512
var speed_modifier: float = 1
var movement_direction: Vector2 = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed_modifier = 1
	movement_direction.y = 0
	if Input.is_action_pressed("speed"):
		speed_modifier = 1.5
	if Input.is_action_pressed("move_up"):
		movement_direction.y = -1
	elif Input.is_action_pressed("move_down"):
		movement_direction.y = 1
	if movement_direction.y != 0:
		move_and_collide(movement_direction * speed * speed_modifier * delta)
