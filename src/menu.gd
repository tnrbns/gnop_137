extends Control

#clickfunctions
func _on_join_button_pressed() -> void:
	$VBoxContainer/Click.play()
	get_tree().change_scene_to_file("res://Join/joingame.tscn")

func _on_host_button_pressed() -> void:
	$VBoxContainer/Click.play()
	get_tree().change_scene_to_file("res://Host/host_play.tscn")

func _on_help_button_pressed() -> void:
	$VBoxContainer/Click.play()
	get_tree().change_scene_to_file("res://Help/HelpMenu.tscn")

func _on_quit_button_pressed() -> void:
	$VBoxContainer/Click.play()
	get_tree().quit()

#hoverfunctions
func _on_join_button_mouse_entered() -> void:
	$VBoxContainer/Hover.play()

func _on_host_button_mouse_entered() -> void:
	$VBoxContainer/Hover.play()

func _on_help_button_mouse_entered() -> void:
	$VBoxContainer/Hover.play()

func _on_quit_button_mouse_entered() -> void:
	$VBoxContainer/Hover.play()
