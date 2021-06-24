package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R7R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R8R6tgoR2i1143976R3y5:MUSICR5y30:assets%2Fmusic%2FTapTroupe.oggy9:pathGroupaR10hR6tgoR2i9146R3y5:SOUNDR5y31:assets%2Fsounds%2FgroupKay1.oggR11aR13hR6tgoR2i9427R3R12R5y31:assets%2Fsounds%2FgroupKay2.oggR11aR14hR6tgoR2i10241R3R12R5y31:assets%2Fsounds%2FgroupKay3.oggR11aR15hR6tgoR2i4957R3R12R5y30:assets%2Fsounds%2FgroupOh1.oggR11aR16hR6tgoR2i4955R3R12R5y30:assets%2Fsounds%2FgroupOh2.oggR11aR17hR6tgoR2i5273R3R12R5y30:assets%2Fsounds%2FgroupOh3.oggR11aR18hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R19R6tgoR2i5090R3R12R5y29:assets%2Fsounds%2FtapAnd1.oggR11aR20hR6tgoR2i4927R3R12R5y29:assets%2Fsounds%2FtapAnd2.oggR11aR21hR6tgoR2i5232R3R12R5y29:assets%2Fsounds%2FtapDun1.oggR11aR22hR6tgoR2i5264R3R12R5y29:assets%2Fsounds%2FtapDun2.oggR11aR23hR6tgoR2i4995R3R12R5y28:assets%2Fsounds%2FtapEnd.oggR11aR24hR6tgoR2i5826R3R12R5y29:assets%2Fsounds%2FtapMiss.oggR11aR25hR6tgoR2i6725R3R12R5y31:assets%2Fsounds%2FtapReady1.oggR11aR26hR6tgoR2i4852R3R12R5y31:assets%2Fsounds%2FtapReady2.oggR11aR27hR6tgoR2i5889R3R12R5y30:assets%2Fsounds%2FtapStep1.oggR11aR28hR6tgoR2i10368R3R12R5y30:assets%2Fsounds%2FtapStep2.oggR11aR29hR6tgoR2i5069R3R12R5y29:assets%2Fsounds%2FtapTap1.oggR11aR30hR6tgoR2i4965R3R12R5y29:assets%2Fsounds%2FtapTap2.oggR11aR31hR6tgoR2i2114R3R9R5y26:flixel%2Fsounds%2Fbeep.mp3R11aR32y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R9R5y28:flixel%2Fsounds%2Fflixel.mp3R11aR34y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R12R5R33R11aR32R33hgoR2i33629R3R12R5R35R11aR34R35hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R36R37y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3y5:IMAGER5R42R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R43R5R44R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_taptroupe_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_groupkay1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_groupkay2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_groupkay3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_groupoh1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_groupoh2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_groupoh3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapand1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapand2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapdun1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapdun2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapend_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapmiss_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapready1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapready2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapstep1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tapstep2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_taptap1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_taptap2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/TapTroupe.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_taptroupe_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/groupKay1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_groupkay1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/groupKay2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_groupkay2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/groupKay3.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_groupkay3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/groupOh1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_groupoh1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/groupOh2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_groupoh2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/groupOh3.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_groupoh3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapAnd1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapand1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapAnd2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapand2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapDun1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapdun1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapDun2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapdun2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapEnd.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapend_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapMiss.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapmiss_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapReady1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapready1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapReady2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapready2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapStep1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapstep1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapStep2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tapstep2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapTap1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_taptap1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/tapTap2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_taptap2_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
