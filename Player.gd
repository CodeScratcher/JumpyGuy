extends KinematicBody2D
const UP = Vector2(0, -1)
export var gravity = 50
export var terminal_velocity = 700
export var jump_force = 500
export var max_speed = 500
export var accel = 100
var motion = Vector2()
var facing_right = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	motion.y += gravity
	motion.x = clamp(motion.x, -max_speed, max_speed)
	if facing_right:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	if Input.is_action_pressed("left"):
		motion.x -= accel 
		facing_right = true
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("right"):
		motion.x += accel
		facing_right = false
		$AnimationPlayer.play("Run")
	else:
		motion.x = lerp(motion.x, 0, 0.5)
		$AnimationPlayer.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -jump_force
	if !is_on_floor():
		if motion.y < 0:
			$AnimationPlayer.play("Jump")
		elif motion.y > 0:
			$AnimationPlayer.play("Fall")
	if motion.y > 1024:
		get_tree().reload_current_scene ()
	if motion.y > 1:
		motion = move_and_slide_with_snap(motion, Vector2.DOWN* 16, UP)
	else:
		motion = move_and_slide(motion, UP)
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

