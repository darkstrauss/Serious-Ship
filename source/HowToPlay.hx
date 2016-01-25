package;
import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import openfl.Assets;


class HowToPlay extends FlxState
{	
	var howtoplayScreen:FlxSprite;

	override public function create():Void
	{
		super.create();
		
		howtoplayScreen = new FlxSprite();
		howtoplayScreen.loadGraphic("img/howToPlay.png");
		add(howtoplayScreen);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
	
		
		//Mouse scrolling
		if (FlxG.keys.anyJustPressed(["RIGHT"]))
		{
			howtoplayScreen.x -= 1280; 
		}
		
		if (FlxG.keys.anyJustPressed(["LEFT"]))
		{
			howtoplayScreen.x += 1280; 
		}
		
		if (FlxG.keys.anyJustPressed(["ESCAPE"]))
		{
			goBack();
		}
		
		if (howtoplayScreen.x > 0)
		{
			howtoplayScreen.x = 0;
		}
		
		if (howtoplayScreen.x < - 2560)
		{
			howtoplayScreen.x = - 2560;
		}
		
	}
	
	function goBack()
	{
		Main.changeState("StartMenu");
	}
}