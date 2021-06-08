extends KinematicBody2D

var velocity = Vector2()
export var direction = -1

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	#$floorChecker.position.x = $CollisionShape2D.shape.get_extends().x * direction
	
func _physics_process(delta):
	if is_on_wall() or not $floorChecker.is_colliding():
		direction *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += 30
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
