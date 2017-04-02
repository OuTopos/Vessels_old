#tool
extends KinematicBody2D

#export var texture = get_node("role_sprite")
#onready var texture = get_node("role_sprite")
export (Texture) var sprite_texture
export (Vector2) var sprite_texture_scaling

export var MOVESPEED = 180
export var MOVEACC = 20
var velocity = Vector2(0.0, 0.0)
var role = null

export(int, "CPU", "Player 1", "Player 2") var player_ctrl = 0

var last_dt = 0
var update_dt = 0.3


func _fixed_process(dt):
	
	if Input.is_action_pressed("debug_cycle_body"):
		player_ctrl += 1 % 4
		player_ctrl = player_ctrl % 4
		print("body swap: player ctrl", player_ctrl)		
	
	if is_colliding():
		var normal = get_collision_normal()
		if normal.y == -1 or normal.y == 1:
			velocity.y = 0.0
	
	# the body is possessed by a player
	if player_ctrl > 0:
		
		if Input.action_release("ctrl_p1_action"):
			pass
#			print("action")
	
		if Input.is_type("action"):
			print("is action")
			
		if Input.is_action_pressed("ctrl_p1_move_right"):
			velocity.x = MOVESPEED
		elif Input.is_action_pressed("ctrl_p1_move_left"):
			velocity.x = -MOVESPEED
		elif velocity.x > 0.1:
			velocity.x -= MOVEACC
		elif velocity.x < -0.1:
			velocity.x += MOVEACC
		else:
			velocity.x = 0
					
		if Input.is_action_pressed("ctrl_p1_move_down"):
			velocity.y = MOVESPEED
		elif Input.is_action_pressed("ctrl_p1_move_up"):
			velocity.y = -MOVESPEED
		elif velocity.y > 0.1:
			velocity.y -= MOVEACC
		elif velocity.y < -0.1:
			velocity.y += MOVEACC
		else:
			velocity.y = 0
		
	
	# automated control by AI
	else:
		last_dt += dt
		
		if last_dt >= update_dt:
			last_dt = 0
			
			if randf() > 0.5:
				velocity.x += randf() * MOVESPEED
			else:
				velocity.x -= randf() * MOVESPEED
			
			if randf() > 0.5:
				velocity.y += randf() * MOVESPEED
			else:
				velocity.y -= randf() * MOVESPEED
			
			
		
	
	velocity.x = clamp ( velocity.x, -MOVESPEED, MOVESPEED)
	velocity.y = clamp ( velocity.y, -MOVESPEED, MOVESPEED)			
	var motion = velocity * dt
	move(motion)



func _ready():
	#sprite_texture = get_node("role_sprite").get_texture()
	#sprite_texture =  body_sprite.get_texture()
#	var res = load("res://img/role_img/chef.png")
	if sprite_texture_scaling == null:
		sprite_texture_scaling = Vector2(1.0, 1.0)
	var sprite = get_node("role_sprite")
	sprite.set_texture(sprite_texture)
	sprite.set_scale(sprite_texture_scaling)
#	sprite.set_texture(res)
#	sprite.set_scale(Vector2(0.5,0.5))
	
	
	set_fixed_process(true)

	
	
	