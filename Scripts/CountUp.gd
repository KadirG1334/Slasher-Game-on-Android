extends Control


export(int) var minutes = 0
export(int) var seconds = 0
var dsec = 0


func _physics_process(_delta):
	if seconds>0 and dsec <=0:
		seconds -=1
		dsec =10
	if minutes > 0 and seconds <=0:
		minutes -= 1
		seconds = 60

	
	if seconds >=10:
		$Sec.set_text(str(seconds))
	else:
		$Sec.set_text("0" + str(seconds))
	if dsec >=10:
		$Dsec.set_text(str(dsec))
	else:
		$Dsec.set_text("0" + str(dsec))

func _on_Timer_timeout():
	dsec -=1
