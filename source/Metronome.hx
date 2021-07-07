import flixel.FlxG;
import flixel.system.FlxSound;

class Metronome
{
	public static var bpm:Int = 120;
	public static var crochet:Float = ((60 / bpm) * 1000);
	public static var stepCrochet:Float = crochet / 4;
	public static var songPosition:Float;
	public static var lastSongPos:Float;
	public static var safeZone:Float = 0.125;
	
	public static var curBeat:Int = 0;
	public static var curStep:Int = 0;
	public static var oldStep:Int = 0;
	
	public static var readyCount:Int = 0;
	public static var polyCount:Int = 0;
	public static var polyCountStart:Int = 0;
	
	public static var onOffBeat:Bool = false;
	public static var polyOffset:Int = 0;
	public static var polyTapOffset:Int = 0;
	
	public static function metronomeUpdate():Void
	{
		oldStep = curStep;
		curStep = Math.floor(songPosition / stepCrochet);
		curBeat = Math.floor(curStep / 4);
		
		if (oldStep != curStep && curStep > 0)
			stepHit();
	}
	public static function stepHit():Void
	{
		if (curStep % 4 == 0)
			beatHit();
			
		if ((curStep % 3 == polyOffset) && (polyCount > 1))
			beatHitPoly();
			
		if ((curStep % 4 == 2) && (onOffBeat))
			offBeatHit();
	}
	public static function beatHitPoly():Void
	{
		polyTapOffset = if((polyCountStart % 2 == 1) && (!(polyCount < 4))) 1 else 0;
		if (polyCount > 1)
		{
			if (polyCount % 2 == polyTapOffset)
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
	public static function offBeatHit():Void
	{
		polyCount = polyCountStart; //lol
		polyOffset = (curStep % 3);
		onOffBeat = false;
		beatHitPoly();
	}
	public static function startPoly(polyDuration:Int)
	{
		FlxG.sound.play(AssetPaths.tapReady1__ogg, 1, false);
		readyCount = 1;
		polyCountStart = polyDuration;
	}
	public static function polyUpdate():Void
	{
		readyCount++;
		switch (readyCount)
		{
			case 2:
				FlxG.sound.play(AssetPaths.tapReady2__ogg, 1, false);
			case 3:
				FlxG.sound.play(AssetPaths.tapAnd2__ogg, 1, false);
				onOffBeat = true;
		}
	}
	public static function beatHit():Void
	{
		switch (readyCount)
		{
			case 1|2:
				polyUpdate();
			case 4:
				readyCount = 0;
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
		
		if (curBeat == 4)
		{
			FlxG.sound.play(AssetPaths.tapEnd__ogg, 1, false);
		}
		if ((curBeat > 4) && !(readyCount > 2))
		{
			for (i in 0...3)
			{
				var step:FlxSound = FlxG.sound.load(AssetPaths.tapStep1__ogg);
				step.pan = ((-0.5) + (i*0.5));
				step.volume = 0.25;
				step.play();
			}
		}
		switch (curBeat)
		{
			case 14|46|78|190|222:
				startPoly(6);
			case 32|64|116|124|132|140|148|152|176|208:
				startPoly(3);
			case 156:
				startPoly(8);
			case 90|106:
				startPoly(11);
		}
	}
}
