class_name player extends CharacterBody2D

var nextvelocity : Vector2
@onready var healthbar = $"../CanvasLayer/TextureProgressBar"
var health = 100

const SPEED = 500.0
const JUMP_VELOCITY = -800.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var movementVec : Vector2
var gravVec : Vector2
var otherVecs : Vector2

func _ready():
	healthbar.value = 100

func change_health(value):
	health += value
	health = globals.clamp_max(health, 100)
	healthbar.value = health


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		gravVec.y += gravity * delta * 1.5
		gravVec.y = globals.clamp_max(gravVec.y, 400)
		if (gravVec.y + nextvelocity.y > 0):
			$Sprite2D.play("jumpdown")
	else:
		change_health(0.5)
		

	# Handle jump.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("a", "d")
	if direction:
		if (direction > 0):
			$Sprite2D.flip_h = false
		if (direction < 0):
			$Sprite2D.flip_h = true
		movementVec.x = direction * SPEED
		if (is_on_floor() and not nextvelocity):
			$Sprite2D.play("run")
	else:
		movementVec.x = move_toward(velocity.x, 0, SPEED)
		if (is_on_floor() and not nextvelocity):
			$Sprite2D.play("default")
		
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("w")) and is_on_floor():
		$Sprite2D.play("jumpup")
		gravVec.y = JUMP_VELOCITY
		
	velocity = movementVec + gravVec + nextvelocity
	if (nextvelocity):
		nextvelocity.x = move_toward(nextvelocity.x, 0, 300 * delta)
		nextvelocity.y = move_toward(nextvelocity.y, 0,  780 * delta)
	
	
	move_and_slide()
	

