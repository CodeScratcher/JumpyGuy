extends RigidBody2D
var start_pos = position
export var end_pos = Vector2(300,150)
export var speed = 120
var pos = start_pos
var going_to_end = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	pos += (end_pos - start_pos) / speed
	position
