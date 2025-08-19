extends Sprite2D

var speed = 400
var angular_speed = PI

func _init(): # _init() is called when the object is first created in memory
	print("Hello Godot!")

func _ready(): #_ready() is called when the object is fully initialized
	var timer = get_node("Timer") #The get_node(name) function searches for child nodes of the current node by the same name
	timer.timeout.connect(_on_timer_timeout)
	
func _process(delta): #_process(delta) is called every frame, Godot passes in delta the time since the last fram was rendered
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta


func _on_button_pressed():
	set_process(not is_processing())

func _on_timer_timeout():
	visible = not visible
