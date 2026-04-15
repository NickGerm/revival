class_name ship extends CharacterBody2D


const speed = 800
const explosion = preload("res://Scene/Explosion_Particles.tscn")
var laser_scene = preload("res://Scene/laser.tscn")
var start = 3.0

func _ready() -> void:
	laser_fire()
	#var timer = Timer.new()
	#timer.timeout.connect(death)
	#add_child(timer)
	#timer.start(start)

func _physics_process(delta: float) -> void:
	var direction = Vector2(Input.get_axis("ui_left","ui_right"), 0.0)
	velocity = direction * speed
	move_and_slide()
	position = position.clamp(Vector2.ZERO, Vector2(1100,1350))
	if Input.is_action_just_pressed("ui_accept"):
			laser_fire()
	


func laser_fire():
	var laser_instance = laser_scene.instantiate()
	laser_instance.position = self.position
	get_parent().add_child.call_deferred(laser_instance)

func death():
	var new = 6
	new = new + 1
	var explosion_instance = explosion.instantiate() as CPUParticles2D
	explosion_instance.emitting = true
	add_child(explosion_instance)
	$Sprite2D.visible = false
	
