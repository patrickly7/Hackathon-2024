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
	
	# Calculate How Many SKUs to Have
	var numSkus = rng.randi_range(2, 4)
	print("SKUs on SQ: " + str(numSkus))
	
	const possibleCardsLen = len(Global.possibleCards)
	var totalQuantity = 0
	
	if numSkus == 2:
		$SQItems/SQItem3.hide()
		$SQItems/SQItem4.hide()
	elif numSkus == 3:
		$SQItems/SQItem3.show()
		$SQItems/SQItem4.hide()
	else:
		$SQItems/SQItem3.show()
		$SQItems/SQItem4.show()
	
	# Fetch the SKUs and Generate Quantities for them
	for i in range(numSkus):
		var cardName = Global.possibleCards[randi() % possibleCardsLen]
		var quantity = rng.randi_range(1, 3)
		
		if i == 0:
			$SQItems/SQItem1/CardName.text = cardName
			$SQItems/SQItem1/Quantity.text = str(quantity)
			$SQItems/SQItem1/SetIcon.texture = load(Global.cardToSetIconDict[cardName])
		elif i == 1:
			$SQItems/SQItem2/CardName.text = cardName
			$SQItems/SQItem2/Quantity.text = str(quantity)
			$SQItems/SQItem2/SetIcon.texture = load(Global.cardToSetIconDict[cardName])
		elif i == 2:
			$SQItems/SQItem3/CardName.text = cardName
			$SQItems/SQItem3/Quantity.text = str(quantity)
			$SQItems/SQItem3/SetIcon.texture = load(Global.cardToSetIconDict[cardName])
		elif i == 3:
			$SQItems/SQItem4/CardName.text = cardName
			$SQItems/SQItem4/Quantity.text = str(quantity)
			$SQItems/SQItem4/SetIcon.texture = load(Global.cardToSetIconDict[cardName])
		
		Global.cardsToPull.append({
			cardName: quantity
		})
		
		totalQuantity += quantity
	print(Global.cardsToPull)
	
	# Calculate Weight
	var weight = totalQuantity * 0.2
	Global.currentSQWeight = weight
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
