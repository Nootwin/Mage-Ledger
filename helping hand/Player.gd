extends CharacterBody2D

var nextvelocity : Vector2

const SPEED = 600.0
const JUMP_VELOCITY = -1000.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var movementVec : Vector2
var gravVec : Vector2
var otherVecs : Vector2


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		gravVec.y += gravity * delta * 2
		gravVec.y = globals.clamp_max(gravVec.y, 400)
		

	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("w")) and is_on_floor():
		gravVec.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("a", "d")
	if direction:
		if (direction > 0):
			$Sprite2D.flip_h = false
		if (direction < 0):
			$Sprite2D.flip_h = true
		movementVec.x = direction * SPEED
		$Sprite2D.play("run")
	else:
		movementVec.x = move_toward(velocity.x, 0, SPEED)
		$Sprite2D.play("default")
		
		
	velocity = movementVec + gravVec + nextvelocity
	if (nextvelocity):
		nextvelocity.x = move_toward(nextvelocity.x, 0, 400 * delta)
		nextvelocity.y = move_toward(nextvelocity.y, 0,  980 * delta)
	
	
	move_and_slide()
	

