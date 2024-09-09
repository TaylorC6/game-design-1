extends Control



func _on_btn_calc_pressed() -> void:
	var killowatts = int($txtKillowatts.text)
	var base = int(killowatts * 0.0475)
	var sur = float(base * 1.1)
	var tax = float(base * 1.03)
	# here


func _on_btn_clear_pressed() -> void:
	$lblBase.text = "$"
	$lblCitytax.text = "$"
	$lblLatePay.text = "$"
	$lblSurcharge.text = "$"
	$lblTotalPay.text = "$"


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
