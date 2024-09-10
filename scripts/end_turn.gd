extends Button

@export var round_controller: RoundController

func _on_pressed():
	round_controller.end_round()
