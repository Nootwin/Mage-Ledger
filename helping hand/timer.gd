extends Panel
@onready var g = $"/root/Globals"

func _process(delta):
	g.time += delta
	var msec = fmod(g.time, 1) * 100
	var seconds = fmod(g.time, 60)
	var minutes = fmod(g.time, 3600) / 60
	$Minutes.text =  "%02d:" % minutes
	$Seconds.text =  "%02d." % seconds
	$Msec.text =  "%03d" % msec
	
func _get_time_formatted():
	return "%02d:%02d.%03d" % [fmod(g.time, 3600) / 60, fmod(g.time, 60), fmod(g.time, 1) * 100]
