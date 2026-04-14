class_name laser extends CharacterBody2D


@export var speed = 1000

func _physics_process(delta: float) -> void:
	position.y -= delta * speed
