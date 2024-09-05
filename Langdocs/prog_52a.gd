extends Control



func _on_btn_calc_pressed() -> void:
	var length = int($txtLen.text)
	var width = int($txtWid.text)
	var area = length * width
	var perim = 2 * length + 2 * width
	$LblArea.text = "Area: " + str(area)
	$LblPerim.text = "Perimeter: " + str(perim)
	# Operators: + - * / %        ** pow
	# str, int, float (floating-point number)

func _on_btn_clear_pressed() -> void:
	$txtLen.text = ""
	$txtWid.text = ""
	$LblArea.text = ""
	$LblPerim.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
