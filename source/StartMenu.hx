package ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import openfl.Assets;
import flixel.FlxSprite;
import openfl.display.Sprite;
import flixel.plugin.MouseEventManager;
import flash.events.MouseEvent;


class StartMenu extends FlxState
{	
	// These are the clickable objects for the starting menu.
	var _mainMenu:FlxButton;
	var _play:FlxButton;
	var _howToPlay:FlxButton;
	var _steave:FlxButton;
	var _eave:FlxButton;
	var _choose:FlxSprite;
	
	var _instance:Stats = Stats.getinstance();
	
	
	override public function create():Void
	{
		super.create();
		
		drawBackDrop();
		
		placeObjects();
	}
	
	
	function drawBackDrop()
	{
		var backdrop = new FlxSprite();
		backdrop.loadGraphic("img/menu/menu room empty.png");
		add(backdrop);
	}
	
	// Creates and places the clickable objects.
	function placeObjects()
	{
		// Creating the clickable objects with the sprite to the screen.
		_play = new FlxButton(450, 150, chooseHero);
		
		_mainMenu = new FlxButton(1000, 150, achievements);
		_howToPlay = new FlxButton(60, 105, howToPlay);
		
		// Load Graphics of the buttons.
		_howToPlay.loadGraphic("img/menu/speluitleg.png");
		_mainMenu.loadGraphic("img/menu/skuixoniabutton.png");
		_play.loadGraphic("img/menu/teleporter.png");
		
		// Adds the clickable object
		add(_mainMenu);
		add(_play);
		add(_howToPlay);
		
		MouseEventManager.add(_mainMenu, null, null, onMouseOver, onMouseOut, true);
		MouseEventManager.add(_play, null, null, onMouseOver, onMouseOut, true);
		MouseEventManager.add(_howToPlay, null, null, onMouseOver, onMouseOut, true);
	}
	
	function chooseHero()
	{
		_steave = new FlxButton(620, 160, steave);
		_steave.loadGraphic("img/menu/pickSteave.png");	
		
		_eave = new FlxButton(500, 200, eave);
		_eave.loadGraphic("img/menu/pickEave.png");
		
		_choose = new FlxSprite();
		_choose.loadGraphic("img/menu/pickHero.png");
		
		
		add(_eave);
		add(_steave);
		add(_choose);
		
		MouseEventManager.add(_eave, null, null, onMouseOver, onMouseOut);
		MouseEventManager.add(_steave, null, null, onMouseOver, onMouseOut);
	}
	
	private function onMouseOver(sprite:FlxButton)
	{
		sprite.color = FlxColor.AQUAMARINE;
	}
	
	private function onMouseOut(sprite:FlxButton)
	{
		sprite.color = FlxColor.WHITE;
	}
	
	function steave()
	{
		_instance.gender = 0;
		startGame();
	}
	
	function eave()
	{
		_instance.gender = 1;
		startGame();
	}
	
	
	
	// Changes the state to achievements and goes to the achievement class.
	function achievements()
	{	
		FlxG.sound.destroy(true);
		Main.changeState("BeginScreen");
	}
	
	function startGame()
	{	
		FlxG.sound.destroy(true);
	    Main.changeState("Hub");
	}
	
	function howToPlay()
	{	
		Main.changeState("howToPlay");
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