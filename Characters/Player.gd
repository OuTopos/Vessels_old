extends Node2D

var input_time_frame = 0.25
var input_timer = 0
var d_input = Vector2(0, 0)

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if d_input != Vector2(0, 0):
		input_timer += delta
	
	if input_timer >= input_time_frame:
		d_input = Vector2(0, 0)
		input_timer = 0
	
	
	# Directional input will work as a multiplier on the max velocity.
	
	# Keyboard input
	if (Input.is_action_pressed("ui_left")):
		d_input = Vector2(-1, 0)
		input_timer = 0
	if (Input.is_action_pressed("ui_right")):
		d_input= Vector2(1, 0)
		input_timer = 0
	if (Input.is_action_pressed("ui_up")):
		d_input= Vector2(0, -1)
		input_timer = 0
	if (Input.is_action_pressed("ui_down")):
		d_input= Vector2(0, 1)
		input_timer = 0
	# Normalize so that magnitude will be the same in any direction.
	#d_input = d_input.normalized()
	
	get_node("Base Character").direction = d_input
	
	# CONTROLLER INPUT TO BE DONE
	