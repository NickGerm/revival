class_name enemy extends Area2D

@export var speed = 400
var start_x
var direction = 0
@export var enemyType = 3
var bounce = 0
@export var wave_amplitude: float = 150.0
@export var wave_frequency: float = 0.5
@export var phase_offset: float
var ranDirection = randi_range(1,2)
var time_passed: float = 0.0 # Starts at 0.0 for every NEW enemy
const explosion = preload("res://Scene/Explosion_Particles.tscn")
var alive = true

func _physics_process(delta: float) -> void:
	if alive:
		time_passed += delta
		if (enemyType == 1):
			global_position.y += speed * delta
			var wave_value = sin((time_passed * wave_frequency * 6) + phase_offset)
			var offset_x = wave_value * wave_amplitude
			global_position.x = start_x + offset_x
		
		if (enemyType == 3):
			global_position.y += speed * delta
			if (global_position.x >= 1100):
				bounce = 1
			if (bounce == 0):
				global_position.x += speed * delta
			if (bounce == 1):
				global_position.x -= speed * delta
			
		if (enemyType == 2):
			if (global_position.y < 450):
				global_position.y += speed * delta
			if (global_position.y >= 450):
				global_position.x += speed * delta
		
		
		if (enemyType == 0):
			global_position.y += speed * delta
			if (direction == 1):
				global_position.x += speed * delta
			if (direction == 2):
				global_position.x -= speed * delta
			if (direction == 0):
				
				if (ranDirection == 1):
					global_position.x += speed * delta
				if (ranDirection == 2):
					global_position.x -= speed * delta
	

func _ready() -> void:
	
	speed = randi_range(200, 400)
	start_x =  randi_range(0,1000)
	if (enemyType == 3):
		global_position.x = 750
	else:
		global_position.x = start_x
	
	if (enemyType == 0):
		if (start_x < 250):
			direction = 1
		if (start_x > 800):
			direction = 2
			
func _on_body_entered(body):
	if alive:
		print ("made it here")
		if body is ship:
			body.death()
		if body is laser:
			Global.score +=1
			body.queue_free()
			var explosion_instance = explosion.instantiate() as CPUParticles2D
			explosion_instance.emitting = true
			add_child(explosion_instance)
			$Sprite2D.visible = false
			alive = false
			#self.queue_free()
	
	
