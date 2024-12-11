extends Control

@onready var ip_add = $EnterIPAddress
@onready var startb = $StartButton 
@onready var joinb = $JoinButton
@onready var hostb = $HostButton
@onready var line_edit = $LineEdit

const MAX_PLAYER = 2

@export var address = "172.16.5.123"
@export var port = 8910

var peer

func _ready():
	hostb.pressed.connect(_on_host_button_pressed)
	startb.pressed.connect(_on_start_button_pressed)
	joinb.pressed.connect(_on_join_button_pressed)
	
	multiplayer.peer_connected.connect(on_peer_connected)
	multiplayer.peer_connected.connect(on_peer_disconnected)
	multiplayer.connected_to_server.connect(on_connected_to_server)
	multiplayer.connection_failed.connect(on_connection_failed)
	
func _on_start_button_pressed():
	start_game.rpc()	

@rpc("any_peer", "call_local")
func start_game():
	var scene = load("res://scenes/testscene.tscn").instantiate()
	get_tree().root.add_child(scene)
	hide()

@rpc("any_peer")
func send_player_info(name, id):
	if !GameManager.Players.has(id):
		GameManager.Players[id] = {
			"name": name,
			"id": id,
			"score": 0
		}
	
	if multiplayer.is_server():
		for i in GameManager.Players:
			send_player_info.rpc(GameManager.Players[i].name, i)
		
func on_peer_connected(id):
	print('Player connected ' + str(id))
	
func on_peer_disconnected(id):
	print('Player disconnected ' + str(id))

func on_connected_to_server():
	print('Connected to server')
	send_player_info.rpc_id(1, line_edit.text, multiplayer.get_unique_id())
	
func on_connection_failed():
	print('Couldnt connect')
	
#clickfunctions
func _on_join_button_pressed() -> void:
	$VBoxContainer/Click.play()
	
	peer = ENetMultiplayerPeer.new()
	peer.create_client(address, port)
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(peer)
	
	#get_tree().change_scene_to_file("res://Join/joingame.tscn")

func _on_host_button_pressed() -> void:
	$VBoxContainer/Click.play()
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(port)
	if error != OK:
		print("Cannot host: " + error)
		
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	multiplayer.set_multiplayer_peer(peer)
	print("Waiting for other player")
	
	hostb.disabled = true
	
	#get_tree().change_scene_to_file("res://Host/hostgame.tscn")

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
