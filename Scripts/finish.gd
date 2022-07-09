extends Area2D




func _on_Area2D_body_entered(_body):
	get_parent().CalcScore()
	get_parent().get_node("Theboy").updatemove()
	yield(get_tree().create_timer(4), "timeout")
	get_tree().change_scene("res://Scenes/World2.tscn")


