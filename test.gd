extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*5
var jump_speed = 900
func _ready():
	pass
func _process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	$".".position.x+=700*delta
	if is_on_floor() and Input.is_action_pressed("up") and $".".rotation_degrees==0:
		var tween=create_tween()
		tween.tween_property($".","rotation",deg_to_rad(180),0.5)
		velocity.y = -jump_speed
		print($".".position.y)
	move_and_slide()
	if is_on_floor() and Input.is_action_pressed("up"):
		var tween=create_tween()
		tween.tween_property($".","rotation",deg_to_rad(0),0.5)
		velocity.y =-jump_speed*1.38
	move_and_slide()
func _on_area_body_entered(body):
	if body is CharacterBody2D:
		position=Vector2(100,139)
func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		position=Vector2(100,139)

