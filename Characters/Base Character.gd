extends Node2D

onready var character = get_node("..")
onready var tween = get_node("Tween")

var grid_size = Vector2(64, 64)

var moving = false
var direction = Vector2(0, 0)

# DEFAULT FUNCS
func _ready():
	set_process(true)
	
	move(Vector2(1,0))

func _process(delta):
	if direction != Vector2(0, 0):
		move(direction)
	


# THE REST

func move(direction):
	if not moving:
		moving = true
		
		var next_pos = character.get_pos() + direction * grid_size
		print(next_pos)
		tween.interpolate_property(character, "transform/pos", character.get_pos(), next_pos, 0.5, Tween.TRANS_QUINT, Tween.EASE_OUT)
		tween.start()
		
# SIGNALS
func _on_Tween_tween_complete( object, key ):
	moving = false

func _on_Area2D_area_enter( area ):
	print(area)
	pass # replace with function body


func _on_Area2D_body_enter( body ):
	print(body)
	pass # replace with function body
