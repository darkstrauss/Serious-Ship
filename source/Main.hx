package;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.Lib;
import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxSprite;

class Main extends Sprite
{	
	// Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	public static var gameWidth:Int = 1280; 
	
	// Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	public static var gameHeight:Int = 768; 
	
	// The FlxState the game starts with.
	var initialState:Class<FlxState> = BeginScreen; 
	
	// If -1, zoom is automatically calculated to fit the window dimensions.
	var zoom:Float = -1; 
	
	// How many frames per second the game should run at.
	var framerate:Int = 60; 
	
	// Whether to skip the flixel splash screen that appears in release mode.
	var skipSplash:Bool = true; 
	
	// Whether to start the game in fullscreen on desktop targets
	var startFullscreen:Bool = false;
	
	public static var instance:Main = null;
	
	public static function main():Void
	{	
		Lib.current.addChild(new Main());
	}
	
	public function new() 
	{
		super();
		
		instance = this;
		
		if (stage != null) 
		{
			init();
		}
		else 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
	
	public static function getInstance():Main
	{
		return instance;
	}
	
	private function init(?E:Event):Void 
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		setupGame();
	}
	
	private function setupGame():Void
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		if (zoom == -1)
		{
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			zoom = Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}

		addChild(new FlxGame(gameWidth, gameHeight, initialState, zoom, framerate, framerate, skipSplash, startFullscreen));
		nextState();
	}
	
	function nextState()
	{
		changeState("BeginScreen");
	}
	
	// This function changes the gamestate of the game whenever you change it in the code by switching gamestate you 
	// go to another class. In the classes are create and destroy functions this means that the items created in those
	// Functions will be destroyed upon leaving the state.
	public static function changeState(next:String)
	{
		
		switch (next)
		{	
			case "BeginScreen": FlxG.switchState(new BeginScreen());
			case "MainMenu": FlxG.switchState(new MainMenu());
			case "Hub": FlxG.switchState(new Hub());
			case "StartMenu": FlxG.switchState(new StartMenu());
			case "howToPlay": FlxG.switchState(new HowToPlay());
			case "PlayState": FlxG.switchState(new PlayState());
			case "Credits": FlxG.switchState(new Credits());
			case "Achievements": FlxG.switchState(new Achievements());
			case "LoadGame": FlxG.switchState(new LoadGame());
			case "Events": FlxG.switchState(new Events());
			case "DeathScreen": FlxG.switchState(new DeathScreen());
			case "EventState": FlxG.switchState(new EventState());
		}
		
	}
}