extends Control

var rng = RandomNumberGenerator.new()

var validNumbers = '0123456789'
var isComplete = false

var item1Complete = false
var item2Complete = false
var item3Complete = false
var item4Complete = false

func _ready():
	rng.randomize()
	generateSQ()

func _process(delta):
	# Generate a New SQ once one is finished
	if $SQNumber.text != Global.currentSQ && isComplete:
		isComplete = false
		generateSQ()
		
	# Check Off Finished Items on the SQ Sheet
	if len(Global.cardsPulled) > 0:
		var sqItem1CardName = $SQItems/SQItem1/CardName.text
		if Global.cardsPulled[sqItem1CardName] == Global.cardsToPull[sqItem1CardName]:
			item1Complete = true
			$SQItems/SQItem1/Checkmark.show()
		else:
			$SQItems/SQItem1/Checkmark.hide()
			
		var sqItem2CardName = $SQItems/SQItem2/CardName.text
		if Global.cardsPulled[sqItem2CardName] == Global.cardsToPull[sqItem2CardName]:
			item2Complete = true
			$SQItems/SQItem2/Checkmark.show()
		else:
			$SQItems/SQItem2/Checkmark.hide()
			
		if !$SQItems/SQItem3.hidden:
			var sqItem3CardName = $SQItems/SQItem3/CardName.text
			if Global.cardsPulled[sqItem3CardName] == Global.cardsToPull[sqItem3CardName]:
				item3Complete = true
				$SQItems/SQItem3/Checkmark.show()
			else:
				$SQItems/SQItem3/Checkmark.hide()
		
		if !$SQItems/SQItem4.hidden:
			var sqItem4CardName = $SQItems/SQItem4/CardName.text
			if Global.cardsPulled[sqItem4CardName] == Global.cardsToPull[sqItem4CardName]:
				item4Complete = true
				$SQItems/SQItem4/Checkmark.show()
			else:
				$SQItems/SQItem4/Checkmark.hide()
		
	if item1Complete and item2Complete and item3Complete and item4Complete:
		isComplete = true
		
	# Stamp SQ with Completion Stamp
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
	# Reset All SQ Parameters
	Global.cardsToPull = []
	Global.cardsPulled = []
	
	item1Complete = false
	item2Complete = false
	item3Complete = false
	item4Complete = false
	$SQItems/SQItem1/Checkmark.hide()
	$SQItems/SQItem2/Checkmark.hide()
	$SQItems/SQItem3/Checkmark.hide()
	$SQItems/SQItem4/Checkmark.hide()
	
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
		item3Complete = true
		item4Complete = true
	elif numSkus == 3:
		$SQItems/SQItem3.show()
		$SQItems/SQItem4.hide()
		item4Complete = true
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
		
		Global.cardsToPull.append({ cardName: quantity })
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
	$SQItems.hide()
	$Weight.hide()
	$CompleteStamp.hide()

func _on_show_button_pressed():
	$HideButton.show()
	$ShowButton.hide()
		
	$SQSheetImage.show()
	$SQNumber.show()
	$SQItems.show()
	$Weight.show()
	$CompleteStamp.show()
