extends Node

var path = ""
var temp_path = "res://"


var File_Structure = {
	"Assets":{
		"Editor":{},
		"Resources":{},
		"Plugins":{},
		"Extensions":{},
		"Scenes":{},
		"Scripts":{},
		"StaticAssets":{
			"Animations":{},
			"Animators":{},
			"Effects":{},
			"Fonts":{},
			"Materials":{},
			"Models":{},
			"Prefabs":{},
			"Shaders":{},
			"Sounds":{},
			"Sprites":{},
			"Textures":{},
			"Videos":{}
		}
	}
}

func _ready():
	print("Unity Ready")


func _create_folders(path):
	if path == "":
		print("Missing path")
	
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		
		for key in File_Structure.keys():
				dir.make_dir("%s/%s" %[path, key])
		
		for folder in File_Structure["Assets"].keys():
			dir.make_dir("%s/Assets/%s" %[path, folder])
		
		for folder in File_Structure["Assets"]["StaticAssets"].keys():
			dir.make_dir("%s/Assets/StaticAssets/%s" %[path, folder])


