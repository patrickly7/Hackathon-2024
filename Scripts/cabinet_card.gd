extends Control

@export var card: CompressedTexture2D
@export var setIcon: CompressedTexture2D
@export var cardName: String

# Called when the node enters the scene tree for the first time.
func _ready():
	$Card.texture_normal = card
	$SetIcon.texture = setIcon
	$CardName.text = cardName


func _on_card_pressed():
	if Global.cardsPulled.has(cardName):
		Global.cardsPulled[cardName] += 1
	else:
		Global.cardsPulled[cardName] = 1
	print('Cards Pulled: ')
	print(Global.cardsPulled)
