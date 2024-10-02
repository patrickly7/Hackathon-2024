extends Node2D

func _on_start_button_pressed():
	$ButtonClickSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

func _on_quit_button_pressed():
	$ButtonClickSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()
