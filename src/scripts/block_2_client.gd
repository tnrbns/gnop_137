extends RigidBody2D

func hit():
	# Access the Sprite2D node
	var sprite = $Sprite2D
	$Hit.play()
	$CPUParticles2D.emitting = true
	# Check the current texture position
	if sprite.region_rect.position.x == 2730:  # 
		GameManager.addPointsP2(6)  # Award 6 points
		# Change the texture to "5" (position 2275)
		sprite.region_rect.position.x = 2275
		print("Texture changed to 18")
		
	elif sprite.region_rect.position.x == 2275:  
		GameManager.addPointsP2(15)  
		sprite.region_rect.position.x = 1820
		print("Texture changed to 4")	
		
	elif sprite.region_rect.position.x == 1820:  
		GameManager.addPointsP2(12)  
		sprite.region_rect.position.x = 1365
		print("Texture changed to 3")	
		
	elif sprite.region_rect.position.x == 1365:  
		GameManager.addPointsP2(9)  
		sprite.region_rect.position.x = 910
		print("Texture changed to 2")	
		
	elif sprite.region_rect.position.x == 910:  
		GameManager.addPointsP2(6)  
		sprite.region_rect.position.x = 455
		print("Texture changed to 1")
		
	else:
		# Default behavior for other blocks
		GameManager.addPointsP2(3)
		
		sprite.region_rect.position.x = 0		
		# Hide and disable the block
		$CollisionShape2D.disabled = true
		
		#await get_tree().create_timer(1).timeout
		#queue_free()
