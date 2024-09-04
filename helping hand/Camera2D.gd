extends Camera2D

@onready var tilemap : TileMap = $"/root/Node2D/TileMap"


# Called when the node enters the scene tree for the first time.
func _ready():
	var rect = tilemap.get_used_rect()
	var map_cellsize = tilemap.scale.x * tilemap.tile_set.tile_size
	limit_left = rect.position.x * map_cellsize.x
	limit_right = rect.end.x * map_cellsize.x
	limit_top = rect.position.y * map_cellsize.y
	limit_bottom = rect.end.y * map_cellsize.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
