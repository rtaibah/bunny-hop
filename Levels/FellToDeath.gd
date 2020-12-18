extends Control

func _on_Timer_timeout():
	get_tree().change_scene("res://Levels/Level"+str(global_vars.level_number)+".tscn")
