extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func get_input_axis():
	if (Input.is_action_pressed("move_up") || (Input.is_action_pressed("move_down")) || (Input.is_action_just_pressed("move_left")) || (Input.is_action_just_pressed("move_right"))):
		play(&"run", 1.0, false)
