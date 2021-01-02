extends Node

var isSelected
export(Texture) var notSelectedTexture
export(Texture) var selectedTexture

# Called when the node enters the scene tree for the first time.
func _ready():
	isSelected = false;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			isSelected = !isSelected
			updateSprite(isSelected)
			print(isSelected)
	pass

func updateSprite(isSelected):
	if isSelected:
		$Sprite.texture = selectedTexture
	else:
		$Sprite.texture = notSelectedTexture
	pass
