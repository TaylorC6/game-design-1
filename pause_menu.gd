extends Control


func _ready() -> void:
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	self.scale = Vector2(0.5,0.5)


func _on_btn_resume_pressed() -> void:
	self.hide()
	get_tree().paused = false


func _on_btn_quit_pressed() -> void:
	get_tree().quit()
