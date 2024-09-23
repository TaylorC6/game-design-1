extends Control


func _on_btn_calc_pressed() -> void:

	var mysum = 0
	var lcv = 3 # loop control variable
	while lcv <= 9669: # run code WHILE true
		mysum += lcv
		$ItemList.add_item(str(mysum))
		lcv += 3 # lcv = lcv + 3
	# for lcv in range(3, 9669, 3)


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
