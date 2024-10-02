extends Control

func _ready():
	$CorrectCardsPulled.text = "Correct Cards Pulled: " + str(Global.correctCardsPulled)
	$IncorrectCardsPulled.text = "Inorrect Cards Pulled: " + str(Global.wrongCardsPulled)
	$SQsCompleted.text = "SQs Completed: " + str(Global.sqsCompleted)
	$TimesWrongShippingUsed.text = "Times Wrong Shipped was Used: " + str(Global.wrongShippingUsed)

func _on_quit_button_pressed():
	$ButtonClickSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")


func _on_play_again_button_pressed():
	$ButtonClickSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
