extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*5
var jump_speed = 900
var count=1
var target_angle=180
var rotate0=true

func _ready():
	pass
func _process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

		
	position.x+=700*delta
	if is_on_floor() and Input.is_action_pressed("up") :
		
		velocity.y +=-jump_speed
		
		print($".".position.y)
	move_and_slide()


func _on_areaa_body_entered(body):
	if body.is_in_group("spikes"):
		position=Vector2(100,139)
		$"../Label".set_text("Attempt "+str(count))
		count+=1
		
		print("yes")
	pass # Replace with function body.



