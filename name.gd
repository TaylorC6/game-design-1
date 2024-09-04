extends Control



func _on_btn_show_pressed() -> void:
	$Label.text = "Taylor Cahill"


func _on_btn_clear_pressed() -> void:
	get_tree().quit()


func _on_btn_exit_pressed() -> void:
	$Label.text = ""
