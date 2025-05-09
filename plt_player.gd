extends CharacterBody2D


const SPEED = 300.0
var JUMP_VELOCITY = -400.0
var gravity_on = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and gravity_on:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	update_animation(direction)

	if Input.is_action_just_pressed("ui_cancel"): # Esc
		gravity_on = not gravity_on
	if Input.is_action_just_pressed("ui_home"): # Home
		self.scale *= 2
		JUMP_VELOCITY *= 1.5
	if Input.is_action_just_pressed("ui_end"): # End
		self.scale /= 2
		JUMP_VELOCITY /= 1.5
	if Input.is_action_just_pressed("ui_page_up"): # Page Up
		self.rotation_degrees += 5
	if Input.is_action_just_pressed("ui_page_down"): # Page Down
		self.rotation_degrees -= 5
	if Input.is_action_just_pressed("ui_text_completion_replace"): # Tab
		self.position.x += 500
	if Input.is_action_just_pressed("ui_text_backspace"): # Backspace
		self.position.x -= 500
	if Input.is_action_just_pressed("ui_text_toggle_insert_mode"): # Insert
		self.position.y += JUMP_VELOCITY / 2.0
	if Input.is_action_just_pressed("ui_text_delete"): # Delete
		self.position.y -= JUMP_VELOCITY / 2.0
	if Input.is_action_just_pressed("zoom_cam_in"):
		$Camera2D.zoom += Vector2(1,1)
	if Input.is_action_just_pressed("zoom_cam_out"):
		$Camera2D.zoom -= Vector2(1,1)
	if Input.is_action_just_pressed("pause"):
		$Camera2D/pause_menu.show()
		get_tree().paused = true

	move_and_slide()

@onready var anim = $AnimatedSprite2D
func update_animation(direction):
	if not self.is_on_floor():
		anim.play("jump")
	elif direction != 0: # walking
		anim.play("walk_1")
		anim.flip_h = direction < 0 # flip sprite if moving left
	else: 
		anim.play("default")
