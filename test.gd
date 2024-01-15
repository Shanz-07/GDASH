extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*5
var jump_speed = 800
var count=1
var target_angle=179
var rotate0=true
var fly = false
var music = true
var jump2=false



func _ready():
	
	pass
	
func _process(delta):
	position.x+=600*delta
	print(rotation_degrees)
	
	
	
	
	
	if not is_on_floor() and fly==false:
		velocity.y += gravity * delta
	
	if Input.is_action_pressed("fly") and fly == true:
		velocity.y+=-7500*delta
		
	if fly==true:
		velocity.y += gravity * delta*0.5
	move_and_slide()
	
	
	if is_on_floor() and Input.is_action_pressed("up") and  fly==false:
		
		if rotation_degrees<3 or rotation_degrees>185:
			
			$"../AnimationPlayer".play("jump")
			velocity.y = -jump_speed
		if rotation_degrees>175:
			print("yep")
			$"../AnimationPlayer2".play("jump2nd")
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
	$Icon2.set_texture(load("res://rocket (2).png"))
	fly=true	
	
	pass # Replace with function body.
func _on_area_2d_2_body_exited(body):
	fly=false
	
	pass # Replace with function body.


func _on_audio_stream_player_2d_finished():
	$"../AudioStreamPlayer".play()
	
	pass # Replace with function body.



