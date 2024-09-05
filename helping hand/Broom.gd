extends CharacterBody2D

@export var vary : float
@onready var wantedpos = global_position
@onready var cursor = $"/root/Node2D/Cursor"
var wait = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if (not wait):
		if (vary > 0 and global_position.x < wantedpos.x):
			velocity.x += 10
			move_and_slide()
		elif (vary < 0 and global_position.x > wantedpos.x):
			velocity.x += -10
			move_and_slide()
		else:
			$Sprite2D.flip_h = !$Sprite2D.flip_h
			vary *= -1
			wantedpos.x = global_position.x + vary
			wait = true
			velocity.x = 0
			$Timer.start(1)
		
	


func _on_timer_timeout():
	wait = false
