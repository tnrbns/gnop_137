extends CharacterBody2D

var speed = 800
var vel = Vector2.ZERO
var direction = Vector2.ZERO
@export var is_active = false  # Default to inactive
var bounds = Rect2(Vector2.ZERO, Vector2(1560, 864))  # Define bounds to the play area

func _ready():
	# Initialize bounds based on the viewport size
	bounds = Rect2(Vector2(0, 0), get_viewport().size)

func _physics_process(delta: float) -> void:
	if is_active:
		# Move the ball and handle collisions
		var collision = move_and_collide(vel * delta)
		if collision:
			$Collide.play()
			vel = vel.bounce(collision.get_normal())
			if collision.get_collider().has_method("hit"):
				collision.get_collider().hit()
		
		# Check if the ball is out of bounds
		if !bounds.has_point(global_position):
			# Check if the ball reaches the rightmost or leftmost bounds
			if global_position.x >= bounds.position.x + bounds.size.x:  # Rightmost bound
				GameManager.addPointsP1(20)  
			elif global_position.x <= bounds.position.x:  # Leftmost bound
				GameManager.addPointsP1(-10)  
			reset_to_paddle()
			

func reset_to_paddle():
	# Reset the ball to the paddle's position
	var paddle = get_parent().get_node("Paddle")
	is_active = false
	vel = Vector2.ZERO  # Stop movement until relaunched
	global_position = paddle.global_position + Vector2(40, 0)  # Position ball relative to paddle
