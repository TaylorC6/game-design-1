extends Control


func _on_btn_calc_pressed() -> void:
	var Kilograms = int($txtKilograms.text)
	var Length = int($txtLength.text)
	var Width = int($txtWidth.text)
	var Height = int($txtHeight.text)
	var heavy = 0
	var large = 0
	if Kilograms > 27:
		heavy = 1
	if (Height * Length * Width) > 100000:
		large = 1
	if heavy == 1 and large == 0:
		$lblOut.text = "Too Heavy."
	elif heavy == 0 and large == 1:
		$lblOut.text = "Too Large."
	elif heavy == 1 and large == 1:
		$lblOut.text = "Too Heavy and Too Large."
	else:
		$lblOut.text = ""


func _on_btn_clear_pressed() -> void:
	$lblOut.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
