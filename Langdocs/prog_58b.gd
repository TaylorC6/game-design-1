extends Control



func _on_btn_calc_pressed() -> void:
	var a = float($txta.text)
	var b = float($txtb.text)
	var c = float($txtc.text)
	var quadadd = (-b + sqrt(b ** 2 - 4 * a * c)) / 2
	var quadsub = (-b - sqrt(b ** 2 - 4 * a * c)) / 2
	$lblRoots.text = "Roots: " + str(quadadd) + \
					"\t , " + str(quadsub)


func _on_btn_clear_pressed() -> void:
	$lblRoots.text = "Roots: "


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
