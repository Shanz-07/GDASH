extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*5
var jump_speed = 800
var count=1
var target_angle=179
var rotate0=true
var fly = false
var music = true
var jump2=false
var button_play=false
var moving = true
var jumping = false
func _ready():
	pass
func _process(delta):
	if button_play==true and moving==true and jumping == true:
		position.x+=600*delta
		$"../Camera2D".position=position
		$"../Camera2D".zoom.x=2
		$"../Camera2D".zoom.y=2
		if Input.is_action_pressed("pause key"):
			moving = false
			jumping=false
	if moving == false:
		$"../AudioStreamPlayer".stream_paused=true
		$"../pause".position.x=position.x-80
		$"../pause".position.y=position.y-200
		if Input.is_action_pressed("resume"):
			$"../AudioStreamPlayer".stream_paused=false
			moving=true
			jumping=true
			$"../pause".position=Vector2(-9661,-168)
	print(rotation_degrees)
	if not is_on_floor() and fly==false:
		velocity.y += gravity * delta
	if Input.is_action_pressed("fly") and fly == true:
		velocity.y+=-7500*delta
	if fly==true:
		velocity.y += gravity * delta*0.5
	move_and_slide()
	if is_on_floor() and Input.is_action_pressed("up") and  fly==false and jumping == true:
			velocity.y=-jump_speed
	move_and_slide()
func _on_areaa_body_entered(body):
	if body.is_in_group("spikes") and music == true:
		music=false
		$"../AudioStreamPlayer".stop()
		$"../AudioStreamPlayer2D".play()
		position=Vector2(100,139)
		$"../Label".set_text("Attempt "+str(count))
		count+=1
		var tween = get_tree().create_tween()
		tween.tween_property($"../ParallaxBackground/ParallaxLayer/Background-2", "modulate", Color("0096ff",1), 1)
		var tween1 = get_tree().create_tween()
		tween1.tween_property($"../ParallaxBackground2/ParallaxLayer/Ground-long", "modulate", Color.BLUE, 1)
	pass # Replace with function body.
	if music==false :
		music=true
func _on_area_2d_2_body_entered(body):
	$CollisionPolygon2D2.position=Vector2(20,27)
	$areaa/CollisionPolygon2D3.position=Vector2(0,62)
	$Icon2.set_texture(load("res://rocket (2).png"))
	fly=true	
	$"../Camera2D".limit_bottom=1
	$"../Camera2D".zoom.x=1.85
	$"../Camera2D".zoom.y=1.85
	pass # Replace with function body.
func _on_area_2d_2_body_exited(body):
	$CollisionPolygon2D2.position=Vector2(2,10)
	$areaa/CollisionPolygon2D3.position=Vector2(-18.799,48.016)
	$Icon2.set_texture(load("res://icon.png"))
	$"../Camera2D".limit_bottom=350
	fly=false
	$"../Camera2D".zoom.x=2
	$"../Camera2D".zoom.y=2
	pass # Replace with function body.
func _on_audio_stream_player_2d_finished():
	$"../AudioStreamPlayer".play()	
	pass # Replace with function body.
func _on_button_pressed():
	jumping=true
	button_play=true
	pass # Replace with function body.
