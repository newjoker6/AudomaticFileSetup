extends Node

var path = ""
var temp_path = "res://"


var File_Structure = {
	"Data":{
		"Textures": {
			"Actors": {
				
			},
			"Weapons": {
				
			},
			"Sky": {
				
			}
		},
		"Meshes": {
			"Actors": {
				
			},
			"Weapons": {
				
			},
		},
		"Scripts": {
			
		},
		"Sound": {
			
		},
		"Video": {
			
		},
		"Shaders": {
			
		}
	},
	"Mods":{
		
	}
}

func _ready():
	print("Bethesda Ready")


func _create_folders(path):
	if path == "":
		print("Missing path")
	
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		
		for key in File_Structure.keys():
				dir.make_dir("%s/%s" %[path, key])
		
		for folder in File_Structure["Data"].keys():
			dir.make_dir("%s/Data/%s" %[path, folder])
		
		for folder in File_Structure["Data"]["Textures"].keys():
			dir.make_dir("%s/Data/Textures/%s" %[path, folder])
			
		for folder in File_Structure["Data"]["Meshes"].keys():
			dir.make_dir("%s/Data/Meshes/%s" %[path, folder])


