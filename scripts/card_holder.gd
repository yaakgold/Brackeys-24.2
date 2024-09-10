class_name CardHolder extends Area2D

@export var allowed_card_type: Globals.eCardType = Globals.eCardType.ANY
@export var width = 0
@export var height = 0
@export var card_bottom_pad = 0
@export var card_gap = 0
@export var max_cards := 0

var cards: Array[Card]

func add_card(card: Card) -> bool:
	if(cards.size() < max_cards && (card.cardData.type == allowed_card_type || allowed_card_type == Globals.eCardType.ANY)):
		if(card.old_parent != null):
			card.old_parent.cards.remove_at(card.old_parent.cards.find(card))
			card.old_parent.set_card_positions()
			card.old_parent = null
		cards.append(card)
		card.reparent(self)
		card.setup_data()
		set_card_positions()
		return true
	return false
	
func set_card_positions():
	for c in cards:
		c.position.x = (card_gap * cards.find(c))
		c.position.y = card_bottom_pad

func _on_mouse_entered():
	GameManager.current_card_holder_hover = self

func _on_mouse_exited():
	GameManager.current_card_holder_hover = null
