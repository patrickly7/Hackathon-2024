extends Control

func _on_resume_button_pressed():
	get_tree().paused = false
	hide()

func _on_quit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
