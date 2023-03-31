extends CharacterBody2D

@export var speed = 400
@onready var movement_lock = false
@onready var player = get_parent().get_node("player")
@onready var this_enemy = self
@onready var walk_around = false

func get_input():
	var curr_vector = Vector2.ZERO
	if (!walk_around):
		if (player.position.x > this_enemy.position.x):
			curr_vector += Vector2(.1,0)
		if (player.position.x < this_enemy.position.x):
			curr_vector += Vector2(-.1,0)
		if (player.position.y > this_enemy.position.y):
			curr_vector += Vector2(0,.1)
		if (player.position.y < this_enemy.position.y):
			curr_vector += Vector2(0,-.1)
	if (abs(player.position.x - this_enemy.position.x) < 7.8):
		walk_around = true
		curr_vector += Vector2(.25,0)
	else:
		walk_around = false
	
	#if ($basic_enemy_model.animation != "basic_attack"):
	velocity = curr_vector * speed
#	else:
#		velocity = Vector2.ZERO

func _physics_process(delta):
	if (true):
		pass
	get_input()
	move_and_slide()
