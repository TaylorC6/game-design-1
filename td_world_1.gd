extends Node2D


func _process(delta: float) -> void:
	for player in get_tree().get_nodes_in_group("Player"):
		if $TileMapLayer5/Area2D.overlaps_body(player):
			$TileMapLayer5.show()
		else:
			$TileMapLayer5.hide()
