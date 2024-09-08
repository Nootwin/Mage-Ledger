extends CharacterBody2D


@export var SPEED = -300.0
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
	if (!$CollisionShape2D.disabled):
		if (tile_map.get_cell_tile_data(0, maplocal + Vector2i(dir, 2)).get_collision_polygons_count(0) > 0 and (tile_map.get_cell_tile_data(0, maplocal + Vector2i(dir+1, 1)).get_collision_polygons_count(0) < 1 and tile_map.get_cell_tile_data(0, maplocal + Vector2i(dir+1, 0)).get_collision_polygons_count(0) < 1)):
			velocity = Vector2(SPEED,0)
		else:
			$Sprite2D.flip_h = !$Sprite2D.flip_h
			SPEED = -SPEED
			velocity = Vector2(0, 0)

		move_and_slide()
		var col = get_last_slide_collision()
		if (col != null and col.get_collider() is player):
			col.get_collider().change_health(-30)


func _on_area_2d_body_entered(body):
	if (body is player):
		die()
		body.nextvelocity += Vector2(0, -1000)
	pass # Replace with function body.

func die():
	$CollisionShape2D.disabled = true
	$Sprite2D.texture = load("res://art/stonskindead.png")
	$Timer.start(1)
	
	

func _on_timer_timeout():
	queue_free()
