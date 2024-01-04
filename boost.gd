extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_jump: bool=true
func _ready():
	pass # Replace with function body.
func _process(delta):
	
		if not is_on_floor():
			velocity.y += (gravity) * delta
		$".".position.x+=700*delta
		if Input.is_action_just_pressed("up") and is_on_floor():
			$".".rotation_degrees+=180 
			$".".position.y-=300
		move_and_slide()
		print($".".rotation_degrees)
