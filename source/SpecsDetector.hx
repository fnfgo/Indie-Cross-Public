package;

import flixel.FlxG;
import flixel.FlxState;
class SpecsDetector extends FlxState
{
	override public function create()
	{
		KadeEngineData.initSave();
		super.create();

		FlxG.switchState(new Caching());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
