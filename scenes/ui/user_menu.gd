class_name UserMenu extends Control
const SKILL = preload("uid://dy16kbebv8bla")

@export var player: Player
@onready var skills_container: GridContainer = $TextureRect/SkillsContainer
@onready var items_container: GridContainer = $TextureRect/ItemsContainer

var displayed_abilities: Array[int] = []
var displayed_items: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reload_abilities()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reload_abilities() -> void:
	for ability in player.abilities:
		if !(displayed_abilities.has(ability)):
			var ability_scene: UISkill = SKILL.instantiate()
			ability_scene.ability = ability
			skills_container.add_child(ability_scene)
			displayed_abilities.append(ability)
	for item in player.inventory:
		print(item)
		items_container.add_child(item)
		displayed_items.append(item)
		
