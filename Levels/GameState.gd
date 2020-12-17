extends Node2D

var lives = 4
var coins = 0
var target_number_of_coins = 10
var level_number = 1
const FINAL_LEVEL = 2

func _ready():
	add_to_group("Gamestate")
	update_GUI()

func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	if lives < 0:
		end_game()
		
func update_GUI():
	get_tree().call_group("GUI", "update_GUI", lives, coins)
		

func coin_up():
	coins += 1
	update_GUI()
	var multiple_of_coins = coins % target_number_of_coins
	if multiple_of_coins == 0:
		life_up()
		
func life_up():
	lives += 1
	update_GUI()
	
func new_level():
	level_number = level_number + 1
	get_tree().change_scene("res://Levels/Level"+str(level_number)+".tscn")
		
		

	
func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
	
func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")
