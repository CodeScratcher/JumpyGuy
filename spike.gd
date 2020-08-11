extends Sprite
# positions

func spike_body_enter(body):
	if body.name == "Player":
		get_tree().reload_current_scene()

