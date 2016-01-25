package;

import flixel.FlxState;
import flixel.ui.FlxButton;

class DeathScreen extends FlxState
{
	var _back:FlxButton;

	override public function create():Void
	{
		super.create();
		// Creates the go back button.
		_back = new FlxButton(0, 0, null, goBack);
		_back.loadGraphic("img/gameOver.png");
		
		// Adds the go back button.
		add(_back);
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