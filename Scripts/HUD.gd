extends CanvasLayer

var score = 0
onready var scoreHUD = get_parent().get_node("/root/Global").score
signal start_game
signal resume_game
signal restart_game
signal exit_game
signal options_game
signal ok_options
signal music_game(value)
signal sound_game(value)
signal select_chapter
signal new_game
signal chapter1
signal chapter2
signal chapter3
signal main_menu
signal options_in_game
signal ok_in_game

func update_score():
	scoreHUD += 5
	$coinlabel.text = str(scoreHUD)
	print(scoreHUD)


func _process(_delta):
	
	$coinlabel.text = str(get_parent().get_node("/root/Global").score)
	

func _on_MusicCheckBox_toggled(button_pressed):
	emit_signal("music_game", button_pressed)


func _on_SoundCheckBox_toggled(button_pressed):
	emit_signal("sound_game", button_pressed)







func _on_NewGame_pressed():
	emit_signal("new_game")


func _on_ChapterSelect_pressed():
	emit_signal("select_chapter")


func _on_Chapter1_pressed():
	emit_signal("chapter1")


func _on_Chapter2_pressed():
	emit_signal("chapter2")


func _on_Chapter3_pressed():
	emit_signal("chapter3")


func _on_ExitButton_pressed():
	emit_signal("exit_game")


func _on_OptionsButton_pressed():
	emit_signal("options_game")


func _on_StartGame_pressed():
	emit_signal("start_game")


func _on_OKButton_pressed():
	emit_signal("ok_options")


func _on_Music_toggled(button_pressed):
	emit_signal("music_game", button_pressed)


func _on_Sound_toggled(button_pressed):
	emit_signal("sound_game", button_pressed)


func _on_OptionsinGame_pressed():
	emit_signal("options_in_game")


func _on_MainMenu_pressed():
	emit_signal("main_menu")


func _on_ResumeGame_pressed():
	emit_signal("resume_game")


func _on_OKinGame_pressed():
	emit_signal("ok_in_game")
