extends Node2D

var block = preload("res://elements/block2.tscn")
var block_client = preload("res://elements/block2_client.tscn")

var timelabel: Label
var timer: Timer

func _ready():
	var start_x_right = 900  # X position for the right side blocks
	var start_x_left = 180   # X position for the left side blocks
	var start_y = 110
	var column_gap = 70      # Horizontal gap between columns
	var row_gap = 70         # Vertical gap between rows
	
	# Create blocks on the right side
	for col in range(8): 
		for row in range(11): 
			var x_position = start_x_right + col * column_gap
			var y_position = start_y + row * row_gap
			var instance = block.instantiate()
			add_child(instance)
			instance.position = Vector2(x_position, y_position)
	
	# Create mirrored blocks on the left side
	for col in range(8): 
		for row in range(11): 
			var x_position = start_x_left + (7 - col) * column_gap
			var y_position = start_y + row * row_gap
			var instance = block_client.instantiate()
			add_child(instance)
			instance.position = Vector2(x_position, y_position)
	
	timelabel = $TimeLabel
	timer = $Timer
	
	timer.start()
			
func inst(pos: Vector2):
	var instance = block.instantiate()
	add_child(instance)
	instance.call_deferred("set_position", pos)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ScoreP1.text = str(GameManager.score_p1)
	$ScoreP2.text = str(GameManager.score_p2)
	
	timelabel.text = time_to_minutes_secs_mili(timer.get_time_left())
	
func time_to_minutes_secs_mili(time: float) -> String:
	var mins = int(time) / 60
	var secs = int(time) % 60
	var mili = int((time - int(time)) * 100)
	return str("%0*d" % [2, mins]) + ":" + str("%0*d" % [2, secs]) 

func _on_timer_timeout():
	print("DONE!")
