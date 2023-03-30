extends CharacterBody2D

@export var speed = 400
@onready var movement_lock = false
@onready var player = get_parent().get_node("player")
@onready var this_enemy = self

func get_input():
	var curr_vector = Vector2.ZERO
	if (player.position.x > this_enemy.position.x):
		curr_vector += Vector2(.25,0)
	if (player.position.x < this_enemy.position.x):
		curr_vector += Vector2(-.25,0)
	if (player.position.y > this_enemy.position.y):
		curr_vector += Vector2(0,.25)
	if (player.position.y < this_enemy.position.y):
		curr_vector += Vector2(0,-.25)
	
	#if ($basic_enemy_model.animation != "basic_attack"):
	velocity = curr_vector * speed
#	else:
#		velocity = Vector2.ZERO

func _physics_process(delta):
	get_input()
	move_and_slide()
