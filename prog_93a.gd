extends Control



func _on_btn_calc_pressed() -> void:
	var killowatts = int($txtKillowatts.text)
	var base = int(killowatts * 0.0475)
	var sur = float(base * 0.1)
	var tax = float(base * 0.03)
	var total = float(base + sur + tax)
	var late = float(total * 1.04)
	$lblBase.text = "$ %.2f" % base
	$lblSurcharge.text = "$ %.2f" % sur
	$lblCitytax.text = "$ %.2f" % tax
	$lblTotalPay.text = "$ %.2f" % total
	$lblLatePay.text = "$ %.2f" % late


func _on_btn_clear_pressed() -> void:
	$lblBase.text = "$"
	$lblCitytax.text = "$"
	$lblLatePay.text = "$"
	$lblSurcharge.text = "$"
	$lblTotalPay.text = "$"


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
