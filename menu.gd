extends Control

@export var Address = "127.0.0.1"
@export var port = 8910

func _ready():
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.peer_disconnected.connect(peer_disconnected)
	multiplayer.connected_to_server.connect(connected_to_server)
	pass
	
func _process(delta):
	pass

#called on server and clients
func peer_connected(id):
	print("Player Connected " + str(id))
	
#called on server and clients
func peer_disconnected(id):
	print("Player Disconnected " + id)
	
#called on clients
func connected_to_server():
	print("Connected to Server")
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_play_button_pressed():
	print("Join Game")
	get_tree().change_scene_to_file("res://joingame.tscn")


func _on_host_button_pressed():
	print("Host Game")
	get_tree().change_scene_to_file("res://hostgame.tscn")# Replace with function body.
