class_name QuestCollectible extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var collectible_name: String
@export var for_npc: NPC
var texture_frame: Texture2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_frame = animated_sprite_2d.sprite_frames.get_frame_texture("default", 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(player: Player) -> void:
	player.collect(self)
	
