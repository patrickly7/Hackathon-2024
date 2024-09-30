extends Control

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")


func _on_play_again_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
