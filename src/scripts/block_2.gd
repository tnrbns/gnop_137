extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hit():
	
	GameManager.addPoints(1)
	
	$Sprite2D.visible = false
	$CollisionShape2D.disabled = true
	
	var blocksLeft = get_tree().get_nodes_in_group('Block')
	
	print("blocks left: ", blocksLeft)
	
	await get_tree().create_timer(1).timeout
	
	queue_free()
