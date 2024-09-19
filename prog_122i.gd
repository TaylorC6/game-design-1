extends Control



func _on_btn_calc_pressed() -> void:
	$ItemList.add_item("Num    Cube Root    Cubed")
	for num in range(-25,26):
		var cubed = 0.0
		if num < 0:
			var posnum = abs(num)
			cubed = -(float(posnum ** (1.0 / 3)))
		else:
			cubed = float(num ** (1.0 / 3))
		var cube = num ** 3
		var line = "%d    %.3f    %d" % [num,cubed,cube]
		$ItemList.add_item(line)



func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
