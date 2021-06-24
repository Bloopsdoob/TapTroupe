package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var Shittext:FlxText;
	
	override public function create()
	{
		FlxG.sound.playMusic(AssetPaths.TapTroupe__ogg, 1, false);
		Shittext = new FlxText(5, 5, 0, "", 16);
		add(Shittext);
		super.create();
	}
	
	override public function update(elapsed:Float)
	{
		Metronome.songPosition = FlxG.sound.music.time;
		Metronome.metronomeUpdate();
		Shittext.text = 'curbeat: ' + Metronome.curBeatPoly + '|' + Metronome.curBeat;
		super.update(elapsed);
	}
}
