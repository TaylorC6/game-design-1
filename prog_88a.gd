extends Control



func _on_btn_calc_pressed() -> void:
	var num1 = float($LineEdit.text)
	var num2 = float($LineEdit2.text)
	var Sum = num1 + num2
	var Diff = num1 - num2
	var Prod = num1 * num2
	var Avg = Sum / 2
	var Abs = abs(Diff)
	var Max = 0
	var Min = 0
	if num1 > num2:
		Max = num1
	else:
		Max = num2
	
	if Max == num1:
		Min = num2
	else:
		Min = num1
	
	$Label.text = "Sum: " + str(Sum) + \
				"\nDifference: " + str(Diff) + \
				"\nAbs. Distance: " + str(Abs)

	$Label2.text = "Max: " + str(Max) + \
				"\nMin: " + str(Min) + \
				"\nProduct: " + str(Prod) + \
				"\nAverage: " + str(Avg)


func _on_btn_clear_pressed() -> void:
	$Label.text = ""
	$Label2.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
