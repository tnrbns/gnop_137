extends CharacterBody2D

var speed = 700
var dir = Vector2.DOWN
var is_active = true


func _ready() -> void:
	velocity = Vector2(speed * -1, speed)
	
func _physics_process(delta: float) -> void:
	if is_active: 
		var collision = move_and_collide(velocity * delta)
		
		if collision:
			velocity = velocity.bounce(collision.get_normal())
			
			if collision.get_collider().has_method("hit"):
				collision.get_collider().hit()

		if(velocity.x > 0 and velocity.x < 100):
			velocity.x = -200
		
		if (velocity.y == 0):
			velocity.y = -200
			
		
