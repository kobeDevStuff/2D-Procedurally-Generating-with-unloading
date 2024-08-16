extends RigidBody2D

@export_range(0,1000,0.1) var acceleration: float = 5
@export_range(0,1000, 0.1) var MAX_SPEED: float = 10


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var resultant: Vector2 = get_resultant(mouse_pos).normalized()

	state.apply_force(resultant * acceleration)
	
	state.linear_velocity.limit_length(MAX_SPEED)
	
	look_at(mouse_pos)

func get_resultant(mouse_pos: Vector2) -> Vector2:
	return (mouse_pos - global_position)
