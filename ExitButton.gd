extends Button



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pressed:
		get_tree().quit()
