extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property($".", "modulate", Color.BLUE, 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_body_entered(body):
	var tween = get_tree().create_tween()
	tween.tween_property($".", "modulate", Color("8567c6",1), 4)
	
	


	pass # Replace with function body.


func _on_area_2d_6_body_entered(body):
	var tween = get_tree().create_tween()
	tween.tween_property($".", "modulate", Color("3b0009",1), 1)
	pass # Replace with function body.
