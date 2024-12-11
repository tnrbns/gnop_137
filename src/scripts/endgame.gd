extends Node2D

func _ready():
	if GameManager.score_p1 > GameManager.score_p2:
		$PlayerName.text = str(GameManager.name_p1)
	elif GameManager.score_p2 > GameManager.score_p1:
		$PlayerName.text = str(GameManager.name_p2)	
	else:
		$PlayerName.text = "A Tie!"
		$Label.text = ""

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
