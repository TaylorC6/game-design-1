extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$World/CollisionPolygon2D/Polygon2D.polygon = \
	$World/CollisionPolygon2D.polygon
	pass 
