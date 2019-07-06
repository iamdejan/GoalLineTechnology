extends Area2D

var onto_goal: bool = false

func _on_Field_body_exited(body):
	if onto_goal:
		print("Goal!")
	pass

func _on_GoalDetector_body_entered(body):
	if body.name == "Ball":
		onto_goal = true
	pass

func _on_GoalDetector_body_exited(body):
	if body.name == "Ball":
		onto_goal = false
	pass
