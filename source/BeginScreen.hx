package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;

class BeginScreen extends FlxState
{	
	var film:FlxSprite;
	var film1:FlxSprite;
	var film2:FlxSprite;
	
	var i:Int = 0;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.sound.playMusic("music/Story.wav", 1, true);
		
		startFilm();
		new FlxTimer(20, nextScreen, 3);
	}
	
	function startFilm()
	{	
		
		film = new FlxSprite(0,0,"img/stars.png");		
		
		film1 = new FlxSprite(0, 0, "img/planet2.png");
		
		film2 = new FlxSprite(0, 0, "img/last planet.png");
		
		add(film2);
		add(film1);
		add(film);		
	}
	
	function nextScreen(timer:FlxTimer)
	{
		if (i == 0)
		{
			film.alpha = 0;
			trace(i);
		}
		
		if (i == 1)
		{
			film1.alpha = 0;
			trace(i);
		}
		
		if (i == 2)
		{
			film2.alpha = 0;
			FlxG.sound.destroy(true);
			Main.changeState("MainMenu");
		}
		
		i++;
		
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		if (FlxG.keys.justReleased.ESCAPE)
		{	
			FlxG.sound.destroy(true);
			Main.changeState("MainMenu");
		}
	}	
}