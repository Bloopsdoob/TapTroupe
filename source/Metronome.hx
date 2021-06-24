import flixel.FlxG;
import flixel.system.FlxSound;

class Metronome
{
	public static var bpm:Int = 120;
	public static var crochet:Float = ((60 / bpm) * 1000);
	public static var stepCrochet:Float = crochet / 4;
	public static var stepCrochetPoly:Float = crochet / 4;
	public static var songPosition:Float;
	public static var lastSongPos:Float;
	public static var safeZone:Float = 0.125;
	
	public static var curBeat:Int = 0;
	public static var curBeatPoly:Int = 0;
	public static var curStep:Int = 0;
	public static var curStepPoly:Int = 0;
	public static var oldStep:Int = 0;
	public static var oldStepPoly:Int = 0;
	
	public static var readyCount:Int = 0;
	public static var polyCount:Int = 0;
	public static var polyCountStart:Int = 0;
		
	public static function metronomeUpdate():Void
	{
		oldStep = curStep;
		oldStepPoly = curStepPoly;

		curStep = Math.floor(songPosition / stepCrochet);
		curBeat = Math.floor(curStep / 4);
		curStepPoly = Math.floor(songPosition / stepCrochetPoly);
		curBeatPoly = Math.floor(curStep / 3);
		
		if (oldStep != curStep && curStep > 0)
			stepHit();
		if (oldStepPoly != curStepPoly && curStepPoly > 0)
			stepHitPoly();
			
	}
	public static function stepHit():Void
	{
		if (curStep % 4 == 0)
			beatHit();
	}
	
	public static function stepHitPoly():Void
	{
		if (curStepPoly % 3 == 0)
			beatHitPoly();
	}
	public static function beatHitPoly():Void
	{
		if (polyCount > 1)
		{

			if (polyCount % 2 == 0)
			{
				if (polyCount >= 4)
				{
					FlxG.sound.play(AssetPaths.tapDun1__ogg, 1, false);
				}
				else
				{
					FlxG.sound.play(AssetPaths.tapTap2__ogg, 1, false);
				}
			}
			else
			{
				if (polyCount >= 4)
				{
					FlxG.sound.play(AssetPaths.tapDun2__ogg, 1, false);
				}
				else
				{
					FlxG.sound.play(AssetPaths.tapTap1__ogg, 1, false);
				}
			}
			polyCount--;
			for (i in 0...3)
			{
				var step:FlxSound = FlxG.sound.load(AssetPaths.tapStep1__ogg);
				step.pan = ((-0.5) + (i*0.5));
				step.volume = 0.25;
				step.play();
			}

		}		
	}

	public static function beatHit():Void
	{
		if (readyCount == 4)
			readyCount = 0;
			
		if (curBeat == 4)
		{
			FlxG.sound.play(AssetPaths.tapEnd__ogg, 1, false);
		}
		if ((curBeat > 4) && !(readyCount > 1))
		{
			for (i in 0...3)
			{
				var step:FlxSound = FlxG.sound.load(AssetPaths.tapStep1__ogg);
				step.pan = ((-0.5) + (i*0.5));
				step.volume = 0.25;
				step.play();
			}
		}
		if (curBeat == 14)
		{
			FlxG.sound.play(AssetPaths.tapReady1__ogg, 1, false);
			readyCount = 1;
		}
		if (curBeat == 15)
		{
			FlxG.sound.play(AssetPaths.tapReady2__ogg, 1, false);
			readyCount = 2;
		}
		if (curBeat == 16)
		{
			FlxG.sound.play(AssetPaths.tapAnd2__ogg, 1, false);
			readyCount = 3;
			polyCount = 6;
			polyCountStart = 6;
		}
		if ((polyCount == 1) && (curBeat % 4 == 0))
			{
			FlxG.sound.play(AssetPaths.tapEnd__ogg, 1, false);
			for (i in 0...3)
			{
				var step:FlxSound = FlxG.sound.load(AssetPaths.tapStep2__ogg);
				step.pan = ((-0.5) + (i*0.5));
				step.volume = 0.50;
				step.play();
			}
			polyCount = 0;
			readyCount = 4;
		}
	}
}
