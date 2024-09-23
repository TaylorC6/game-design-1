extends Control


func _on_btn_calc_pressed() -> void:
	$ItemList.add_item("x    y")
	for num in range(-12,17):
		var Y = (num ** 6 - 3 * num ** 5 - 93 * num ** 4 + 87 * num ** 3 + 1596 * num ** 2 - 1380 * num - 2800)
		var line = ("%d    %d") % [num,Y]
		$ItemList.add_item(line)


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
