extends Node2D

const IDLE_DUR = 1.0
export var move_to = Vector2.UP * 7
export var speed = 3.0
onready var spikeball = $SpikeBody
onready var tween = $MoveTween
var follow = Vector2.ZERO
func _init_tween():
	var duration = move_to.length()/ float(speed * 64)
	# Move between two positions
	tween.interpolate_property(self, "follow", Vector2.ZERO, move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DUR)
	tween.interpolate_property(self, "follow", move_to, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + IDLE_DUR * 2)
	tween.start()
# Called when the node enters the scene tree for the first time.
func _ready():
	_init_tween()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	spikeball.position = spikeball.position.linear_interpolate(follow, 0.075)
