extends Control

func _on_GameOver_ready():
	$Game_Over.play()


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")



