extends Control



func _on_btn_calc_pressed() -> void:
	var pi = 3.14159
	var Radius = float($txtRadius.text)
	var Circum = 2 * pi * Radius
	var Area = pi * Radius ** 2
	$lblCircum.text = "Circumference: %.3f" % Circum
	$lblArea.text = "Area: %.3f" % Area


func _on_btn_exit_pressed() -> void:
	get_tree().quit()


func _on_btn_clear_pressed() -> void:
	$lblCircum.text = "Circumference: "
	$lblArea.text = "Area: "
