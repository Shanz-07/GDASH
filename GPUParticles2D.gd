extends GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($".","scale",Vector2(0,0),1)
	pass
