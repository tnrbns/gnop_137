extends Control

# Use `@onready` without the @ symbol
@onready var host_button = $VBoxContainer4/HostButton
@onready var enter_host_name = $VBoxContainer/EnterPlayerName

# Called when the node enters the scene tree for the first time
func _ready():
	# Disable the join button by default
	host_button.disabled = true
	# Connect the text_submitted signals to the appropriate functions
	enter_host_name.text_submitted.connect(_on_enter_host_name_text_submitted)

# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	pass

# Back button pressed
func _on_back_button_pressed():
	print("Back To Main Menu")
	get_tree().change_scene_to_file("res://menu.tscn")

# Join button pressed
func _on_host_button_pressed():
	print("Start Gameplay")
	# Add your gameplay logic here

# Called when the player name is submitted
func _on_enter_host_name_text_submitted(HostName_text: String) -> void:
	print("Host Name: ", HostName_text)
	# Enable the button if both fields are filled
	_check_button_enabled()

# Function to check if both text fields are filled and enable the button
func _check_button_enabled():
	# Enable the button if both the IP address and player name are provided
	if enter_host_name.text != "":
		host_button.disabled = false
	else:
		host_button.disabled = true
