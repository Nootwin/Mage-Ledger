extends RichTextLabel


func _ready():
	$"/root/Song".stop()
	text += "\n Your Time was " + $"/root/Globals"._get_time_formatted()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (position.y > -2500):
		position.y -= delta * 100
