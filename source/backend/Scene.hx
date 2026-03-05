package backend;

import backend.Logging.LogType;
import backend.Logging.Logger;
import lime.utils.Assets;
import haxe.Json;

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
			Logger.error('PARSING ERROR', 'Error parsing scene: "${scene}": $e', LogType.SCENE);
			return {};
		}

		Logger.log('Parsed scene: $scene', LogType.SCENE);

		return sceneData;
	}
}
