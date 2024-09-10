class_name CardData extends Resource

@export var name: String
@export var cost: int
@export var desc: String
@export var sprite: Texture
@export var type: Globals.eCardType

func trigger():
	print("Need to implement trigger method for: " + name)
