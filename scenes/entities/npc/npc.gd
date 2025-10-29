class_name NPC extends CharacterBody2D
const TEXTBOX = preload("uid://my3vfo17yd8y")


@export var npc_name: String
@export var story_stage: int = 1
var dialogue_lines: Array = []
var dialogue_index = 0
var is_chatting = false
var textbox_scene: Textbox

func start_chat() -> void:
	textbox_scene = TEXTBOX.instantiate()
	get_tree().root.add_child(textbox_scene)
	if dialogue_lines.is_empty():
		dialogue_lines = DialogueManager.get_dialogue(npc_name, story_stage)
		dialogue_index = 0
	
	if dialogue_index < dialogue_lines.size():
		textbox_scene.queue_text(dialogue_lines[dialogue_index])
		textbox_scene.display_text()
		is_chatting = true
		dialogue_index += 1
	else:
		end_chat()
		
func end_chat() -> void:
	is_chatting = false
	dialogue_index = 0
	dialogue_lines = []
	textbox_scene.hide_textbox()
	textbox_scene.queue_free()

func advance_story_stage() -> void:
	story_stage += 1
