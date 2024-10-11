extends RigidBody2D


func _on_body_entered(body: Node) -> void:
	$Timer.start()
	if body.name == "plt_player":
		for num in range(101):
			self.position.y += 1

func _on_timer_timeout():
		for num in range(101):
			self.position.y -= 1
