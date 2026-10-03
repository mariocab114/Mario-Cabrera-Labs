extends Sprite2D

# EXPORTED VARIABLES
# @export makes these show up in the Inspector, so you can change them
# without touching the code.
@export var speed: float = 300.0
@export var highlight_color: Color = Color.YELLOW


func _process(delta: float) -> void:
	var direction := Vector2.ZERO

	# USER INPUT + CONDITIONAL LOGIC
	# Arrow keys move the player left/right and up/down.
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1

	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1

	position += direction * speed * delta

	# Holding Space changes the color, otherwise it goes back to normal.
	if Input.is_key_pressed(KEY_SPACE):
		modulate = highlight_color
	else:
		modulate = Color.WHITE

	# Holding the left mouse button makes the player spin.
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		rotation += 5.0 * delta
