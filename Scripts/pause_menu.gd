extends Control

func _on_resume_button_pressed():
	$ButtonClickSound.play()
	
	get_tree().paused = false
	hide()

func _on_quit_button_pressed():
	$ButtonClickSound.play()
	await get_tree().create_timer(0.1).timeout
	
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
