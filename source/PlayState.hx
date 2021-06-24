package;

import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState
{
	override public function create()
	{
		FlxG.sound.playMusic(AssetPaths.TapTroupe__ogg, 1, false);
		super.create();
	}
	
	override public function update(elapsed:Float)
	{
		Metronome.songPosition = FlxG.sound.music.time;
		Metronome.metronomeUpdate();
		super.update(elapsed);
	}
}
