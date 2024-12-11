extends Control

@export var Address = "192.168.77.44"
@export var port = 8910
@onready var test_scene = load("res://scenes/testscene.tscn")

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
	print("Player Disconnected " + str(id))
	
#called on clients
func connected_to_server():
	print("Connected to Server")
	#SendPlayerInformation.rpc_id(1,"", multiplayer.get_unique_id())
	
	
@rpc("any_peer","call_local")

func StartGame():
	var scene = test_scene.instantiate()
	get_tree().root.add_child(scene)
	self.hide()
	
	
#func SendPlayerInformation(name,id):
	#if !GameManager.Players.has(id):
		#GameManager.Players[id]={
			#"name":name,
			#"id":id,
			#'score':0
		#}
	#if multiplayer.is_server():
		#for i in GameManager.Players:
			#SendPlayerInformation.rpc(GameManager.Players[i].name, i)
			
			
#clickfunctions
func _on_join_button_pressed() -> void:
	$VBoxContainer/Click.play()
	get_tree().change_scene_to_file("res://Join/joingame.tscn")

func _on_host_button_pressed() -> void:
	$VBoxContainer/Click.play()
	get_tree().change_scene_to_file("res://Host/hostgame.tscn")

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


func _on_start_game_pressed():
	StartGame.rpc()
	pass # Replace with function body.
