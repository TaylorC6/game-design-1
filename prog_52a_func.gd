extends Control

func sayHi():
	print("Hello World!")

func getArea(length, width):
	var area = length * width
	return area # send value out of function

func getPerim(length, width):
	return 2 * length + 2 * width

func _on_btn_calc_pressed() -> void:
	sayHi()
	var l = int($txtLen.text)
	var w = int($txtWid.text)
	var a = getArea(l, w)
	var p = getPerim(l, w)
	$lblOut.text = "Area: %d \nPerimeter: %d" % [a, p]


func _on_btn_clear_pressed() -> void:
	$lblOut.text = "Area: \nPerimeter:"

func _on_btn_exit_pressed() -> void:
	get_tree().quit()
