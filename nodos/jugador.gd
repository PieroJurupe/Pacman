extends CharacterBody2D

@export var speed : float
@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D

func _process(delta):
	motion_ctrl()

func motion_ctrl() -> void:
	velocity.x = GLOBAL.get_axis().x * speed
	velocity.y = GLOBAL.get_axis().y * -speed
	
	if velocity.x != 0:
		velocity.y = 0  # Si se mueve horizontalmente, ignorar el eje Y
	elif velocity.y != 0:
		velocity.x = 0  # Si se mueve verticalmente, ignorar el eje X
	
	if velocity.x != 0 or velocity.y != 0:
		if velocity.y < 0:  # Arriba
			sprite_2d.rotation_degrees = -90
		elif velocity.y > 0:  # Abajo
			sprite_2d.rotation_degrees = 90
		elif velocity.x < 0:  # Izquierda
			sprite_2d.rotation_degrees = 180
		elif velocity.x > 0:  # Derecha
			sprite_2d.rotation_degrees = 0

	animation_player.play("moverse")
	move_and_slide()
	
