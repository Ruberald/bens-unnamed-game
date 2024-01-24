extends CharacterBody2D


const SPEED = 300.0
# const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input x_direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		if (direction.abs().x > direction.abs().y):
			if direction.x > 0:
				$BenAnim.play("right_walk")
			else:
				$BenAnim.play("left_walk")
		else:
			if direction.y > 0:
				$BenAnim.play("back_walk")
			else:
				$BenAnim.play("front_walk")
	else:
		$BenAnim.pause()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	velocity = direction * SPEED

	move_and_slide()
	#var x_direction = Input.get_axis("ui_left", "ui_right")
	#var y_direction = Input.get_axis("ui_up", "ui_down")
	#if x_direction or y_direction:
		#if x_direction > 0:
			#$BenAnim.play("right_walk")
		#elif y_direction > 0:
		#else:
			#$BenAnim.play("left_walk")
		#velocity.x = x_direction * SPEED
	#else:
		#$BenAnim.pause()
		#velocity.x = move_toward(velocity.x, 0, SPEED)
