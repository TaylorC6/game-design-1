extends CharacterBody2D

const SPEED = 60.0
var MAX_HEALTH = 30.0
var HEALTH = MAX_HEALTH
var DAMAGE = 10.0
var AI_STATE = STATES.IDLE

enum STATES {IDLE=0, UP, DOWN, LEFT, RIGHT, UP_L, UP_R, DOWN_L, DOWN_R, DAMAGED}

var state_directions = [
	Vector2.ZERO,
	Vector2.UP,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.RIGHT,
	Vector2(-1, -1).normalized(), #UL
	Vector2(1, -1).normalized(), #UR
	Vector2(-1, 1).normalized(), #DL
	Vector2(1, 1).normalized(), #DR
	Vector2.ZERO,
]
var state_animations = [
	"",
	"walk_up",
	"walk_down",
	"walk_left",
	"walk_right",  #UL
	"walk_left",   #UR
	"walk_right",  #DL
	"walk_left",   #DR
	"walk_right",
	"",
]

var inertia = Vector2()
var ai_timer_max = 0.5
var ai_timer = ai_timer_max - randi() % 5
var damage_lock = 0.0
var animation_lock = 0.0
var knockback = 128.0
var vision_distance = 50.0
var money_value = 5.0 # Money Drop

signal recovered

@onready var rcR = $RayCast2DR
@onready var rcM = $RayCast2DM
@onready var rcL = $RayCast2DL
@onready var anim_player = $AnimatedSprite2D
@onready var aud_player = $AudioStreamPlayer2D

var drops = ["drop_coin","drop_heart"]
var coin_scene = preload("res://enitities/items/coins.tscn")
var heart_scene = preload("res://enitities/items/mini_heart.tscn")
var damage_shader = preload("res://assets/shaders/take_damage.tres")
var death_sound = preload("res://Sounds/enemy_death.wav")
var hit_sound = preload("res://Sounds/hit.wav")

func vec2_offset():
	return Vector2(randf_range(-10.0,10.0), randf_range(-10.0,10.0))

func drop_scene(item_scene):
	item_scene.global_position = self.global_position + vec2_offset()
	get_tree().current_scene.add_child(item_scene)

func drop_heart():
	drop_scene(heart_scene.instantiate())

func drop_coin():
	var coin = coin_scene.instantiate()
	coin.value = self.money_value
	drop_scene(coin)

func drop_items():
	var num_drops_c = randi() % 3 + 1
	for i in range(num_drops_c):
		var rnd_drop = drops[randi() % drops.size()]
		call_deferred(rnd_drop)
	#var num_drops_h = randi() % 3 + 1
	#for i in range(num_drops_h):
	#	var rnd_drop = drops[randi() % drops.size()]
	#	call_deferred(rnd_drop)

func turn_toward_player_location(location: Vector2):
	# Set the state to move toward the player
	var dir_to_player = (location - self.global_position).normalized()
	velocity = dir_to_player * (SPEED * 2)
	# Determine closest cardinal direction for anim
	var closest_angle = INF
	var closest_state = STATES.IDLE
	for i in range(1,5):
		var state_dir = state_directions[i]
		var angle_diff = abs(state_dir.angle_to(dir_to_player))
		if angle_diff < closest_angle:
			closest_angle = angle_diff
			closest_state = STATES.values()[i]
	AI_STATE = closest_state

func take_damage(dmg, attacker = null):
	if damage_lock == 0.0:
		AI_STATE = STATES.DAMAGED
		HEALTH -= dmg
		damage_lock = 0.2
		animation_lock = 0.2
		var dmg_intensity = clamp(1.0-((HEALTH+0.01)/MAX_HEALTH), 0.1, 0.8)
		$AnimatedSprite2D.material = damage_shader.duplicate()
		$AnimatedSprite2D.material.set_shader_parameter("intensity", dmg_intensity)
		if HEALTH <= 0:
			drop_items()
			aud_player.stream = death_sound
			aud_player.play()
			#await aud_player.finished
			queue_free()
		else:
			if attacker != null:
				var loc = attacker.global_position
				await recovered
				turn_toward_player_location(loc)

	pass

func _physics_process(delta: float) -> void:
	animation_lock = max(animation_lock - delta, 0)
	damage_lock = max(damage_lock - delta, 0)
	if int(AI_STATE) >= 1 and int(AI_STATE) <= 8:
		var raydir = state_directions[int(AI_STATE)]
		rcM.target_position = raydir * vision_distance
		rcL.target_position = \
			raydir.rotated(deg_to_rad(-45)).normalized() * vision_distance
		rcR.target_position = \
			raydir.rotated(deg_to_rad(45)).normalized() * vision_distance
	if animation_lock == 0.0:
		if AI_STATE == STATES.DAMAGED:
			$AnimatedSprite2D.material = null
			AI_STATE = STATES.IDLE
			recovered.emit()
		for player in get_tree().get_nodes_in_group("Player"):
			if $AttackBox.overlaps_body(player):
				if player.damage_lock == 0.0:
					var inert = (player.global_position - self.global_position)
					player.inertia = inert.normalized() * knockback
					player.take_damage(DAMAGE)
				else:
					continue
			if player.data.state != player.STATES.DEAD:
				if (rcM.is_colliding() and rcM.get_collider() == player) or \
				   (rcL.is_colliding() and rcL.get_collider() == player) or \
				   (rcR.is_colliding() and rcR.get_collider() == player):
					turn_toward_player_location(player.global_position)
			pass
		
		ai_timer = clamp(ai_timer - delta, 0.0, ai_timer_max)
		if ai_timer == 0.0:
			if AI_STATE == STATES.IDLE:
				var rnd_move = randi() % 4
				AI_STATE = STATES.values()[rnd_move+1]
			else:
				AI_STATE = STATES.IDLE
			ai_timer = ai_timer_max
		
		var direction = state_directions[int(AI_STATE)]
		velocity = direction * SPEED
		
		var anim = state_animations[int(AI_STATE)]
		if anim and not anim_player.is_playing():
			anim_player.play(anim)
		if AI_STATE == STATES.IDLE and anim_player.is_playing():
			anim_player.stop()
		velocity += inertia
		move_and_slide()
		inertia = inertia.move_toward(Vector2(), delta * 1000.0)
		
	pass
