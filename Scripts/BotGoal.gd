extends Area2D

@export var game_manager: GameManager


func body_entered(body: Node2D):
	if body.has_meta("Type"):
		if body.get_meta("Type") == "Player":
			game_manager.player_scored()
