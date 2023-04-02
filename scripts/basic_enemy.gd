extends CharacterBody2D

@export var speed = 150
@onready var player = get_parent().get_node("player")

func get_input():
	var x_dir = .5 * (player.position.x - position.x)/(abs(player.position.x - position.x))
	var y_dir = .5 * (player.position.y - position.y)/(abs(player.position.y - position.y))
	var curr_dir = Vector2(x_dir, y_dir)

	if (abs(player.position.x - position.x) < 7.8):
		curr_dir += Vector2(1,0)
	
	velocity = curr_dir * speed if ($basic_enemy_model.animation != "basic_attack") else Vector2.ZERO

func _physics_process(delta):
	get_input()
	move_and_slide()
