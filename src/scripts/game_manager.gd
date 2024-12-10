extends Node2D

var score = 0

func addPoints(points):
	score += points

func _process(delta: float) -> void:
	$CanvasLayer/ScoreLabel.text = str(score)
