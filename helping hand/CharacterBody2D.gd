extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var player = $"/root/Node2D/Player"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var try = false
var nextvelocity : Vector2

	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.x = 0
	
	if (try):
		if (global_position.distance_to(player.global_position) < 500 and is_on_floor()):
			if (global_position.x > player.global_position.x):
				velocity = Vector2(-200, -400)
				$Sprite2D.flip_h = false
			else:
				velocity = Vector2(200, -400)
				$Sprite2D.flip_h = true
			
		try = false
	if (nextvelocity):
		velocity += nextvelocity
		nextvelocity = Vector2(0, 0)
	
	move_and_slide()
	var col = get_last_slide_collision()
	if (col != null and col.get_collider() is player):
		player.change_health(-10)
		velocity = Vector2(0, -500)
		move_and_slide()
	# Handle jump.

	



func _on_timer_timeout():
	try = true
	pass # Replace with function body.
	
func die():
	queue_free()
