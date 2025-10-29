class_name Textbox extends CanvasLayer

@onready var textbox_container: MarginContainer = $MarginContainer
@onready var start_symbol: Label = $MarginContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol: Label = $MarginContainer/MarginContainer/HBoxContainer/End
@onready var label: RichTextLabel = $MarginContainer/MarginContainer/HBoxContainer/Label

enum State {
	READY,
	SHOWING,
	FINISHED
}

var current_state = State.READY
@export var current_index: int = 0
var text_queue = []
var current_line = ""

func _ready():
	# Called when the node is added to the scene. Hides the textbox initially.
	print(text_queue)
	start_symbol.text = "*"
	end_symbol.text = "(interact button to continue)"
	show_textbox()
	

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		if  current_index >= text_queue.size():
			change_state(State.FINISHED)
			hide_textbox()
			current_index = 0
		else:
			show_next_line()
	
	if current_state == State.FINISHED:
		self.queue_free()
	
func show_textbox():
	# Displays the textbox UI and sets the symbol markers.
	textbox_container.visible = true
	

func hide_textbox():
	textbox_container.visible = false

func show_next_line():
	if current_index >= text_queue.size():
		change_state(State.FINISHED)
		return
	
	current_line = text_queue[current_index]
	label.text = current_line
	show_textbox()
	change_state(State.SHOWING)
	current_index += 1

func change_state(next_state):
	# Updates the current state of the dialogue box.
	current_state = next_state
