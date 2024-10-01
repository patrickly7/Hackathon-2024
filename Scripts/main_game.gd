extends Node2D

var timer = 0
var score = 0

const totalTime = 180

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	get_tree().change_scene_to_file("res://Scenes/results_screen.tscn")

func new_game():
	timer = totalTime
	$Player.start($StartPosition.position)
	$Timer.start()
	update_time(timer)
	update_message("Start!")
	
	$SQSheet.show()
	show_buttons()

func _on_start_timer_timeout():
	new_game()

func _on_timer_timeout():
	if (timer <= 0):
		print("Time: " + str(timer))
		game_over()
	
	timer -= 1
	if timer < totalTime:
		update_message("")
	
	update_time(timer)
	
func update_time(time):
	$TimerLabel.text = str(time)
	
func update_message(message):
	$Message.text = message


func _on_help_button_pressed():
	get_tree().paused = true
	
	hide_buttons()
	
	$HelpMenu.show()

func _on_pause_button_pressed():
	get_tree().paused = true
	
	hide_buttons()
	
	$PauseMenu.show()


func _on_pause_menu_hidden():
	show_buttons()


func _on_help_menu_hidden():
	show_buttons()


func hide_buttons():
	$HelpButton.hide()
	$PauseButton.hide()
	
func show_buttons():
	$HelpButton.show()
	$PauseButton.show()

func hide_stations():
	$EnvelopeStation.hide()
	$BubbleMailerStation.hide()
	$BoxStation.hide()
	
func show_stations():
	$EnvelopeStation.show()
	$BubbleMailerStation.show()
	$BoxStation.show()

func _on_cabinet_view_hidden():
	# TBD - add a way to unfreeze player when closing cabinet
	show_buttons()


func _on_player_open_cabinet():
	# TBD - add a way to freeze player when opening cabinet
	$CabinetView.show()
	hide_buttons()
