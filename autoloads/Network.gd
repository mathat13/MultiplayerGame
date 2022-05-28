extends Node

const DEFAULT_IP = "127.0.0.1"
const DEFAULT_PORT = 42069
const MAX_PLAYERS = 8
var selected_ip = DEFAULT_IP
var selected_port = DEFAULT_PORT
var local_player_id = 0
var player_data = {}
sync var players = {}

func _ready():
	get_tree().connect("network_peer_connected", self, '_on_player_connected')
	get_tree().connect("network_peer_disconnected", self, '_on_player_disconnected')

func create_server():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(selected_port, MAX_PLAYERS)
	get_tree().set_network_peer(peer)
	add_to_playerlist()

func connect_to_server():
	var peer = NetworkedMultiplayerENet.new()
	get_tree().connect("connected_to_server", self, '_connected_to_server')	
	peer.create_client(selected_ip, selected_port)
	get_tree().set_network_peer(peer)

func add_to_playerlist():
	player_data = Save.save_data['player_name']
	local_player_id = get_tree().get_network_unique_id()
	players[local_player_id] = player_data

func _connected_to_server():
	add_to_playerlist()
	rpc_id(1, "_send_player_info", local_player_id, player_data)

remote func _send_player_info(id, player_info):
	players[id] = player_info
	if get_tree().is_network_server():
		rset('players', players)
		print(players)

func _on_player_connected(id):
	pass #players[id]

func _on_player_disconnected(id):
	pass
	
