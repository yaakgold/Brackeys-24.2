class_name PlayerHand extends Node2D

const CARD = preload("res://scenes/prefabs/card.tscn")
const WIDTH = 1920
const HEIGHT = 1080
const CARD_BOTTOM_PAD = 25
const CARD_GAP = 15 + 170

var cards: Array[Card]

func _ready():
	add_card()
	add_card()
	add_card()
	
#TODO: Add a parameter for the CardResource or whatever I call it
func add_card():
	var c = CARD.instantiate()
	cards.append(c)
	add_child(c)
	
	set_card_positions()

func remove_card(i: int):
	cards.remove_at(i)
	set_card_positions()

func set_card_positions():
	for c in cards:
		c.global_position.x = ((1920.0 * .5) + (CARD_GAP * cards.find(c)))
		c.global_position.y = 1080 - 230 - CARD_BOTTOM_PAD

func _on_card_placed_here():
	#TODO: Do the actual card placement stuff
	add_card()
