class_name Card
extends Sprite2D

@onready var area_2d = $Area2D

@export var cardData: CardData

var is_dragging = false

func _process(delta):
	if(is_dragging):
		global_position = get_global_mouse_position()

func _on_mouse_enter():
	set_modulate(Color(.75, .75, .75))

func _on_mouse_exit():
	set_modulate(Color(1.0, 1.0, 1.0))

func _on_input(viewport, event, shape_idx):
	if(event is InputEventMouseButton && event.pressed == true):
		_on_mouse_exit()
		area_2d.monitoring = false
		reparent(get_tree().root.get_child(0))
		is_dragging = true
		GameManager.current_card = self
