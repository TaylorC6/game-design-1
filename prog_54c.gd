extends Control



func _on_btn_calc_pressed() -> void:
	var pi = 3.14159
	var Radius = float($txtRadius.text)
	var Circum = 2 * pi * Radius
	var Area = pi * Radius ** 2
	$lblCircum.text = "Circumference: " + str(Circum)
	$lblArea.text = "Area: " + str(Area)


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
