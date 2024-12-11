extends Node2D

var Players = {}

var score_p1 = 0
var score_p2 = 0

func addPointsP1(points):
	score_p1 += points
	
func addPointsP2(points):
	score_p2 += points
