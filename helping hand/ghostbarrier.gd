extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func switch(on : bool):
	if (on):
		tile_set.get_physics_layer_collision_layer(0)
		self_modulate.a = 0.5
	else:
		self_modulate.a = 1
