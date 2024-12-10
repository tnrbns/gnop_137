extends Sprite2D

var frames = texture.get_width()/region_rect.size.x
# Called when the node enters the scene tree for the first time.
func _ready():
	var random_index = randi_range(1, frames)
	region_rect.position.x = random_index * region_rect.size.x
	print("i used:", region_rect.position.x)


# blank = 0
# 1 = 455
# 2 = 910
# 3 = 1365
# 4 = 1820
# 5 = 2275
# 6 = 2730
