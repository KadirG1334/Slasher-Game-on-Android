tool
extends Sprite


func _ready():
	pass # Replace with function body.

func _process(delta):
	_zoom_changed()

func _zoom_changed():
	
	material.set_shader_param("y_zoom",get_viewport().global_canvas_transform.y.y)
func _on_Water_item_rect_changed():
	material.set_shader_param("scale",scale)
