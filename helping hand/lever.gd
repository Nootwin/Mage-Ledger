extends Area2D
@onready var parent = get_parent()
@onready var cursor = $"/root/Node2D/Cursor"
var on = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if (event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		if (get_overlapping_areas().has(cursor)):
			on = !on
			if (on):
				$Sprite2D.play("on")
			else:
				$Sprite2D.play("off")
			parent.switch(on)
			$AudioStreamPlayer2D.play()
