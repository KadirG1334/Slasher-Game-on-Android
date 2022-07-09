extends Area2D



func _ready():
	pass # Replace with function body.


func _on_Searing_body_entered(_body):
	$AnimationPlayer.play("pick")
	$"/root/Global".score += 5  


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
