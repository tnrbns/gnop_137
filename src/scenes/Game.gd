extends Node2D

var block = preload("res://elements/block2.tscn")

func _ready():
	var start_x = 900
	var start_y = 140
	var column_gap = 65  # Horizontal gap between columns
	var row_gap = 65    # Vertical gap between rows

	for col in range(8): 
		for row in range(11): 
			var x_position = start_x + col * column_gap
			var y_position = start_y + row * row_gap
			inst(Vector2(x_position, y_position))
			
func inst(pos):
	var instance = block.instantiate()
	add_child(instance)
	instance.call_deferred("set_position", pos)

func _process(_delta):
	$Label.text = str(Main.p1_score)
	$Label2.text = str(Main.p2_score)

func _on_top_area_entered(area):
	area.direction.y *= -1
	
func _on_bottom_area_entered(area):
	area.direction.y *= -1
				
func _on_left_area_entered(area):
	Main.p2_score += 1

func _on_right_area_entered(area):
	Main.p1_score += 1
