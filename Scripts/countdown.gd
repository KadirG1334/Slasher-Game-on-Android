extends Label
var say = 3
var son = 0


onready var oyun_btt = get_parent().get_node("go")
func _ready():
	set_process(true)
	oyun_btt.hide()


func _process(delta):
	say = say -  delta
	son = round(say)
	set_text(str(son))
	
	if say < 0:
		oyun_btt.show()
		oyun_btt.hidecountdown()
		
		
	if say < -2:
		oyun_btt.hide()
		queue_free()

