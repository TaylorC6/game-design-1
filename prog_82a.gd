extends Control



func _on_btn_calc_pressed() -> void:
	var limit = int($txtLimit.text)
	var speed = int($txtSpeed.text)
	var miles_over = speed - limit
	var fine = 20.0 + (miles_over * 5)
	$lblFine.text = "Fine: $ %.2f" % fine


func _on_btn_clear_pressed() -> void:
	$lblFine.text = "Fine: $"


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
