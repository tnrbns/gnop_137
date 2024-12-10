extends Control


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_play_button_pressed():
	print("Join Game")
	get_tree().change_scene_to_file("res://joingame.tscn")


func _on_host_button_pressed():
	print("Host Game")
	get_tree().change_scene_to_file("res://hostgame.tscn")# Replace with function body.
