extends Node2D

var block = preload("res://elements/block2.tscn")
var timelabel: Label
var timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	var start_x = 900
	var start_y = 110
	var column_gap = 70  # Horizontal gap between columns
	var row_gap = 70     # Vertical gap between rows

	for col in range(8): 
		for row in range(11): 
			var x_position = start_x + col * column_gap
			var y_position = start_y + row * row_gap
			inst(Vector2(x_position, y_position))
			
	timelabel = $TimeLabel
	timer = $Timer
	
	timer.start()
			
func inst(pos: Vector2):
	var instance = block.instantiate()
	add_child(instance)
	instance.call_deferred("set_position", pos)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ScoreP1.text = str(GameManager.score)
	timelabel.text = time_to_minutes_secs_mili(timer.get_time_left())
	
func time_to_minutes_secs_mili(time: float) -> String:
	var mins = int(time) / 60
	var secs = int(time) % 60
	var mili = int((time - int(time)) * 100)
	return str("%0*d" % [2, mins]) + ":" + str("%0*d" % [2, secs]) 

func _on_timer_timeout():
	print("DONE!")
