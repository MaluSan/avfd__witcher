extends Node

var isSelected
var isEnabled
var localPos: Vector2

signal characterPressed

export(Texture) var notSelectedTexture
export(Texture) var selectedTexture

func _ready():
	isSelected = false
	isEnabled = true
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			updateSelectionState()
			emit_signal("characterPressed")
	pass

func updateSelectionState():
	isSelected = !isSelected
	updateSprite(isSelected)
	
func updateSprite(isSelected):
	if isSelected:
		$Area2D/Sprite.texture = selectedTexture
	else:
		$Area2D/Sprite.texture = notSelectedTexture
	pass
