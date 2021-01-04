extends Node

signal tileSelectedInfo

var tileGenerator = preload("res://Tile.tscn")
onready var tileMap = get_node('../')

var direction = {"up": Vector2(0,-1), "down": Vector2(0,1), "left": Vector2(-1,0), "right": Vector2(1,0)}

func _ready():
	pass
	
func addSelectableTiles(level, pos):
	if level > 0:
		for dir in direction:
			var localPos =  pos + direction[dir]
			if tileMap.grid[localPos.x][localPos.y] == null:
				var tile = tileGenerator.instance()
				tile.localPos = localPos
				tileMap.grid[localPos.x][localPos.y] = "tile"
				tile.position = tileMap.map_to_world(localPos) - tileMap.half_tile_size
				add_child(tile)
				tile.connect("tileSelectedSignal", self, "sendInformationFromSelectedTile")
			addSelectableTiles(level - 1, localPos)
	pass

func deleteSelectableTiles():
	for tile in get_children():
		tileMap.grid[tile.localPos.x][tile.localPos.y] = null
		tile.disconnect("tileSelectedSignal", self, "sendInformationFromSelectedTile")
		tile.queue_free()
	pass

func sendInformationFromSelectedTile(tileSelected):
	print("queue catched signal")
	var pos = tileSelected.localPos
	emit_signal("tileSelectedInfo", pos)
