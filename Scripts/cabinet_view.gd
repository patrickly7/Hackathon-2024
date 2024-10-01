extends Control

@export var cabinetNumber = 1
@export var setIcon: CompressedTexture2D

func _ready():
	$CabinetName.text = "Cabinet " + str(cabinetNumber) 
	$CabinetSetIcon.texture = setIcon
	
	if cabinetNumber == 1:
		$BowCards.show()
		$ShieldCards.hide()
		$StaffCards.hide()
		$SwordCards.hide()
	elif cabinetNumber == 2:
		$BowCards.hide()
		$ShieldCards.show()
		$StaffCards.hide()
		$SwordCards.hide()
	elif cabinetNumber == 3:
		$BowCards.hide()
		$ShieldCards.hide()
		$StaffCards.show()
		$SwordCards.hide()
	else: # Cabinet 4
		$BowCards.hide()
		$ShieldCards.hide()
		$StaffCards.hide()
		$SwordCards.show()

func _on_close_button_pressed():
	hide()
