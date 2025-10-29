class_name NPC extends CharacterBody2D
const TEXTBOX = preload("uid://my3vfo17yd8y")

@export var npc_name: String
@export var story_stage: int = 1
var dialogue_lines: Array = []
var textbox_scene: Textbox
var player_in_range: Player
var finished_talking: bool = false

func start_chat() -> void:
	textbox_scene = TEXTBOX.instantiate()
	if dialogue_lines.is_empty():
		var dialogue_lines: Array = DialogueManager.get_dialogue(npc_name, story_stage)
		textbox_scene.text_queue = dialogue_lines 
		get_tree().root.add_child(textbox_scene)
	else:
		end_chat()
		
func end_chat() -> void:
	finished_talking = true
	if textbox_scene:
		dialogue_lines = []
		textbox_scene.queue_free()
	remove_quest_item_from_player_inventory()
	
			
func remove_quest_item_from_player_inventory() -> void:
	var index = 0
	for item: UIItem in player_in_range.inventory:
		if item.for_npc == self:
			player_in_range.inventory.remove_at(index)
			item.queue_free()
			return
		index += 1

func advance_story_stage() -> void:
	story_stage += 1

func _on_conversation_area_body_exited(player: Player) -> void:
	end_chat()
	player.npc_in_range = null
	finished_talking = false
	player_in_range = null

func _on_conversation_area_body_entered(player: Player) -> void:
	player.npc_in_range = self
	player_in_range = player
