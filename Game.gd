extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


var scene_node = null

func _ready():
	#get_tree().change_scene("res://gym_hawk.tscn")
	change_scene("res://Levels/Level A.tscn")
	print("game.gd loaded")
	set_process(true)
		
func change_scene(scene_name):
	if scene_node:
		scene_node.free()
		
	var scene = load(scene_name)
	var scene_node = scene.instance()
		
	add_child(scene_node)
	
		
func _process(dt):
	pass
	
	
	
	

