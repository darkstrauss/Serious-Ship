package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import openfl.Assets;

class Credits extends FlxState
{
	var creditScreen:FlxButton;
	
	private var tween:FlxTween;

	override public function create():Void
	{
		super.create();
				
		createCreddits();
		
		tween = FlxTween.tween(creditScreen, { x: 0, y: - 5100 }, 30, { type:FlxTween.LOOPING});
		
	}
	
	function createCreddits()
	{
		// Crates the image for credit screen
		creditScreen = new FlxButton(0, 0, null, goBack);
		creditScreen.loadGraphic("img/credits.png");
		add(creditScreen);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}
	
	// Goes back to the main menu.
	function goBack()
	{
		Main.changeState("MainMenu");
	}
}