extends CharacterBody2D

@export var speed: float = 500.0
@export var screen_size: Vector2 = Vector2(800, 800) # Limit player movement to screen size

func _physics_process(delta: float) -> void:
	var input_dir := Vector2.ZERO

	# Input
	input_dir.x = Input.get_action_strength("player_right") - Input.get_action_strength("player_left")
	input_dir.y = Input.get_action_strength("player_down") - Input.get_action_strength("player_up")
	
	# Normalize to prevent diagonal speed boost
	if input_dir != Vector2.ZERO:
		input_dir = input_dir.normalized()

	# Apply velocity
	velocity = input_dir * speed

	# Move with collision handling
	move_and_slide()

	# Clamp player inside screen bounds
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
