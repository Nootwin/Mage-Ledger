extends Area2D

var slapping : bool = false
@onready var node = $Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (global_position.x > get_global_mouse_position().x):
		$Node2D/Sprite2D.flip_h = true
	if (global_position.x < get_global_mouse_position().x):
		$Node2D/Sprite2D.flip_h = false
	global_position = get_global_mouse_position()
	if (slapping):
		node.rotation_degrees += 10
		
		if (node.rotation_degrees > 180):
			node.rotation_degrees = 0
			$Node2D/Sprite2D.play("default")
			slapping = false
	pass
	
func _input(event):
	if (event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		slapping = true
		$Node2D/Sprite2D.play("Slap")
		node.rotation_degrees = -30
