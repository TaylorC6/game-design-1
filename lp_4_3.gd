extends Control


func _on_btn_calc_pressed() -> void:
	var eggs = int($txtEggs.text)
	var dozens = floor(eggs / 12)
	var remainder = eggs % 12
	var price = 0.0
	var tcost = 0.0
	if dozens > 0 and dozens <= 4:
		price = 0.50
	elif dozens > 4 and dozens <= 6:
		price = 0.45
	elif dozens > 6 and dozens <= 11:
		price = 0.40
	elif dozens > 11:
		price = 0.35
	
	tcost = dozens * price + (remainder * ((1 / 12) * price))
	


func _on_btn_clear_pressed() -> void:
	$lblOut.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
