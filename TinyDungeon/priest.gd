extends KinematicBody2D


export var speed = 1 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2() # The players movement vector.
	
	# Left and right player movement
	if Input.is_action_pressed("ui_right"):
		velocity.x += .1
		
	if Input.is_action_pressed("ui_left"):
		velocity.x -= .1
		
	# Up and down player movement
	if Input.is_action_pressed("ui_down"):
		velocity.y += .1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= .1
	
	# Normalize movement speed, and play animation
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if Input.is_action_pressed("ui_left"):
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
			
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

	move_and_collide(velocity)
	
	# Clamp player postion inside bounds of screen
#	position.x = clamp(position.x,12, 530)
#	position.y = clamp(position.y,-7, 350)
