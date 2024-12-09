extends Area2D

@export var sprite_visible = false
@export var collision_shape_disabled = true

func hit():
	$"Sprite".visible = sprite_visible
	$CollisionShape2D.disabled = collision_shape_disabled
