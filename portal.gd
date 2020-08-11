extends Node2D
export var path = "res://World.gd"
func portal_body_enter(body):
	if body.name == "Player":
		handle_player()
func handle_player():
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
