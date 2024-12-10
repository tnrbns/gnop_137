extends Node2D

var block = preload("res://elements/block2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var start_x = 900
	var start_y = 140
	var column_gap = 65  # Horizontal gap between columns
	var row_gap = 65    # Vertical gap between rows

	for col in range(9): 
		for row in range(11): 
			var x_position = start_x + col * column_gap
			var y_position = start_y + row * row_gap
			inst(Vector2(x_position, y_position))
			
func inst(pos):
	var instance = block.instantiate()
	add_child(instance)
	instance.call_deferred("set_position", pos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
