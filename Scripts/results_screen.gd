extends Control

func _ready():
	await get_tree().create_timer(1).timeout
	$CorrectCardsPulled.show()
	$CorrectCardsPulled.text = "Correct Cards Pulled: " + str(Global.correctCardsPulled)
	
	await get_tree().create_timer(1).timeout
	$IncorrectCardsPulled.show()
	$IncorrectCardsPulled.text = "Inorrect Cards Pulled: " + str(Global.wrongCardsPulled)
	
	await get_tree().create_timer(1).timeout
	$SQsCompleted.show()
	$SQsCompleted.text = "SQs Completed: " + str(Global.sqsCompleted)
	
	await get_tree().create_timer(1).timeout
	$TimesWrongShippingUsed.show()
	$TimesWrongShippingUsed.text = "Times Wrong Shipped was Used: " + str(Global.wrongShippingUsed)
	
	await get_tree().create_timer(1).timeout
	$PlayAgainButton.show()
	$QuitButton.show()

func _on_quit_button_pressed():
	$ButtonClickSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")


func _on_play_again_button_pressed():
	$ButtonClickSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
