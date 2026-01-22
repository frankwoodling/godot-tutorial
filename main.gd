extends Node
@export var mob_scene: PackedScene

var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_hit() -> void:
	pass # Replace with function body.

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_mob_timer_timeout() -> void:
	# new instance of mob scene
	var mob = mob_scene.instantiate()
	
	# choose a random location on Path2D
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()
	
	# set mob's position to the new random location
	mob.position = mob_spawn_location.position
	
	# set mobsa direction perpendicular to path direction
	var direction = mob_spawn_location.rotation + PI / 2
	
	# add randomness to direction
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# choose velocity for the mob
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	# spawn mob by adding to main scene
	add_child(mob)


func _on_start_timer_timeout() -> void:
	pass # Replace with function body.


func _on_score_timer_timeout() -> void:
	pass # Replace with function body.
