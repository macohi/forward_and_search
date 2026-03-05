package backend;

import lime.utils.Assets;
import haxe.Json;
import lime.app.Application;

typedef SceneData = {}

class SceneManager
{
	public static function getScene(scene:String):SceneData
	{
		var sceneData:SceneData = {};

		try
		{
			sceneData = Json.parse(Assets.getText('assets/data/scenes/$scene.json'));
		}
		catch (e)
		{
			Application.current.window.alert('Error parsing scene: ${scene}\n\n${e}', 'SCENEMANAGER : PARSING ERROR');
			return {};
		}

		trace('Parsed scene: $scene');

		return sceneData;
	}
}
