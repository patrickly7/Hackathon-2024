extends Node2D

var timer
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func game_over():
	pass

func new_game():
	timer = 180
	$Player.start($StartPosition.position)
	$Timer.start()
	update_time(timer)
	update_message("Start!")
	
	$HelpButton.show()
	$PauseButton.show()

func _on_start_timer_timeout():
	new_game()

func _on_timer_timeout():
	timer -= 1
	if timer < 180:
		update_message("")
	
	update_time(timer)
	
func update_time(time):
	$TimerLabel.text = str(time)
	
func update_message(message):
	$Message.text = message


func _on_help_button_pressed():
	get_tree().paused = true
	
	$HelpButton.hide()
	$PauseButton.hide()
	
	$HelpMenu.show()

func _on_pause_button_pressed():
	get_tree().paused = true
	
	$HelpButton.hide()
	$PauseButton.hide()
	
	$PauseMenu.show()


func _on_pause_menu_hidden():
	$HelpButton.show()
	$PauseButton.show()


func _on_help_menu_hidden():
	$HelpButton.show()
	$PauseButton.show()
