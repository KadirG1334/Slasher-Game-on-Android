extends Label
var c:float

func _process(delta):
	c = c + delta
func print_score():
	print(c)
	text = str(c)
	if c < 20:
		get_parent().get_node("ScoreTable/3SS").show()
		get_parent().get_node("ScoreTable/Label").show()
	if c > 20 and c <= 30:
		get_parent().get_node("ScoreTable/2SS").show()
		get_parent().get_node("ScoreTable/Label").show()
	elif c>30:
		get_parent().get_node("ScoreTable/1SS").show()
		get_parent().get_node("ScoreTable/Label").show()
