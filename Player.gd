extends RigidBody2D

var thrust = Vector2(0,0)
var rotation_direction = 0

const engine_thrust = 1500
const spin_thrust = 6000

func _ready():
	$CollisionPolygon2D.polygon = $Sprite.polygon
	$CollisionPolygon2D.global_position = $Sprite.global_position
	$CollisionPolygon2D.scale = $Sprite.scale

func get_input(delta):
	thrust = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		thrust += Vector2(0, engine_thrust).rotated(rotation)
	if Input.is_action_pressed("ui_down"):
		thrust -= Vector2(0, engine_thrust).rotated(rotation)
	
	rotation_direction = 0
	if !Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_left"):
			rotation_direction -= 1
		if Input.is_action_pressed("ui_right"):
			rotation_direction += 1
	else:
		if Input.is_action_pressed("ui_left"):
			rotation_direction += 1
		if Input.is_action_pressed("ui_right"):
			rotation_direction -= 1
	pass

func _process(delta):
	get_input(delta)
	pass
	
func _physics_process(delta):
	set_applied_force(-thrust)
	set_applied_torque(rotation_direction * spin_thrust)
	thrust *= 0.5
	pass