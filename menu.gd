extends Control


func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_button_pressed():
	print("Join Game")
	get_tree().change_scene_to_file("res://joingame.tscn")

func _on_help_button_pressed():
	print("Help")
	get_tree().change_scene_to_file("res://helpmenu.tscn")
