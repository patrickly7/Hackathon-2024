extends Area2D

signal open_cabinet(num: int)
signal ship_package

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

var touchingCabinet = false
var currentCabinet = 1
var touchingShippingStation = false
var currentStation = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	screen_size.x -= 50
	screen_size.y -= 250
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if touchingCabinet:
		$SpeechBubble.show()
		$SpeechBubbleLabel.show()
		$SpeechBubbleLabel.text = "PULL!"
	elif touchingShippingStation:
		$SpeechBubble.show()
		$SpeechBubbleLabel.show()
		$SpeechBubbleLabel.text = "SHIP!"
	else:
		$SpeechBubble.hide()
		$SpeechBubbleLabel.hide()
	
	if Input.is_action_pressed("action") and touchingCabinet:
		open_cabinet.emit(currentCabinet)
		return
		
	if Input.is_action_pressed("action") and touchingShippingStation and Global.currentSQComplete:
		Global.sqsCompleted += 1
		if Global.currentSQWeight > 0 and Global.currentSQWeight < 1:
			if currentStation == "Envelope":
				Global.currentSQ = ""
			else:
				Global.wrongShippingUsed += 1
				print("NO ENVELOPE! THIS IS THE WRONG SHIPPING STATION!")
		elif Global.currentSQWeight >= 1 and Global.currentSQWeight < 2:
			if currentStation == "BubbleMailer":
				Global.currentSQ = ""
			else:
				Global.wrongShippingUsed += 1
				print("NO BUBBLE MAILER! THIS IS THE WRONG SHIPPING STATION!")
		else: # Greater than or equal to 2 oz
			if currentStation == "Box":
				Global.currentSQ = ""
			else:
				Global.wrongShippingUsed += 1
				print("NO BOX! THIS IS THE WRONG SHIPPING STATION!")
		return
	
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2(50, 250), screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x > 0
	elif velocity.y != 0:
		if velocity.y < 0:
			$AnimatedSprite2D.animation = "up"
		else:
			$AnimatedSprite2D.animation = "down"


func _on_body_entered(body):
	if body.is_in_group("cabinet"):
		touchingCabinet = true
		if body.get_name() == "Cabinet1":
			currentCabinet = 1
			#print('WHOA! CABINET 1!')
		elif body.get_name() == "Cabinet2":
			currentCabinet = 2
			#print('WHOA! CABINET 2!')
		elif body.get_name() == "Cabinet3":
			currentCabinet = 3
			#print('WHOA! CABINET 3!')
		else: # Cabinet4
			currentCabinet = 4
			#print('WHOA! CABINET 4!')

	elif body.is_in_group("shipping_station"):
		if body.get_name() == "EnvelopeStation":
			currentStation = "Envelope"
			#print('WHOA! AN ENVELOPE STATION!')
		elif body.get_name() == "BubbleMailerStation":
			currentStation = "BubbleMailer"
			#print('WHOA! A BUBBLE MAILER STATION!')
		elif body.get_name() == "BoxStation":
			currentStation = "Box"
			#print('WHOA! A BOX STATION!')
		touchingShippingStation = true
	
func _on_body_exited(body):
	#print('BYE BODY - ' + body.get_name())
	touchingCabinet = false
	touchingShippingStation = false
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


