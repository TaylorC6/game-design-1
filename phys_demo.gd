extends Node2D


var phys_ball = preload("res://phys_ball.tscn")
func _ready() -> void:
	$Panel/Grav_Slider.value = $phys_ball.gravity_scale


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var nball = phys_ball.instantiate()
		nball.position = event.position
		nball.gravity_scale = $Panel/Grav_Slider.value
		nball.inertia = float($Panel/txtInertia.text)
		nball.linear_velocity = Vector2(float($Panel/txtVelX.text), float($Panel/txtVelY.text))
		add_child(nball)

func _on_grav_slider_value_changed(value: float) -> void:
	for child in get_children():
		if child is RigidBody2D:
			child.gravity_scale = value


func _on_button_pressed() -> void:
	for child in get_children():
		if child is RigidBody2D:
			var force = randi_range(38,1000)
			child.apply_central_impulse(Vector2(1,0) * force)


func _on_button_2_pressed() -> void:
	var intertia = float($Panel/txtInertia.text)
	var v_x = float($Panel/txtVelX.text)
	var v_y = float($Panel/txtVelY.text)
	var velocity = Vector2(v_x, v_y)
	for child in get_children():
		if child is RigidBody2D:
			child.inertia = intertia
			child.linear_velocity = velocity


func _physics_process(delta: float) -> void:
	var velocity = Vector2(float($Panel/txtVelX.text), float($Panel/txtVelY.text))
	var accely = Vector2(0, int($Panel/txtAcc.text))
	var accelx = Vector2(int($Panel/txtAcc2.text), 0)
	for child in get_children():
		if child is RigidBody2D:
			child.linear_velocity += accely
			child.linear_velocity += accelx


func _on_btn_acc_pressed() -> void:
	for child in get_children():
		if child is RigidBody2D:
			child.queue_free()  
