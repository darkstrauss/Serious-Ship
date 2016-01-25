package;
import flixel.FlxState;
import flixel.ui.FlxButton;

class Achievements extends FlxState
{
	var _back:FlxButton;

	override public function create():Void
	{
		super.create();
		
		// Creates the go bakc button.
		_back = new FlxButton(Main.gameWidth / 2, Main.gameHeight - 40, "Back", goBack);
		
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
	
	// Goes back to the starting menu.
	function goBack()
	{
		Main.changeState("StartMenu");
	}
}