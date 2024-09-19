extends Control



func _on_btn_calc_pressed() -> void:
	$ItemList.add_item("#    +1    *2    ^2")
	for num in range(2,21, 2):
		
		var plus = int(num + 1) # +1
		var dub = int(num * 2) # double
		var square = int(num ** 2) # squared
		var line = ("%d    %d    %d    %d") % [num,plus,dub,square]
		$ItemList.add_item(line) 


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
