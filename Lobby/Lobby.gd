extends Control


onready var selected_ip = $VBoxContainer/HBoxContainer/IPAddressTextEdit
onready var selected_port = $VBoxContainer/HBoxContainer2/PortTextEdit
onready var selected_name = $VBoxContainer/HBoxContainer4/NameTextEdit

func _ready():
	selected_port.text = Save.save_data['selected_port']
	selected_ip.text = Save.save_data['selected_ip']
	selected_name.text = Save.save_data['player_name']
	$VBoxContainer/HBoxContainer3/JoinButton.connect("pressed", self, '_on_JoinButton_pressed')

func _on_HostButton_pressed():
	Network.selected_port = int(selected_port.text)
	Network.create_server()

func _on_JoinButton_pressed():
	Network.selected_port = int(selected_port.text)
	Network.selected_ip = selected_ip.text
	Network.connect_to_server()


func _on_NameTextEdit_text_changed():
	Save.save_data['player_name'] = selected_name.text
	Save.save_data()


func _on_PortTextEdit_text_changed():
	Save.save_data['selected_port'] = selected_port.text
	Save.save_data()


func _on_IPAddressTextEdit_text_changed():
	Save.save_data['selected_ip'] = selected_ip.text
	Save.save_data()
