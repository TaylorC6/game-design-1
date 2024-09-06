extends Control



func _on_calculate_pressed() -> void:
	var w = float($Input.text)
	var x = float($Input2.text)
	var y = float($Input3.text)
	var z = float($Input4.text)
	var sum = x + y + w + z
	var avg = (sum / 4)
	$lblSum.text = "Sum: " + str(sum)
	$lblAvg.text = "Average: " + str(avg)


func _on_clear_pressed() -> void:
	$lblSum.text = ""
	$lblAvg.text = ""


func _on_exit_pressed() -> void:
	get_tree().quit()
