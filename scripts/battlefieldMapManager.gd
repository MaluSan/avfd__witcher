extends TileMap

onready var queue: Node2D = $Queue
var hero = preload("res://Character.tscn").instance()

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2

var grid_size = Vector2(16, 16)
var grid = []

var selectableTiles = []

func _ready():
	hero.connect("characterPressed", self, "showAvailableTiles")
	queue.connect("tileSelectedInfo", self, "moveHero")
	
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)
	
	var x = 5
	var y = 5
	var pos = Vector2(x,y)
	grid[x][y] = "hero"
	hero.localPos = pos
	hero.position = map_to_world(pos) - half_tile_size
	add_child(hero)

func showAvailableTiles():
	print(hero.isSelected)
	if hero.isSelected:
		queue.addSelectableTiles(3, hero.localPos)
	else:
		queue.deleteSelectableTiles()

func moveHero(localPos):
	grid[hero.localPos.x][hero.localPos.y] = null
	hero.localPos = localPos
	hero.position = map_to_world(localPos) - half_tile_size
	hero.updateSelectionState()
	queue.deleteSelectableTiles()
