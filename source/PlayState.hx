package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var Shittext:FlxText;
	static var noteTapped:Float = 0;
	static var lol:Float = 0;
	
	override public function create()
	{
		FlxG.sound.playMusic(AssetPaths.TapTroupe__ogg, 0.25, false);
		Shittext = new FlxText(5, 5, 0, "", 16);
		add(Shittext);
		super.create();
	}
	
	override public function update(elapsed:Float)
	{
		Metronome.songPosition = FlxG.sound.music.time;
		Metronome.metronomeUpdate();		
		Shittext.text = 'h : ' +  Metronome.curBeat + '|' + (Metronome.curBeat%4) + '|' + Metronome.polyCount + '|' + Metronome.readyCount + '|' + Metronome.curStep;
		
		super.update(elapsed);
	}
}
