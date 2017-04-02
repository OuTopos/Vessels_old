extends KinematicBody2D

const is_character = true
export(int, "Captain", "Janitor", "Cook", "Engineer") var role

var roles = [
	{
		title = "Captain",
		texture = preload("res://img/role_img/captain.png")
	},
	{
		title = "Janitor",
		texture = preload("res://img/role_img/Hairstylist-128.png")
	},
	{
		title = "Cook",
		texture = preload("res://img/role_img/chef.png")
	},
	{
		title = "Engineer",
		texture = preload("res://img/role_img/engineer.png")
	}
]

var possessed = false

func _ready():
	if role <= roles.size():
		get_node("Label").set_text(roles[role]["title"])
		get_node("Sprite").set_texture(roles[role]["texture"])