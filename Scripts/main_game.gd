extends Node2D

var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func game_over():
	pass

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	#$StartTimer.start()
