extends Button

const CARD = preload("res://scenes/prefabs/card.tscn")

@export var player_hand: CardHolder

func _on_pressed():
	var card = CARD.instantiate()
	add_child(card)
	
	player_hand.add_card(card)
