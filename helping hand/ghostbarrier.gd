extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func switch(on : bool):
	if (on):
		modulate.a = 0.5
		tile_set.set_physics_layer_collision_mask(0, 16)
	else:
		modulate.a = 1
		tile_set.set_physics_layer_collision_mask(0, 4)
	print(tile_set.get_physics_layer_collision_mask(0))
	
