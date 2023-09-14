extends AnimatableBody2D

@export var ball: Ball
@export var speed: float = 512
@export var distance_threshold = 32
var movement_direction: Vector2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement_direction.y = 0
	if distance_from_ball() > distance_threshold:
		if ball.position.y > position.y:
			movement_direction.y = 1
		elif ball.position.y < position.y:
			movement_direction.y = -1
	move_and_collide(movement_direction * speed * delta)


func distance_from_ball():
	return abs(ball.position.y - position.y)
