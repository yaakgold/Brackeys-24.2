class_name GameManagerScript
extends Node2D

var current_card: Card = null
var current_card_holder_hover: CardHolder = null

func _input(event):
	if(event.is_action_pressed("escape")):
		get_tree().quit()
