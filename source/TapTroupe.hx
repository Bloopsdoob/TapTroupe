import flixel.FlxG;
import flixel.system.FlxSound;

class TapTroupe extends Metronome
{
	override function beatHit()
	{
		super.beatHit();
		
		trace("BeatHit");
		if (Metronome.curBeat == 4)
		{
			var start:FlxSound = FlxG.sound.load(AssetPaths.tapEnd__ogg);
			start.play();
		}
		if (Metronome.curBeat > 4)
		{
			for (i in 0...3)
			{
				var start:FlxSound = FlxG.sound.load(AssetPaths.tapStep1__ogg);
				start.pan = ((-0.5) + (i*0.5));
				start.volume = 0.25;
				start.play();
			}
		}
			
	}
}
