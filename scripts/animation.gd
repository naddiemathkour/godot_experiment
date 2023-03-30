extends AnimatedSprite2D

@onready var animation_unlocked = true

func get_input_axis():
	var curr_vector = Input.get_vector("move_down", "move_up", "move_left", "move_right")

	if (animation_unlocked):
		if (curr_vector == Vector2(0,0)):
			play("idle")
		else:
			play("run")
		if (Input.is_action_just_pressed("move_left")):
			flip_h = true
		elif (Input.is_action_just_pressed("move_right")):
			flip_h = false
	print(animation)

	if(Input.is_action_pressed("attack")):
		play("3_strike_combo")
		animation_unlocked = false

func _physics_process(delta):
	get_input_axis()


func _on_animation_finished():
	animation_unlocked = true
