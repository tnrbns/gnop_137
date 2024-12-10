extends Control

# Back button pressed
func _on_back_button_pressed():
	print("Back To Main Menu")
	get_tree().change_scene_to_file("res://menu.tscn")
