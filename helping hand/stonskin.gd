extends CharacterBody2D


@export var SPEED = 300.0
@onready var tile_map = $"/root/Node2D/TileMap"


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var maplocal = tile_map.local_to_map(tile_map.to_local(global_position))
	var dir
	if (SPEED > 0):
		dir = 1
	else:
		dir = -1
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if (tile_map.get_cell_tile_data(0, maplocal + Vector2i(dir, 1)).get_collision_polygons_count(0) < 1):
		velocity = Vector2(SPEED * delta,0)
	else:
		$Sprite2D.flip_h = !$Sprite2D.flip_h
		SPEED = -SPEED
		velocity = Vector2(0, 0)

	move_and_slide()
