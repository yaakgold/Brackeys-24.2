class_name RoundController extends Node2D

@export var card_locations: Array[CardHolder]

func end_round():
	for location in card_locations:
		if(location.cards.size() > 0):
			location.cards[0].cardData.trigger()
