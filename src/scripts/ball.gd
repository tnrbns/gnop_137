extends Area2D

const SPEED = 700.0
var direction = Vector2.ZERO
var is_attached = true
var player = null

# Define the game boundaries explicitly
var bounds = Rect2(Vector2(20,10), Vector2(1100, 640))

func _process(delta):
	if is_attached and player:
		# Ball follows player when attached
		global_position = player.global_position + Vector2(35, 0)
	else:
		# Move the ball independently
		global_position += direction * SPEED * delta
		
		# Check for left boundary (reset if ball goes beyond the left edge)
		if global_position.x <= bounds.position.x:
			print(global_position)
			print("Left boundary reached! Resetting ball.")
			reset_to_player()
		
		# Check for right boundary (reset if ball goes beyond the right edge)
		if global_position.x >= bounds.end.x:
			print(global_position)
			print("Right boundary reached! Resetting ball.")
			reset_to_player()

func reset_to_player():
	# Ensure the ball is attached back to the player
	if player:
		is_attached = true
		global_position = player.global_position + Vector2(35, 0)
		direction = Vector2.ZERO

func _on_body_entered(_body):
	# Bounce the ball horizontally if it hits a paddle
	direction.x *= -1

func launch(initial_direction: Vector2):
	# Set the initial direction and detach from the player
	is_attached = false
	direction = initial_direction
#
#func reset_to_player():
	## Reset the ball to the player's position and reattach it
	#if player:
		#is_attached = true
		#global_position = player.global_position + Vector2(-35, 0) # Offset as needed
		#direction = Vector2.ZERO
