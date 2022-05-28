extends TextEdit

export(int) var MAX_CHARACTERS = 15


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_SanitisedTextEdit_text_changed():
	var cursor = cursor_get_column()
	if text.length() >= MAX_CHARACTERS:
		text = text.left(MAX_CHARACTERS)
		cursor_set_column(cursor)
		
		
		
