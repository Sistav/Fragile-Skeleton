extends KinematicBody2D
var death = false

func _ready():
	$AnimationPlayer.play("Idle")
	
func _process(_delta):
	pass

func die():
	if death == false:
		death = true
		$Sprite2.hide()
		$Sprite.show()
		$AnimationPlayer.play("Die")
		$RichTextLabel.set_text("YOU KILLED HIM!")

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode != KEY_ENTER:
			die()

 
func _on_ClickableArea_input_event(viewport, event, CollisionShape2D):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		die()

func _on_TouchScreenButton_pressed():
	die()
func _on_Area2D_mouse_entered():
	die()
