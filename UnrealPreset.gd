extends Node

var path = ""
var temp_path = "res://"


var File_Structure = {
	"Content":{
		"Maps":{
			"Episode":{},
			"TestMaps":{}
		},
		"Base":{},
		"Characters":{
			"NPC":{},
			"Player":{},
		},
		"Dev":{},
		"Effects":{},
		"Environment":{
			"Background":{},
			"Buildings":{},
			"Foliage":{},
			"Props":{},
			"Sky":{},
			"Landscape":{},
			"Water":{}
		},
		"Gameplay":{},
		"PostProcess":{},
		"Sound":{},
		"UI":{},
		"Vehicles":{},
		"Weapons":{}
	}
}

func _ready():
	print("Unreal Ready")


func _create_folders(path):
	if path == "":
		print("Missing path")
	
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		
		for key in File_Structure.keys():
				dir.make_dir("%s/%s" %[path, key])
		
		for folder in File_Structure["Content"].keys():
			dir.make_dir("%s/Content/%s" %[path, folder])
		
		for folder in File_Structure["Content"]["Maps"].keys():
			dir.make_dir("%s/Content/Maps/%s" %[path, folder])
			
		for folder in File_Structure["Content"]["Characters"].keys():
			dir.make_dir("%s/Content/Characters/%s" %[path, folder])
		
		for folder in File_Structure["Content"]["Environment"].keys():
			dir.make_dir("%s/Content/Environment/%s" %[path, folder])


