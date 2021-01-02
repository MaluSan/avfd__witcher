extends TileMap

var character = preload("res://Character.tscn")

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2

var grid_size = Vector2(16, 16)
var grid = []

func _ready():
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)
			
	var hero = character.instance()
	var pos = map_to_world(Vector2(1,3))
	
	hero.position.x = pos.x-half_tile_size.x
	hero.position.y = pos.y-half_tile_size.y
	
	add_child(hero)

func getRandomPositionAvailable():
	var grid_pos = Vector2(randi() % int(grid_size.x), randi() % int(grid_size.y))
	return grid_pos
