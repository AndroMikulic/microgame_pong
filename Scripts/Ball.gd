extends RigidBody2D

class_name Ball

@export var max_speed: float = 1536
@export var min_x_speed: float = 128
@export var sound_effect_player: AudioStreamPlayer2D
@export var hit_sound_effect: Array[AudioStream]
var is_active = false
var ball_starting_position: Vector2
var new_position = Vector2()
var new_velocity = Vector2()
var should_reset = false


func _ready():
	ball_starting_position = position


func reset_and_fire_ball():
	var random_x_direction = [-1, -1].pick_random()
	var random_y_direction = [-1, 1].pick_random()
	new_velocity = Vector2(1024 * random_x_direction, 64 * random_y_direction)
	new_position = ball_starting_position
	should_reset = true
	is_active = true


func _integrate_forces(state):
	if should_reset:
		state.linear_velocity = new_velocity
		state.transform.origin = new_position
		should_reset = false
		return
	if !is_active:
		return
	check_max_speed()
	check_minimum_axis_speed()


func check_minimum_axis_speed():
	if abs(self.linear_velocity.x) < min_x_speed:
		self.linear_velocity.x = sign(self.linear_velocity.x) * min_x_speed


func check_max_speed():
	if self.linear_velocity.length() < max_speed:
		return
	var direction = self.linear_velocity.normalized()
	self.linear_velocity = direction * max_speed


func play_hit_sound(body: Node2D):
	sound_effect_player.stream = hit_sound_effect.pick_random()
	sound_effect_player.play()
