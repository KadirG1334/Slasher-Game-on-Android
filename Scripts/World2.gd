extends Node2D



func _ready():
	Global.game_over = false

	if get_tree().get_current_scene().name == "World2":
		
		get_tree().paused = false #Ders11
		$HUD2/Menu5.hide()
		$HUD2/Menu6.hide()
		

func _process(_delta):
	$Theboy/coinlabel.text = str(get_parent().get_node("/root/Global").score)
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		$HUD2/Menu5.show()

	
	

func _on_HUD_restart_game():
	var _error = get_tree().change_scene("res://Scenes/World1.tscn")






func CalcScore():
	print("aa")
	$Theboy/ScoreTable.show()
	$Theboy/Score2.print_score()
	 
	


func _on_HUD2_main_menu():
	get_tree().quit()



func _on_HUD2_music_game(value):
	Global.music_mute = not value
	var idx = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_mute(idx,Global.music_mute)


func _on_HUD2_ok_in_game():
	$HUD2/Menu5.show()
	$HUD2/Menu6.hide()


func _on_HUD2_options_in_game():
	$HUD2/Menu5.hide()
	$HUD2/Menu6.show()


func _on_HUD2_resume_game():
	$HUD2/Menu5.hide()
	get_tree().paused = false


func _on_HUD2_sound_game(value):
	Global.sound_mute = not value
	var idx = AudioServer.get_bus_index("FX")
	AudioServer.set_bus_mute(idx,Global.sound_mute)
