extends Control

@export var card: CompressedTexture2D
@export var setIcon: CompressedTexture2D
@export var cardName: String

# Called when the node enters the scene tree for the first time.
func _ready():
	$Card.texture_hover = card
	$SetIcon.texture = setIcon
	$CardName.text = cardName


func _on_card_pressed():
	# Check if you even need to pull this card
	var currIndex = Global.getIndexInCardsToPull(cardName)
	if currIndex == -1:
		Global.wrongCardsPulled += 1
		print("NOT A CARD YOU NEED TO PULL")
		return
		
	# Check if you've already pulled enough of this card
	var requiredQty = Global.getQuantityInCardsToPull(cardName)
	var qtyPulled = Global.getQuantityInCardsPulled(cardName)
	if requiredQty == qtyPulled:
		Global.wrongCardsPulled += 1
		print("YOU ALREADY HAVE ENOUGH OF THIS CARD")
		return
	
	if qtyPulled > 0:
		# This card has already been pulled before
		var index = Global.getIndexInCardsPulled(cardName)
		Global.cardsPulledQuantities[index] += 1
	else:
		# This card hasn't been pulled yet
		Global.cardsPulled.append(cardName)
		Global.cardsPulledQuantities.append(1)
		
	Global.correctCardsPulled += 1
	print(Global.cardsPulled, Global.cardsPulledQuantities)
	
	$CardPullSound.play()

func _on_card_mouse_entered():
	$SetIcon.show()


func _on_card_mouse_exited():
	$SetIcon.hide()
