extends Control
func myAdd(Num1, Num2):
	return Num1 + Num2

func mySub(Num1, Num2):
	return Num1 - Num2

func myMult(Num1, Num2):
	return Num1 * Num2

func myMod(Num1, Num2):
	return Num1 % Num2

func myDiv(Num1, Num2):
	return Num1 / Num2

func myPow(Num1, Num2):
	return Num1 ** Num2


func _on_btn_add_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = myAdd(n1, n2)
	$lblOut.text = "" + str(result)
	$lblOp.text = "Operation: +"


func _on_btn_sub_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = mySub(n1, n2)
	$lblOut.text = "" + str(result)
	$lblOp.text = "Operation: -"


func _on_btn_mult_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = myMult(n1, n2)
	$lblOut.text = "" + str(result)
	$lblOp.text = "Operation: *"


func _on_btn_mod_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = myMod(n1, n2)
	$lblOut.text = "" + str(result)
	$lblOp.text = "Operation: %"


func _on_btn_div_pressed() -> void:
	var n1 = float($txtNum1.text)
	var n2 = float($txtNum2.text)
	var result = myDiv(n1, n2)
	$lblOut.text = "%.3f" % result
	$lblOp.text = "Operation: /"


func _on_btn_pow_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = myPow(n1, n2)
	$lblOut.text = "" + str(result)
	$lblOp.text = "Operation: **"


func _on_btn_clear_pressed() -> void:
	$lblOut.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
