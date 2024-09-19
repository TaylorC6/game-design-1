extends Control



func _on_btn_calc_pressed() -> void:
	$ItemList.add_item("#    ^2    ^3    ^4    ^5")
	for num in range(1,21):
		var square = int(num ** 2)
		var cube = int(num ** 3) # cubed
		var fourth = int(num ** 4) # to the fourth
		var fifth = int(num ** 5) # to the fifth
		var line = ("%d    %d    %d    %d    %d") % [num,square,cube,fourth,fifth]
		$ItemList.add_item(line)


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
