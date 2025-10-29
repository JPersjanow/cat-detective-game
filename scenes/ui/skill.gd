class_name UISkill extends TextureRect

@export var ability: Global.Abilities
@onready var info: TextureRect = $Info
@onready var skill_name: Label = $Info/Name
@onready var skill_description: Label = $Info/Description

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = Global.AbilitiesTextures[ability]
	skill_name.text = Global.AbilitiesNames[ability]
	skill_description.text = Global.AbilitiesDescriptions[ability]
	info.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	info.visible = true

func _on_mouse_exited() -> void:
	info.visible = false
