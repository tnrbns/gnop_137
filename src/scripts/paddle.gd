extends CharacterBody2D

const SPEED = 450.0
@onready var ball_scene = preload("res://elements/ball2.tscn")
var ball = null

func _ready():
	# Create and attach the ball when the paddle is initialized
	ball = ball_scene.instantiate()
	add_child(ball)
	# Position the ball relative to the paddle
	ball.position = Vector2(40, 0)  # Adjust this value to position the ball correctly
	ball.is_active = false  # Start with the ball inactive

func _physics_process(delta):
	# Paddle movement
	var direction = Input.get_axis("W", "S")
	velocity.y = direction * SPEED if direction else move_toward(velocity.y, 0, SPEED)
	move_and_slide()
		
	# Ball shooting mechanism
	if ball and not ball.is_active:
		ball.global_position = global_position + Vector2(40, 0) # Offset as needed
		
		# When left mouse button is pressed, activate the ball
		if Input.is_action_just_pressed("shoot"):
			$Shoot.play()
			ball.is_active = true
			# Set initial velocity when shooting
			ball.vel = Vector2(ball.speed * -1, 0)
			# Detach the ball from the paddle
			remove_child(ball)
			get_parent().add_child(ball)
			ball.position = global_position + Vector2(40, 0)  # Position ball alongside the paddle
