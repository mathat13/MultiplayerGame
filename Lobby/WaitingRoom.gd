extends Popup

onready var itemlist = $MarginContainer/VBoxContainer/ItemList

func _ready():
	pass # Replace with function body.

func refresh_players(players:Dictionary):
	itemlist.clear()
	for player_id in players:
		var player_name = players[player_id]["player_name"]
		itemlist.add_item(player_name)
