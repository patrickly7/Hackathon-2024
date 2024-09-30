extends Area2D

signal open_cabinet

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

var touchingCabinet = false
var touchingShippingStation = false

var inactive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	screen_size.x -= 50
	screen_size.y -= 250
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inactive:
		return
	
	if Input.is_action_pressed("action") and touchingCabinet:
		open_cabinet.emit()
		inactive = true
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
		print('WHOA! A CABINET!')
		touchingCabinet = true
	elif body.is_in_group("shipping_station"):
		print('WHOA! A SHIPPING STATION!')
		touchingShippingStation = true
	
func _on_body_exited(body):
	print('BYE BODY')
	touchingCabinet = false
	touchingShippingStation = false
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


