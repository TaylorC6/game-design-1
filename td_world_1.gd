extends Node2D


func _process(_delta: float) -> void:
	for player in get_tree().get_nodes_in_group("Player"):
		if $TileMapLayer5/Area2D.overlaps_body(player):
			$TileMapLayer5.show()
		else:
			$TileMapLayer5.hide()

func world_change():
	for player in get_tree().get_nodes_in_group("Player"):
		if $Change_lvl/CollisionShape2D.overlaps_body(player):
			player.global_position = Vector2(7, -183)
