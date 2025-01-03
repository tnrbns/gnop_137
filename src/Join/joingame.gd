extends Control

# Use `@onready` without the @ symbol
@onready var join_button = $JoinButton
@onready var enter_ip_address = $VBoxContainer/EnterIPAddress
@onready var enter_player_name = $VBoxContainer/EnterPlayerName

# Called when the node enters the scene tree for the first time
func _ready():
	# Disable the join button by default
	join_button.disabled = true
	# Connect the text_submitted signals to the appropriate functions
	enter_ip_address.text_changed.connect(_on_enter_ip_address_text_changed)
	enter_player_name.text_changed.connect(_on_enter_player_name_text_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	pass

# Back button pressed
func _on_back_button_pressed():
	print("Back To Main Menu")
	get_tree().change_scene_to_file("res://menu.tscn")

# Join button pressed
func _on_join_button_pressed():
	print("Start Gameplay")
	# Add your gameplay logic here
	
# Function to check if both text fields are filled and enable the button
func _check_button_enabled():
	# Enable the button if both the IP address and player name are provided
	if enter_ip_address.text != "" and enter_player_name.text != "":
		join_button.disabled = false
	else:
		join_button.disabled = true

func _on_enter_player_name_text_changed(PlayerName_text: String):
	print("Player Name: ", PlayerName_text)
	# Enable the button if both fields are filled
	_check_button_enabled()

func _on_enter_ip_address_text_changed(IP_text: String):
	print("IP Address: ", IP_text)
	# Enable the button if both fields are filled
	_check_button_enabled()
