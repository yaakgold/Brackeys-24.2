class_name CardHolder extends Area2D

signal CardPlacedHere

func _on_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton && event.pressed == true && GameManager.current_card != null):
		CardPlacedHere.emit()
