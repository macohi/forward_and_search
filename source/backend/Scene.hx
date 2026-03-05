package backend;

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
			error('PARSING ERROR', 'Error parsing scene: "${scene}": $e', SCENE);
			return DUMMY_SCENE;
		}

		log('Parsed scene: $scene', SCENE);
		for (field in Reflect.fields(sceneData))
		{
			trace(' * ${field} : ${Reflect.field(sceneData, field)}');
		}

		return sceneData;
	}
}
