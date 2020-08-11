extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	save_game.open("user://savegame.save", File.READ)
	var data = parse_json(save_game.get_as_text())
	save_game.close()
	get_tree().change_scene(data.level_to_load)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pressed:
		load_game()
