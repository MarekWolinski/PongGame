extends Node

var PlayerScore = 0
var OpponentScore = 0

func _on_left_body_entered(body):
	OpponentScore += 1
	score_achieved()

func _on_right_body_entered(body):
	PlayerScore += 1
	score_achieved()

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left)+1)

func _on_countdown_timer_timeout():
	get_tree().call_group("BallGroup","restart_ball")
	$CountdownLabel.visible = false
	
func score_achieved():
	$Ball .position = Vector2(640,360)
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownLabel.visible = true
	$CountdownTimer.start()
	$ScoreSound.play()
	$Player.position.x = 35
	$Player.position.y = 360
	$Oponent.position.x = 1280 - 35
	$Oponent.position.y = 360
