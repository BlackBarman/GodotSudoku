extends LineEdit


func _ready():
	pass

func _on_text_changed(_new_text):
	var filtered_text = ""
	var valid_chars = "123456789"

	# Iterate through each character in the LineEdit's text
	for i in text:
		# Check if the character is a valid digit
		if valid_chars.find(i) != -1: #-1 would be the error check documentation
			filtered_text += i #filtered text is now equal to the first char encounterd in valid char
	# Set the LineEdit text to the filtered text
	text = filtered_text
