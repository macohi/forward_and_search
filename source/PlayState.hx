package;

import backend.Scene;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var scene:SceneData = {};

	override public function new(?scene:String)
	{
		super();

		this.scene = SceneManager.getScene(scene);
	}

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
