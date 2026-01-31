extends enemy_eye

func _ready():
	var connections = get_signal_connection_list("touched")
	for connection in connections:	
		print("Signal 'touched' is connected to: ", connection.callable.get_object())
