extends AnimatedSprite2D

@onready var animation_unlocked = true
@onready var player = get_parent().get_parent().get_node("player")
@onready var this_enemy = get_parent()

func get_input_axis():
	var curr_vector:Vector2

	if (animation_unlocked):
		if (curr_vector == Vector2(0,0)):
			play("idle")
		else:
			play("run")
		if (Input.is_action_just_pressed("move_left")):
			flip_h = true
		elif (Input.is_action_just_pressed("move_right")):
			flip_h = false
	print(player.position.x)
	print(get_parent().position)
	
	if(Input.is_action_pressed("attack")):
		play("basic_attack")
		animation_unlocked = false
	elif(Input.is_action_just_released("attack")):
		stop();
		animation_unlocked = true

	if(Input.is_action_pressed("special_attack")):
		play("special_attack")
		animation_unlocked = false

func _physics_process(delta):
	get_input_axis()

func _on_animation_finished():
	animation_unlocked = true
