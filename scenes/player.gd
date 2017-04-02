extends KinematicBody2D

var possessing = false
var max_velocity = 250

func _fixed_process(delta):
	
	# Directional input will work as a multiplier on the max velocity.
	var d_input = Vector2(0, 0)
	
	# Keyboard input
	if (Input.is_action_pressed("ui_left")):
		d_input.x += -1
	if (Input.is_action_pressed("ui_right")):
		d_input.x += 1
	if (Input.is_action_pressed("ui_up")):
		d_input.y += -1
	if (Input.is_action_pressed("ui_down")):
		d_input.y += 1
	# Normalize so that magnitude will be the same in any direction.
	d_input = d_input.normalized()
	
	# CONTROLLER INPUT TO BE DONE
	
	
	
	# Check if anything is possesed and move it.
	if possessing:
		pass
		
	else:
	# If not then move ghost.
		# THIS NEEDS WORK
		var motion = d_input * max_velocity * delta
		move(motion)

func _ready():
	set_fixed_process(true)
	
	
	get_node("Swap area").connect("body_enter", self, "body_enter")
	get_node("Swap area").connect("body_exit", self, "body_exit")


func body_enter(body):
	print(body)
	if body.get("is_character") == true:
		get_node("Sprite").set_modulate(Color(1, 0, 0, 1))
		
	
func possess():
	pass
	