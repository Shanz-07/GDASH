extends CanvasLayer

func update_laser_text():
	if $"../player"== null:
		$ATTEMPTS/VBoxContainer/Label.text = str(int($ATTEMPTS/VBoxContainer/Label.text) + 1)
	
