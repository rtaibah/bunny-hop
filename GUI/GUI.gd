extends CanvasLayer

func _ready():
	$Control/TextureRect/HBoxContainer/LifeCount.text = "4"

func update_lives(lives_left):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)
	
