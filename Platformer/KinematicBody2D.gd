extends KinematicBody2D
#this script controls movement
#gd script is like python, don't need semicolons !!


#UP tells the game which way is up, that being, negative 1
const UP = Vector2(0, -1)
#motion , changes x and y values of our character
var motion = Vector2()
export var x_speed = 200
export var gravity = 40
export var jump_force = -400

func _physics_process(delta):
	#apply motion if user presses a button
	
	motion.y += gravity
	
	if Input.is_action_pressed('ui_right'):
		#ui_right is bound to right arrow key
		motion.x = x_speed
		#x increases by 100 pixels to the right
		#now we have to pplay motion to the physics object
		
	elif Input.is_action_pressed('ui_left'):
		#ui_left is bound to left arrow key
		motion.x = -1*x_speed
		
	else:
		#to top when a button is not being pressed
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			motion.y = jump_force
			
	#you must set motion equal to move and slide
	motion = move_and_slide(motion, UP)

