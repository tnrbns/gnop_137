extends Node2D

var block = preload("res://elements/block.tscn")

func _ready():
	inst(Vector2(600,700))
	inst(Vector2(700,800))


func inst(pos):
	var instance = block.instantiate()
	add_child(instance)

func _process(_delta):
	$Label.text = str(Main.p1_score)
	$Label2.text = str(Main.p2_score)

func _on_top_area_entered(area):
	area.direction.y *= -1

func _on_bottom_area_entered(area):
	area.direction.y *= -1
	
func _on_block_area_entered(area):
	area.direction.x *= -1
	if area.direction.x > 0:
		Main.p1_score += 1
	else:
		Main.p2_score += 1
	print("hit!")
	
func _on_left_area_entered(area):
	Main.p2_score += 1

func _on_right_area_entered(area):
	Main.p1_score += 1
