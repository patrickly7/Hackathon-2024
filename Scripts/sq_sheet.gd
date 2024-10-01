extends Control

var rng = RandomNumberGenerator.new()

var validNumbers = '0123456789'
var isComplete = false

func _ready():
	rng.randomize()
	generateSQ()

func _process(delta):
	if $SQNumber.text != Global.currentSQ && isComplete:
		isComplete = false
		generateSQ()
		
	if isComplete:
		$CompleteStamp.show()
	else:
		$CompleteStamp.hide()

func generateSQNumber():
	var sqNumber = "SQ-"
	for i in range(6):
		sqNumber += validNumbers[randi() % 6]
	return sqNumber

func generateSQ():
	Global.cardsToPull = []
	Global.cardsPulled = []
	
	# Create SQ Number
	var sqNumber = generateSQNumber()
	Global.currentSQ = sqNumber
	$SQNumber.text = sqNumber
	
	# Add Products
	var numSkus = rng.randi_range(2, 4)
	print("SKUs on SQ: " + str(numSkus))
	
	const possibleCardsLen = len(Global.possibleCards)
	var totalQuantity = 0
	
	for i in range(numSkus):
		var quantity = rng.randi_range(1, 3)
		Global.cardsToPull.append({
			Global.possibleCards[randi() % possibleCardsLen]: quantity
		})
		totalQuantity += quantity
	print(Global.cardsToPull)
	
	# Calculate Weight
	var weight = totalQuantity * 0.2
	$Weight.text = str(weight) + " oz"

func _on_hide_button_pressed():
	$ShowButton.show()
	$HideButton.hide()
		
	$SQSheetImage.hide()
	$SQNumber.hide()

func _on_show_button_pressed():
	$HideButton.show()
	$ShowButton.hide()
		
	$SQSheetImage.show()
	$SQNumber.show()
