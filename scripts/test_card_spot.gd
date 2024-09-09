extends Sprite2D


func _on_card_holder_card_placed_here():
	var c: Card = GameManager.current_card
	c.reparent(self)
	c.is_dragging = false
	GameManager.current_card = null
	c.cardData.trigger()
