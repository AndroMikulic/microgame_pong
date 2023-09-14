extends Node
class_name GameManager

@export var score_player: float
@export var score_bot: float
@export var score_label: Label
@export var ball: Ball
@export var sound_effect_player: AudioStreamPlayer2D
@export var goal_sound_effect: Array[AudioStream]


func _process(delta):
	if Input.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	new_round()


func player_scored():
	score_player += 1
	play_goal_sound()
	update_score_label()
	new_round()


func bot_scored():
	score_bot += 1
	play_goal_sound()
	update_score_label()
	new_round()


func play_goal_sound():
	sound_effect_player.stream = goal_sound_effect.pick_random()
	sound_effect_player.play()


func update_score_label():
	score_label.text = str(score_player) + " : " + str(score_bot)


func new_round():
	ball.is_active = false
	ball.should_reset = true
	ball.new_position = ball.ball_starting_position
	ball.new_velocity = Vector2.ZERO
	await get_tree().create_timer(1).timeout
	ball.reset_and_fire_ball()
