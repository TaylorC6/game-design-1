extends Control

var score = 0 # Global var

func addPoint(): score += 1
func subPoint(): score -= 1

func reset():    score = 0
func update(): 
	$lblOut.text = "Score: %d" % score


func _on_btn_update_pressed() -> void:
	var choice = $txtModify.text.to_lower()
	if choice == "add":
		addPoint()
	elif choice == "sub" or choice == "subtract":
		subPoint()
	else:
		OS.alert("Invalid Choice")
	update()


func _on_btn_reset_pressed() -> void:
	reset()
	update()
