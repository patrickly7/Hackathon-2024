extends Control

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
