extends CharacterBody2D

const SPEED = 450.0
@export var side = 'p1'
@onready var ball_scene = preload("res://elements/ball.tscn")

func _physics_process(delta):
	var direction = get_axis(KEY_W,KEY_S)
	
	if side =='p1':
		direction =  get_axis(KEY_W, KEY_S)
	else:
		direction = get_axis(KEY_I,KEY_K)
		
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		var ball = ball_scene.instantiate()
		ball.position = position
		get_parent().add_child(ball)
		
func get_axis(up,down):
	if Input.is_key_pressed(up): return -1
	elif Input.is_key_pressed(down): return 1 
