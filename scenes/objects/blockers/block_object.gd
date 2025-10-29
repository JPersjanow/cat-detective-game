class_name BlockObject extends StaticBody2D

@export var ability_needed: Global.Abilities
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(player: Player) -> void:
	if ability_needed in player.abilities:
		print("player has proper ability")
		queue_free()
	else:
		print("player lacks ability")
