package;

import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.events.Event;
#if desktop
import vlc.VlcBitmap;
#end

// THIS IS FOR TESTING
// DONT STEAL MY CODE >:(
class VideoHandler
{
	public var finishCallback:Void->Void;
	public var stateCallback:FlxState;
    #if desktop
	public var bitmap:VlcBitmap;
	#end

	public var sprite:FlxSprite;

	public var fadeToBlack:Bool = false;

	public var fadeFromBlack:Bool = false;

	public var allowSkip:Bool = false;

	public function new()
	{
		FlxG.autoPause = false;
	}

	public function playMP4(path:String, ?repeat:Bool = false, ?outputTo:FlxSprite = null, ?isWindow:Bool = false, ?isFullscreen:Bool = false,
			?midSong:Bool = false):Void
	{
		#if desktop
		if (!midSong)
		{
			if (FlxG.sound.music != null)
			{
				FlxG.sound.music.stop();
			}
		}

		bitmap = new VlcBitmap();
		bitmap.set_height(FlxG.stage.stageHeight);
		bitmap.set_width(FlxG.stage.stageHeight * (16 / 9));

		trace("Setting width to " + FlxG.stage.stageHeight * (16 / 9));
		trace("Setting height to " + FlxG.stage.stageHeight);

		bitmap.onVideoReady = onVLCVideoReady;
		bitmap.onComplete = onVLCComplete;
		bitmap.onError = onVLCError;

		FlxG.stage.addEventListener(Event.ENTER_FRAME, update);
		FlxG.stage.addEventListener(Event.ENTER_FRAME, fixVolume);
		fixVolume(null);

		if (repeat)
			bitmap.repeat = -1;
		else
			bitmap.repeat = 0;

		bitmap.inWindow = isWindow;
		bitmap.fullscreen = isFullscreen;

		FlxG.addChildBelowMouse(bitmap);
		bitmap.play(checkFile(path));

		if (outputTo != null)
		{
			// lol this is bad kek
			bitmap.alpha = 0;

			sprite = outputTo;
		}
		#end
	}

	/////////////////////////////////////////////////////////////////////////////////////

	function onVLCVideoReady()
	{
		trace("video loaded!");

		#if cpp
		if (sprite != null)
			sprite.loadGraphic(bitmap.bitmapData);
		#end

		if (fadeFromBlack)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0, false);
		}
	}

	function fixVolume(e:Event)
	{
		#if cpp
		bitmap.volume = 0;
		if (!FlxG.sound.muted && FlxG.sound.volume > 0.01) 
		{
			bitmap.volume = FlxG.sound.volume * 0.5 + 0.5;
		}
		#end
	}

	public function onVLCComplete()
	{
		#if cpp
		bitmap.stop();

		// Clean player, just in case! Actually no.

		if (fadeToBlack)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0, false);
		}

		if (fadeFromBlack)
		{
			FlxG.camera.fade(FlxColor.BLACK, 1, true);
		}

		trace("Big, Big Chungus, Big Chungus!");

		new FlxTimer().start(0.3, function(tmr:FlxTimer)
		{
			if (finishCallback != null)
			{
				finishCallback();
			}
			else if (stateCallback != null)
			{
				LoadingState.loadAndSwitchState(stateCallback);
			}

			bitmap.dispose();

			if (FlxG.game.contains(bitmap))
			{
				FlxG.game.removeChild(bitmap);
			}
		});
		#end
	}

	public function kill()
	{
		#if cpp
		bitmap.stop();

		if (finishCallback != null)
		{
			finishCallback();
		}

		bitmap.visible = false;
		#end
	}

	function onVLCError()
	{
		if (finishCallback != null)
		{
			finishCallback();
		}
		else if (stateCallback != null)
		{
			LoadingState.loadAndSwitchState(stateCallback);
		}
	}

	function update(e:Event)
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			trySkip();
		}
		
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.B)
			{
				trySkip();
			}
		}
        #if cpp
		bitmap.volume = FlxG.sound.volume + 0.3; // shitty volume fix. then make it louder.

		if (FlxG.sound.volume <= 0.1)
			bitmap.volume = 0;
		#end
	}

	function trySkip()
	{
		#if cpp
		if (allowSkip)
		{
			if (bitmap.isPlaying)
			{
				onVLCComplete();
			}
		}
		#end
	}
}
