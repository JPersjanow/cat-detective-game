class_name Player extends CharacterBody2D
@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var user_menu: UserMenu = $CanvasLayer/UserMenu
const ITEM = preload("uid://dhafyee7gdewb")


@export var speed = 150.0
enum State {IDLE, WALK, SIT, TALKING}

var direction: Vector2 = Vector2.ZERO
var state: State
var abilities: Array
var inventory: Array
var booping: Tween
var resting: Tween
var original_speed: float
var npc_in_range: NPC

func _ready() -> void:
	state = State.IDLE
	abilities = []
	inventory = []
	user_menu.visible = false
	original_speed = speed
	
	hide_mouse()
	
	booping = create_tween().set_loops()
	booping.stop()
	booping.tween_property(sprite_2d, "rotation", deg_to_rad(14.0), 0.3)
	booping.tween_property(sprite_2d, "rotation", deg_to_rad(-14.0), 0.3)	
	
func _physics_process(delta: float) -> void:
	handle_input()
	move()
	animate()
	move_and_slide()

func handle_input() -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_pressed("info"):
		for ability: Global.Abilities in abilities:
			print(Global.Abilities.keys()[ability])
		for item in inventory:
			print(item)
		print(self.position)
		
	if Input.is_action_just_pressed("interact"):
		if npc_in_range:
			if state != State.TALKING:
					npc_in_range.start_chat()
					state = State.TALKING
			if npc_in_range.finished_talking:
				state = State.SIT
		
	
	if Input.is_action_just_pressed("open_usermenu"):
		user_menu.visible = !user_menu.visible
		
		if speed:
			switch_movement(false)
		else:
			switch_movement(true)
	
func move() -> void:
	velocity = direction * speed
	if velocity:
		state = State.WALK
	elif state == State.WALK:
		state = State.IDLE

func animate() -> void:

	if direction == Vector2.RIGHT:
		sprite_2d.flip_h = true
	if direction == Vector2.LEFT: 
		sprite_2d.flip_h = false
		
	if state == State.WALK:
		sprite_2d.animation = "walk"
		booping.play()
		if resting:
			resting.kill()
			
	elif state == State.SIT or state == State.TALKING:
		sprite_2d.animation = "sit"
	else:
		sprite_2d.animation = "idle"
		booping.stop()
		resting = create_tween()
		resting.tween_property(sprite_2d, "rotation", deg_to_rad(0.0), 0.2)

func collect(object: Area2D):
	if object.is_in_group("AbilityCollectible"):
		abilities.append(object.ability)
		user_menu.reload_abilities()
		object.queue_free()
	if object.is_in_group("QuestCollectible"):
		var item_scene: UIItem = ITEM.instantiate()
		item_scene.item_name = object.collectible_name
		item_scene.item_description = "Whatever"
		item_scene.for_npc = object.for_npc
		item_scene.item_texture = object.texture_frame
		inventory.append(item_scene)
		item_scene.for_npc.advance_story_stage()
		user_menu.reload_abilities()
		object.queue_free()
		
	
func hide_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func show_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func switch_movement(mode: bool):
	if mode:
		speed = original_speed
		hide_mouse()
	else:
		state = State.SIT
		speed = 0
		show_mouse()
