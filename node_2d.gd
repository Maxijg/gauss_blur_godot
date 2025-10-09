extends Sprite2D 

func _ready() -> void:
	var img = ImagenConBlur.new()
	img.load("res://dahlia-9659400_640.jpg")
	var tex = img.gauss_blur(9,5)
	tex.save_jpg("res://b.jpg")
	print(tex.get_pixel(100,100))
	texture = ImageTexture.create_from_image(tex)
