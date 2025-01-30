extends Area2D

func _on_body_entered(body):
	if body.name == "jugador":
		queue_free()  # Elimina el punto cuando Pac-Man lo toca
