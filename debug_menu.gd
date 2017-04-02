extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var count = 0 

func _ready():
	get_node("option1").connect("pressed", self, "_on_option1_pressed")
	get_node("option1").set_text("GYM HAWK")
	
	get_node("option2").connect("pressed", self, "_on_option2_pressed")
	get_node("option2").set_text("spawn body")
	

func _on_option1_pressed():
	print("start gym hawk")
	#var scene = load("res://test_collision_map")
	var t = get_tree().change_scene("res://gym_hawk.tscn")
	print(t)
	
	
func _on_option2_pressed():
	print("spawn body")
	var scene = load("res://Body.tscn")
	var node = scene.instance()
	add_child(node)	
	
	
func _process(dt):
	print(count)
	count = count + 1
	
	
	
