package backend;

import backend.Logging.LogType;
import backend.Logging.Logger;
import lime.utils.Assets;
import haxe.Json;

typedef SceneData = {
	portrait:String,
}

class SceneManager
{
	public static final DUMMY_SCENE:SceneData = {
		portrait: ''
	};

	public static function getScene(scene:String):SceneData
	{
		var sceneData:SceneData = DUMMY_SCENE;

		try
		{
			sceneData = Json.parse(Assets.getText('assets/data/scenes/$scene.json'));
		}
		catch (e)
		{
			Logger.error('PARSING ERROR', 'Error parsing scene: "${scene}": $e', LogType.SCENE);
			return DUMMY_SCENE;
		}

		Logger.log('Parsed scene: $scene', LogType.SCENE);

		return sceneData;
	}
}
