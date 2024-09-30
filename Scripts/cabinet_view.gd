extends Control

var cabinetNumber = 1

func _ready():
	$CabinetName.text = "Cabinet " + str(cabinetNumber) 

func _on_close_button_pressed():
	hide()
