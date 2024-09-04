extends Control



func _on_button_pressed() -> void:
	$Label.text = "Art"


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_clear_pressed() -> void:
	$Label.text = ""
