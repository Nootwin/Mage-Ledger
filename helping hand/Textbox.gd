extends Sprite2D

@export var wantText : String
var curIndex = 0
var timer : Timer = Timer.new()
var downtimer : Timer = Timer.new()
@onready var label = $RichTextLabel


func change_text(txt):
	label.text = ""
	visible = true
	wantText = txt
	curIndex = 0
	timer.start(0.1)



# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.one_shot = true
	add_child(downtimer)
	downtimer.one_shot = true
	downtimer.timeout.connect(_on_downtimer_timeout)
	timer.start(0.04)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	
func _on_timer_timeout():
	label.text += wantText[curIndex]
	curIndex += 1
	if (curIndex < wantText.length()):
		timer.start(0.04)
	else:
		downtimer.start(2)
	
	
func _on_downtimer_timeout():
	visible = false
	
