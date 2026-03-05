package backend;

import lime.app.Application;

class LogType
{
	public static final SCENE:LogType = new LogType('[SCENE] ', '[SCENE] ');

	public var logPrefix:String = '';
	public var errorPrefix:String = '';

	public function new(?logPrefix:String, ?errorPrefix:String)
	{
		this.logPrefix = logPrefix ?? '';
		this.errorPrefix = errorPrefix ?? '';
	}
}

class Logger
{
	public static function log(d:Dynamic, type:LogType)
	{
		trace('${type.logPrefix ?? ''}$d');
	}

	public static function error(e:String, d:Dynamic, type:LogType)
	{
		log(d, type);
		Application.current.window.alert(d, '${type.errorPrefix ?? ''}$e');
	}
}
