extends BaseItem


func _init(): super._init(20) # 20 Max Health

func interact(player):
	player.pickup_heart(value)
	remove()
