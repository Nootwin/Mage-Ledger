extends Area2D
@onready var cursor = $"/root/Node2D/Cursor"
@onready var ouradius = $CollisionShape2D.shape.size.x * 1.5
@onready var parent = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if (event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		if (get_overlapping_areas().has(cursor)):
			var v = Vector2(0, -1000)
			var angle = (global_position.x - cursor.global_position.x) / ouradius
			v = v.rotated(angle)
			v.y = globals.clamp_max(v.y, -500)
			parent.nextvelocity = v
			print(angle, v)
	pass # Replace with function body.
