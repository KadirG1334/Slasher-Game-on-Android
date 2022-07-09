extends KinematicBody2D
var direction
var directionY
var is_jumping = false
var is_sliding = false
var velocity = Vector2()
var JUMP = 25
var gravity  = 25
var speed = 500
var speedY = 6
var fall_has_played = false
onready var Theboy = get_node("AnimatedSprite")
onready var slide = get_node("Slide_sound")
onready var jump = get_node("Jump_sound")
onready var run = get_node("Run_sound")
onready var fall =get_node("Fall_sound")
onready var river = get_node("river_sound")

var touch_position = null
var touch_tap_count = 0

func _ready():
	$Theme_sound.autoplay = true

func _input(event):

	if event is InputEventScreenTouch:
		
		if event.pressed:
			
			touch_tap_count +=1
			$TouchTimer.start()
			touch_position = event.position
			if touch_tap_count >= 2:
				if touch_position == event.position:
					Input.action_press("ui_hit")
		else:
			touch_position = null
			Input.action_release("ui_right")
			Input.action_release("ui_left")
			Input.action_release("ui_down")
			Input.action_release("ui_up")
	if event is InputEventScreenDrag:
		if touch_position == null:
			return
		if event.position.x > touch_position.x:
			Input.action_press("ui_right")
			Input.action_release("ui_left")
		if event.position.x < touch_position.x:
			Input.action_release("ui_right")
			Input.action_press("ui_left")

		if event.position.y > touch_position.y:
			Input.action_release("ui_up")
			Input.action_press("ui_down")
		if event.position.y < touch_position.y:
			Input.action_release("ui_down")
			Input.action_press("ui_up")
func _process(_delta):
	
	direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	directionY = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	

	velocity.y -= directionY*speedY
	velocity.x = direction*speed 

	velocity = move_and_slide(velocity, Vector2.UP)
	update_animation()
	


func update_animation():
	if is_on_floor():
		is_jumping = false
		fall_has_played = false
		

		if direction == 1:
			Theboy.flip_h = false
			if not run.playing:
				run.play()
			Theboy.play("Run")
		elif direction == -1:
			Theboy.flip_h = true
			if not run.playing:
				run.play()
			Theboy.play("Run")
		else:
			Theboy.play("Run")
	else:#havadayken
		
		if direction == 1:
			Theboy.flip_h = false
		elif direction == -1:
			Theboy.flip_h = true



			
	if Theboy.flip_h == true and Theboy.offset.x > 0:
		Theboy.offset *=-1
	if Theboy.flip_h == false and Theboy.offset.x < 0:
		Theboy.offset *=-1
	
func update_speed():
	speed +=10
	speedY +=10
	print("Y: ",speedY, " X: ",speed)
func updatemove():
	Theboy.stop()


func _on_TouchTimer_timeout():
	touch_tap_count = 0


func _on_TouchScreenButton_pressed():
	Input.action_press("ui_cancel")
	
