package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import openfl.Assets;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.system.FlxSound;

class MainMenu extends FlxState
{
	// These are the clickable buttons for the main menu.
	var _newGame:FlxButton;
	var _credits:FlxButton;
	
	override public function create():Void
	{
		super.create();
		
		drawBackDrop();
		
		placeButtons();
		
		FlxG.sound.playMusic("music/menu1uncut.wav", 1, true);
	}
	
	
	// Places all the buttons needed for the main menu.
	function placeButtons()
	{	
		
		// Creating all the clickable buttons for the menuscreen.
		_newGame = new FlxButton(Main.gameWidth / 2, 120, null, newgame);
		_credits = new FlxButton(Main.gameWidth / 2, 190, null, credits);
		_newGame.loadGraphic("img/buttons/Start.png");
		_credits.loadGraphic("img/buttons/Credits.png");
		// Adds the clickable buttons.
		add(_newGame);
		add(_credits);
		
		MouseEventManager.add(_newGame, null, null, onMouseOver, onMouseOut);
		MouseEventManager.add(_credits, null, null, onMouseOver, onMouseOut);
	}
	
	private function onMouseOver(sprite:FlxButton)
	{
		sprite.color = FlxColor.AQUAMARINE;
	}
	
	private function onMouseOut(sprite:FlxButton)
	{
		sprite.color = FlxColor.WHITE;
	}
	
	function drawBackDrop()
	{
		var backdrop = new FlxSprite();
		backdrop.loadGraphic("img/mainMenu.png");
		add(backdrop);
	}
	
	function newgame()
	{	
		FlxG.sound.destroy(true);
		Main.changeState("StartMenu");
	}
	
	function loadGame()
	{
		Main.changeState("LoadGame");
	}
	
	function credits()
	{
		Main.changeState("Credits");
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	
}