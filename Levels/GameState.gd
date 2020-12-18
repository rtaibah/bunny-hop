extends Node2D


func _ready():
	add_to_group("Gamestate")
	update_GUI()
	

func hurt():
	global_vars.lives -= 1
	$Player.hurt()
	update_GUI()
	if global_vars.lives < 0:
		end_game()
		
		
func update_GUI():
	get_tree().call_group("GUI", "update_GUI", global_vars.lives, global_vars.coins)
		

func coin_up():
	global_vars.coins += 1
	update_GUI()
	var multiple_of_coins = global_vars.coins % global_vars.target_number_of_coins
	if multiple_of_coins == 0:
		life_up()
		
		
func life_up():
	global_vars.lives += 1
	update_GUI()
	
	
func new_level():
	if global_vars.level_number == global_vars.FINAL_LEVEL:
		win_game()
		
	elif global_vars.level_number < global_vars.FINAL_LEVEL:
		global_vars.level_number += 1
		get_tree().change_scene("res://Levels/Level"+str(global_vars.level_number)+".tscn")

		
func end_game():
	reset_vars()
	get_tree().change_scene("res://Levels/GameOver.tscn")
	
	
func win_game():	
	reset_vars()
	get_tree().change_scene("res://Levels/Victory.tscn")
	

func reset_vars():
	global_vars.lives = 4
	global_vars.coins = 0
	global_vars.level_number = 1
	



