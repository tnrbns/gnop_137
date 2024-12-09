extends Area2D

const SPEED = 450.0
var direction = Vector2.ZERO
var is_attached = true # Determines if the ball is still following the player
var player = null # Reference to the player node
var bounds = Rect2(Vector2.ZERO, Vector2(1100, 640)) # Adjust bounds to match your game area

func _process(delta):
	if is_attached and player:
		# Follow the player's position
		global_position = player.global_position + Vector2(35, 0) # Offset as needed
	else:
		# Move independently
		global_position += direction * SPEED * delta

		# Check if the ball is out of bounds
		if not bounds.has_point(global_position):
			reset_to_player()

func _on_body_entered(body):
	# Bounce the ball horizontally if it hits a paddle
	direction.x *= -1

func launch(initial_direction: Vector2):
	# Set the initial direction and detach from the player
	is_attached = false
	direction = initial_direction

func reset_to_player():
	# Reset the ball to the player's position and reattach it
	if player:
		is_attached = true
		global_position = player.global_position + Vector2(35, 0) # Offset as needed
		direction = Vector2.ZERO
