extends CharacterBody2D

const SPEED = 600.0
var direction = Vector2.ZERO
var is_attached = true
var player = null

# Define the game boundaries explicitly
var bounds = Rect2(Vector2.ZERO, Vector2(1560, 864))

func _process(delta):
	if is_attached and player:
		global_position = player.global_position + Vector2(35, 0)
	else:
		# Move and detect collisions
		var collision = move_and_collide(direction * SPEED * delta)
		if collision:
			# Handle the collision response
			direction = direction.bounce(collision.normal).normalized()
		
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

func _on_body_entered(body: Node):
	if body and not is_attached:
		# Assuming the body is something like a paddle or wall
		var collision_normal = (global_position - body.global_position).normalized()
		direction = direction.bounce(collision_normal).normalized()
	
func launch(initial_direction: Vector2):
	# Set the initial direction and detach from the player
	is_attached = false
	direction = initial_direction
