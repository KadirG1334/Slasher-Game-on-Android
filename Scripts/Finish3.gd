extends Area2D


func _ready():
	pass # Replace with function body.





func _on_Finish3_body_entered(body):
	get_parent().CalcScore()
	get_parent().get_node("Theboy").updatemove()
	yield(get_tree().create_timer(4), "timeout")
	
