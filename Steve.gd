extends KinematicBody2D

const SPEED = 200
const FALL = 35
const JUMP = -1100

var velocity = Vector2(0, 0)
var coins = 0

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
		$Sprite.play("air")
		
	velocity.y += FALL
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP
		
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.25)


func _on_fall_zone_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")
