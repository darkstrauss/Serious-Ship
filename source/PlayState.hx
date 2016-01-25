package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import openfl.Assets;

class PlayState extends FlxState
{
	// Makes the eventDiscription, eventName and giantFile in order to use it later on in the class.
	public static var eventName:String;
	public static var giantFile:String;
	public static var eventDisctiption:String;
	public static var informationScreen:String;
	public static var wrongFeedback:String;
	public static var rightFeedback:String;
	public static var feedbackScreen:String;
	
	// Let us use the variable in the Stats class in order to change it throughout the game
	var _instance:Stats = Stats.getinstance();
	var healthDisplay:FlxSprite;
	
	// Makes the variables of button in order to cahnge them within the class.
	var _pull:FlxButton;
	var _push:FlxButton;
	var _lift:FlxButton;
	var _continue:FlxButton;
	var _level:FlxButton;
	var _start:FlxButton;
	var _feedBack:FlxButton;
	var _wrongFeedback:FlxButton;
	var _rightFeedback:FlxButton;
	
	override public function create():Void
	{	
		super.create();	
		
		// Draws the image, by using the path from events that is named giantFile. This is the event you are in now.
		var event = new FlxSprite();
		event.loadGraphic(giantFile);
		
		// Creates the infrormation screen for the event.
		_start = new FlxButton(0, 0, null, placeEventButtons);
		_start.loadGraphic(informationScreen);
		
		// Adds the information screen for the event and the discription of the event.
		add(event);
		add(_start);
	}

	
	// Create the buttons and place them on the screen.
	function placeEventButtons()
	{	
		// Removes the description of the event.
		remove(_start);
		
		// Makes a continue button since you want to continue if you have the right answer.
		_continue = new FlxButton(Main.gameWidth / 2, 0, "Continue", continueLevel);
		
		// If you used the wrong answer you have to go back to the level.
		_level = new FlxButton(Main.gameWidth / 2, 30, "Back to level", continueLevel);
		
		// Creates the buttons and adds the position + what it should do when you click on it.
		// When the button is clicked it goes to the right compare function and gives it a string in order to compare it with the event.
		_push = new FlxButton(400, 0, null, pushCompare);
		_pull = new FlxButton(600, 0, null, pullCompare);
		_lift = new FlxButton(800, 0, null, liftCompare);
		_push.loadGraphic("img/buttons/Duwen.png");
		_pull.loadGraphic("img/buttons/Trekken.png");
		_lift.loadGraphic("img/buttons/Tillen.png");
		
		// For each level add the events in there.
		add(_push);
		add(_pull);
		add(_lift);
		
		MouseEventManager.add(_push, null, null, onMouseOver, onMouseOut);
		MouseEventManager.add(_pull, null, null, onMouseOver, onMouseOut);
		MouseEventManager.add(_lift, null, null, onMouseOver, onMouseOut);
		
	}
	
	private function onMouseOver(sprite:FlxButton)
	{
		sprite.color = FlxColor.AQUAMARINE;
	}
	
	private function onMouseOut(sprite:FlxButton)
	{
		sprite.color = FlxColor.WHITE;
	}
	
	function pullCompare()
	{	
		var choice:String = "pull"; 
		compareSelection(choice);
	}
	
	function pushCompare()
	{
		var choice:String = "push";
		compareSelection(choice);
	}
	
	function liftCompare()
	{
		var choice:String = "lift";
		compareSelection(choice);
	}
	
	function compareSelection(choice)
	{	
		// Removes the older buttons.
		remove(_lift);
		remove(_push);
		remove(_pull);
		
		MouseEventManager.remove(_lift);
		MouseEventManager.remove(_push);
		MouseEventManager.remove(_pull);
		
		// eventName is the right answer for this event got from the class Events.
		if (choice ==  eventName)
		{	
			EventState.getEventType(eventName);
			EventState.passFile(giantFile);
			EventState.rightEventFeedback(rightFeedback);
			Main.changeState("EventState");
		}
		
		// If its wrong.
		else
		{	
			wrongAnswer();
		}
	}
	
	function wrongAnswer()
	{	
		// Removes 1 hp if you choose the wrong answer.
		_instance.health -= 1;
		
		// Display the feedbackscreen.
		_wrongFeedback = new FlxButton(0,0, continueLevel);
		_wrongFeedback.loadGraphic(wrongFeedback);
		add(_wrongFeedback);
	}

	// You finished the event so you go back to the level.
	function continueLevel()
	{
		Main.changeState("Hub");
	}
	
	public static function getEventInformationScreen(d:String)
	{
		informationScreen = d;
	}

	override public function destroy():Void
	{
		super.destroy();
	}
	
	override public function update():Void
	{	
		super.update();
		
		switch (_instance.health) 
		{	
			case 4:
				drawHealth("img/Heart1.png");
			case 3:
				drawHealth("img/Heart2.png");
			case 2:
				drawHealth("img/Heart3.png");
			case 1:
				drawHealth("img/Heart4.png");
			case 0:
				{
					_instance.health += 4;
					Main.changeState("DeathScreen");
				}
		}
	}
	
	function drawHealth(health:String)
	{	healthDisplay = new FlxSprite();
		healthDisplay.loadGraphic(health);
		add(healthDisplay);
	}
	
	// Gets the eventName from Events.
	public static function getEventName(a:String):Void 
	{
		eventName = a;
	}
	
	// Gets the giantFile from Events.
	public static function getEventGraphics(b:String ):Void
	{
		giantFile = b;
	}
	
	public static function getWrongFeedback(d:String):Void
	{
		wrongFeedback = d;
	}
	
	public static function getRightFeedback(e:String):Void
	{
		rightFeedback = e;
	}
}