class_name UIItem extends TextureRect

@onready var info: TextureRect = $Info
@onready var item_name_label: Label = $Info/Name
@onready var item_description_label: Label = $Info/Description
@export var item_name: String
@export var item_description: String
@export var item_texture: Texture2D
@export var for_npc: NPC

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item_name_label.text = item_name
	item_description_label.text = item_description
	texture = item_texture
	info.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	info.visible = true

func _on_mouse_exited() -> void:
	info.visible = false
