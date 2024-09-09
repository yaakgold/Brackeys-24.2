class_name Card
extends Sprite2D


func _on_mouse_enter():
	set_modulate(Color(.75, .75, .75))


func _on_mouse_exit():
	set_modulate(Color(1.0, 1.0, 1.0))


func _on_input(viewport, event, shape_idx):
	if(event is InputEventMouseButton && event.pressed == true):
		print(event)
