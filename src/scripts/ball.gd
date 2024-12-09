extends Area2D

const SPEED = 450.0
var direction = Vector2.ZERO

func _process(delta):
	position.x += SPEED * delta
	
func _on_body_entered(body):
	direction.x *= -1
	Main.side = body.side
