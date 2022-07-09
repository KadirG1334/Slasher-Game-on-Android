extends Node2D

var carpan:float

func _ready():
	Global.game_over = false

	if get_tree().get_current_scene().name == "World1":
		get_tree().paused = true #Ders11
		
	else:
		#World2,World3...
		$HUD/Menu1.hide()
		
func _process(_delta):
	carpan +=_delta
	
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		$HUD/Menu5.show()
	if get_tree().paused == true: 
		$HUD/Menu1.hide()
	

func _on_HUD_start_game():


	$HUD/Menu1.hide()
	$HUD/Menu2.show()
	$HUD/Menu3.hide()
	$HUD/Menu4.hide()
	$HUD/Menu5.hide()
func _on_HUD_options_game():
	$HUD/Menu1.hide()
	$HUD/Menu2.hide()
	$HUD/Menu3.hide()
	$HUD/Menu4.show()
	$HUD/Menu5.hide()
	$HUD/Menu6.hide()



func _on_HUD_exit_game():
	get_tree().quit()


func _on_HUD_new_game():
	$HUD/Music.stop()
	get_tree().paused = false
	$HUD/Menu1.hide()
	$HUD/Menu2.hide()
	$HUD/Menu3.hide()
	$HUD/Menu4.hide()
	$HUD/Menu5.hide()
	$HUD/Menu6.hide()
	
func _on_HUD_select_chapter():
	$HUD/Menu3.show()
	$HUD/Menu1.hide()
	$HUD/Menu2.hide()
	$HUD/Menu4.hide()
	$HUD/Menu5.hide()
	$HUD/Menu6.hide()

func _on_HUD_chapter1():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/World1.tscn")
	$HUD/Menu3.hide()
	$HUD/Menu1.hide()
	$HUD/Menu2.hide()
	$HUD/Menu4.hide()
	$HUD/Menu5.hide()
	$HUD/Menu6.hide()
func _on_HUD_chapter2():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/World2.tscn")
	$HUD/Menu3.hide()
	$HUD/Menu1.hide()
	$HUD/Menu2.hide()
	$HUD/Menu4.hide()
	$HUD/Menu5.hide()
	$HUD/Menu6.hide()

func _on_HUD_chapter3():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/World3.tscn")
	$HUD/Menu3.hide()
	$HUD/Menu1.hide()
	$HUD/Menu2.hide()
	$HUD/Menu4.hide()
	$HUD/Menu5.hide()
	$HUD/Menu6.hide()

func _on_HUD_resume_game():
	$HUD/Menu5.hide()
	get_tree().paused = false
	
func _on_HUD_restart_game():
	var _error = get_tree().change_scene("res://Scenes/World1.tscn")


func _on_HUD_options_in_game():
	$HUD/Menu4.hide()
	$HUD/Menu1.hide()
	$HUD/Menu2.hide()
	$HUD/Menu3.hide()
	$HUD/Menu5.hide()
	$HUD/Menu6.show()

func _on_HUD_sound_game(value):
	Global.sound_mute = not value
	var idx = AudioServer.get_bus_index("FX")
	AudioServer.set_bus_mute(idx,Global.sound_mute)


func _on_HUD_ok_options():
	$HUD/Menu1.show()
	$HUD/Menu2.hide()
	$HUD/Menu3.hide()
	$HUD/Menu4.hide()
	$HUD/Menu5.hide()
	$HUD/Menu6.hide()

func _on_HUD_ok_in_game():
	$HUD/Menu6.hide()
	get_tree().paused = false

func _on_HUD_main_menu():
	$HUD/Menu1.show()
	$HUD/Menu2.hide()
	$HUD/Menu3.hide()
	$HUD/Menu4.hide()
	$HUD/Menu5.hide()
	$HUD/Menu6.hide()

func _on_HUD_music_game(value):
	Global.music_mute = not value
	var idx = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_mute(idx,Global.music_mute)




func CalcScore():
	print("aa")
	$Theboy/ScoreTable.show()
	$Theboy/Score.print_score()
	 
	
