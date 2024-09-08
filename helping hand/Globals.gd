class_name globals extends Node

var time = 0
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

func _get_time_formatted():
	return "%02d:%02d.%03d" % [fmod(time, 3600) / 60, fmod(time, 60), fmod(time, 1) * 100]
