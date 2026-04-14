extends Node2D

const enemy = preload("res://Scene/enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var timer = Timer.new()
	timer.one_shot = false
	timer.timeout.connect(createEnemy)
	add_child(timer)
	timer.start(4)
	timer.add_to_group("dtimers")
	var timer2 = Timer.new()
	timer2.one_shot = true
	timer2.timeout.connect(createEnemyDifferent)
	add_child(timer2)
	timer2.start(6)
	timer2.add_to_group("dtimers")
	pass # Replace with function body.

func createEnemy():
	var enemy_instance = enemy.instantiate()
	enemy_instance.enemyType = 0
	add_child(enemy_instance)
	pass
func createEnemyDifferent():
	var enemy_instance = enemy.instantiate()
	enemy_instance.enemyType = 2
	add_child(enemy_instance)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
