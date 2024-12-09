extends Node2D

func _process(_delta):
	$Label.text = str(Main.p1_score)
	$Label2.text = str(Main.p2_score)

func _on_top_area_entered(area):
	area.direction.y *= -1

func _on_bottom_area_entered(area):
	area.direction.y *= -1

func _on_left_area_entered(area):
	area.global_position = Vector2(576,320)
	Main.p2_score += 1

func _on_right_area_entered(area):
	area.global_position = Vector2(576,320)
	Main.p1_score += 1
	
	
