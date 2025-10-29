class_name Treat extends Area2D

@export var ability: Global.Abilities
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match ability:
		1:
			animated_sprite_2d.animation = "blue"
		2:
			animated_sprite_2d.animation = "red"
		3:
			animated_sprite_2d.animation = "purple"
		4:
			animated_sprite_2d.animation = "gold"
		5:
			animated_sprite_2d.animation = "pink"
		_:
			animated_sprite_2d.animation = "green"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(player: Player) -> void:
	player.collect(self)
