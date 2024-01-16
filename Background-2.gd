extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	var tween = get_tree().create_tween()
	tween.tween_property($".", "modulate", Color.DARK_VIOLET, 4)
	
	
	pass # Replace with function body.


func _on_area_2d_3_body_entered(body):
	var tween = get_tree().create_tween()
	tween.tween_property($".","modulate",Color.BLACK,1)
	pass # Replace with function body.


func _on_area_2d_4_body_entered(body):
	var tween = get_tree().create_tween()
	tween.tween_property($".","modulate",Color("ff0881",1),1)
	pass # Replace with function body.


func _on_area_2d_5_body_entered(body):
	var tween = get_tree().create_tween()
	tween.tween_property($".", "modulate", Color.DARK_VIOLET,1)
	pass # Replace with function body.


func _on_area_2d_6_body_entered(body):
	var tween = get_tree().create_tween()
	tween.tween_property($".","modulate",Color("f50100",1),1)
	pass # Replace with function body.
