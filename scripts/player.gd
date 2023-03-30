extends CharacterBody2D

@export var speed = 400
@onready var animated_sprite = $player
var deadzone = Vector2(0,0)
func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if(input_direction == deadzone):
		animated_sprite.play("idle")
	else: if(input_direction != deadzone):
		animated_sprite.play("run")
	if (Input.is_action_pressed("attack")):
		animated_sprite.play("3_strike_combo")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
