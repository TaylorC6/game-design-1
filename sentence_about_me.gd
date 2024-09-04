extends Control



func _on_show_pressed() -> void:
	$Label.text = "I really like playing video games and drawing!"


func _on_show_2_pressed() -> void:
	$Label.text = ""


func _on_show_3_pressed() -> void:
	get_tree().quit()
