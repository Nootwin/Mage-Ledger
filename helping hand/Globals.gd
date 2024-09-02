class_name globals extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
static func clamp_max(value : float, max : float):
	if (value > max):
		return max
	else:
		return value
	
