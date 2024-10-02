extends Control

var page = 0

func _on_close_button_pressed():
	$ButtonClickSound.play()
	
	get_tree().paused = false
	hide()

func _on_left_arrow_pressed():
	$ButtonClickSound.play()
	
	if page > 0:
		page -= 1
	change_page()


func _on_right_arrow_pressed():
	$ButtonClickSound.play()
	
	if page < 3:
		page += 1
	change_page()

func change_page():
	if page == 0:
		$IntroPage.show()
		$ControlsPage.hide()
		$SetsPage.hide()
		$PackageTypesPage.hide()
	elif page == 1:
		$IntroPage.hide()
		$ControlsPage.show()
		$SetsPage.hide()
		$PackageTypesPage.hide()
	elif page == 2:
		$IntroPage.hide()
		$ControlsPage.hide()
		$SetsPage.show()
		$PackageTypesPage.hide()
	elif page == 3:
		$IntroPage.hide()
		$ControlsPage.hide()
		$SetsPage.hide()
		$PackageTypesPage.show()
