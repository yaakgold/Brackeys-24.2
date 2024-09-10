class_name Card extends Sprite2D

@onready var area_2d = $Area2D
@onready var icon = $Icon
@onready var desc = $Label

@export var cardData: CardData

var is_dragging = false
var old_parent: CardHolder = null

func _process(delta):
	if(is_dragging):
		global_position = get_global_mouse_position()

#TODO: Add more setup stuff
func setup_data():
	icon.texture = cardData.sprite
	desc.text = cardData.desc

func _on_mouse_enter():
	set_modulate(Color(.75, .75, .75))

func _on_mouse_exit():
	set_modulate(Color(1.0, 1.0, 1.0))

func _on_input(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.pressed == true):
			_on_mouse_exit()
			area_2d.monitoring = false
			old_parent = get_parent()
			reparent(get_tree().root)
			is_dragging = true
			GameManager.current_card = self
		elif(event.pressed == false && GameManager.current_card == self):
			#Handle dropping the card
			area_2d.monitoring = true
			is_dragging = false
			GameManager.current_card = null
			
			if(GameManager.current_card_holder_hover != null):
				var added = GameManager.current_card_holder_hover.add_card(self)
				if(!added):
					restore_old_parent()
			else:
				restore_old_parent()

func restore_old_parent():
	reparent(old_parent)
	old_parent.set_card_positions()
