extends Area2D

@export var nextarea : PackedScene
@onready var player = $"/root/Node2D/Player"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if (event is InputEventKey and event.is_pressed() and event.keycode == KEY_W and get_overlapping_bodies().has(player)):
		get_tree().change_scene_to_packed(nextarea)
