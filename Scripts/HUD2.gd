extends CanvasLayer
signal resume_game
signal main_menu
signal options_in_game
signal ok_in_game
signal music_game(value)
signal sound_game(value)



func _on_CheckBox2_toggled(button_pressed):
	emit_signal("sound_game", button_pressed)


func _on_CheckBox3_toggled(button_pressed):
	emit_signal("music_game", button_pressed)



func _on_ResumeButton_pressed():
	emit_signal("resume_game")

func _on_OptionsButton2_pressed():
	emit_signal("options_in_game")


func _on_MainMenuButton3_pressed():
	emit_signal("main_menu")


func _on_OKButton2_pressed():
	emit_signal("ok_in_game")
