import flixel.FlxG;
import flixel.system.FlxSound;

class Metronome
{
	public static var bpm:Int = 120;
	public static var crochet:Float = ((60 / bpm) * 1000);
	public static var modifier:Int = 4;
	public static var songPosition:Float;
	public static var lastSongPos:Float;
	public static var safeZone:Float = 0.125;
	
	public static var curBeat:Int = 0;
	public static var curStep:Int = 0;
	public static var oldStep:Int = 0;
	
	public static var readyCount:Int = 0;
	public static var polyCount:Int = 0;
	
	public static function metronomeUpdate():Void
	{
		oldStep = curStep;
		var stepCrochet:Float = crochet / modifier;

		curStep = Math.floor(songPosition / stepCrochet);
		curBeat = Math.floor(curStep / modifier);
		
		if (oldStep != curStep && curStep > 0)
			stepHit();
			
	}
	public static function stepHit():Void
	{
		if (curStep % 4 == 0)
			beatHit();
	}

	public static function beatHit():Void
	{
		trace("BeatHit");
		if (curBeat == 4)
		{
			var start:FlxSound = FlxG.sound.load(AssetPaths.tapEnd__ogg);
			start.play();
		}
		if (curBeat > 4)
		and !(readyCount > 1)
		{
			for (i in 0...3)
			{
				var start:FlxSound = FlxG.sound.load(AssetPaths.tapStep1__ogg);
				start.pan = ((-0.5) + (i*0.5));
				start.volume = 0.25;
				start.play();
			}
		}
		if (curBeat == 11)
		{
			var start:FlxSound = FlxG.sound.load(AssetPaths.tapReady1__ogg);
			start.play();
			readyCount = 1;
		}
		if (curBeat == 12)
		{
			var start:FlxSound = FlxG.sound.load(AssetPaths.tapReady2__ogg);
			start.play();
			readyCount = 2;
		}
		if (curBeat == 14)
		{
			var start:FlxSound = FlxG.sound.load(AssetPaths.tapAnd1__ogg);
			start.play();
			readyCount = 0;
			modifier = 6;
		}
		
		if (modifier == 6)
		{
			polyCount++;
			if (polyCount <= 3)
			{
				if (polyCount % 2 == 0)
					var start:FlxSound = FlxG.sound.load(AssetPaths.tapDun1__ogg);
				else
					var start:FlxSound = FlxG.sound.load(AssetPaths.tapDun2__ogg);
				start.play();
			}
			if (polyCount > 3)
			{
				if (polyCount % 3 == 0)
					var start:FlxSound = FlxG.sound.load(AssetPaths.tapDun1__ogg);
				else
					var start:FlxSound = FlxG.sound.load(AssetPaths.tapDun2__ogg);
				start.play();
			}
		}
	}
}
