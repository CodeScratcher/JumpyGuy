extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var path = "res://World.tscn"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pressed:
		get_tree().change_scene(path)
		save_game()
func save():
	var save_dict = {
		level_to_load = path
	}
	return save_dict
func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(save()))
	save_game.close()
