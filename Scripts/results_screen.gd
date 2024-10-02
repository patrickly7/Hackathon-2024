extends Control

func _ready():
	await get_tree().create_timer(1).timeout
	$FirstResultSound.play()
	$CorrectCardsPulled.show()
	$CorrectCardsPulled.text = "Correct Cards Pulled: " + str(Global.correctCardsPulled)
	
	await get_tree().create_timer(1).timeout
	$SecondResultSound.play()
	$IncorrectCardsPulled.show()
	$IncorrectCardsPulled.text = "Inorrect Cards Pulled: " + str(Global.wrongCardsPulled)
	
	await get_tree().create_timer(1).timeout
	$ThirdResultSound.play()
	$SQsCompleted.show()
	$SQsCompleted.text = "SQs Completed: " + str(Global.sqsCompleted)
	
	await get_tree().create_timer(1).timeout
	$FourthResultSound.play()
	$TimesWrongShippingUsed.show()
	$TimesWrongShippingUsed.text = "Times Wrong Shipped was Used: " + str(Global.wrongShippingUsed)
	
	await get_tree().create_timer(1).timeout
	calculate_rank()
	
	$PlayAgainButton.show()
	$QuitButton.show()

func calculate_rank():
	var correctCards = Global.correctCardsPulled
	var sqsCompleted = Global.sqsCompleted
	var penalties = Global.wrongCardsPulled + Global.wrongShippingUsed
	
	if correctCards >= 60 and sqsCompleted >= 9 and penalties == 0:
		$SRank.show()
	elif correctCards >= 50 and sqsCompleted >= 7 and penalties <= 2:
		$ARank.show()
	elif correctCards >= 40 and sqsCompleted >= 6 and penalties <= 4:
		$BRank.show()
	elif correctCards >= 30 and sqsCompleted >= 5 and penalties <= 6:
		$CRank.show()
	elif correctCards >= 20 and sqsCompleted >= 3 and penalties <= 10:
		$DRank.show()
	else:
		$FRank.show()

func _on_quit_button_pressed():
	$ButtonClickSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")


func _on_play_again_button_pressed():
	$ButtonClickSound.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
