extends Node

signal tileSelectedSignal

var localPos: Vector2
var level: int

func _ready():
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			print(String(localPos) + " selected")
			emit_signal("tileSelectedSignal", self)
	pass
