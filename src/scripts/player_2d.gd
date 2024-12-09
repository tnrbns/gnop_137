extends CharacterBody2D

const SPEED = 450.0
@export var side = 'p1'
@onready var ball_scene = preload("res://elements/ball.tscn")
var ball = null

func _physics_process(_delta):
	var direction = get_axis(KEY_W, KEY_S)
	
	if side == 'p1':
		direction = get_axis(KEY_W, KEY_S)
	else:
		direction = get_axis(KEY_I, KEY_K)
		
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	# Spawn the ball if it doesn't exist
	if not ball:
		ball = ball_scene.instantiate()
		ball.player = self # Pass reference of the player to the ball
		get_parent().add_child(ball)
		ball.global_position = global_position + Vector2(30, 0) # Offset as needed
	
	# Shoot the ball
	if Input.is_action_just_pressed("shoot") and ball.is_attached:
		var launch_direction = Vector2(1 if side == 'p1' else -1, direction).normalized()
		ball.launch(launch_direction)

func get_axis(up, down):
	if Input.is_key_pressed(up): return -1
	elif Input.is_key_pressed(down): return 1
	return 0
