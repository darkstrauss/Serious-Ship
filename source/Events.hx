package ;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;


class Events extends FlxState
{	
	// These variables are from the Hub class and are used in the eventpicker (draw) function in order to get the right event.
	public static var eventType:Int;
	public static var eventEnvironment:Int;
		
	public function new() 
	{
		super();
		
		draw();
	}
	
	// Picks the event you are at.
	public override function draw()
	{	
		//zoo event
		if (eventEnvironment == 0 && eventType == 0) 
		{
			// Sends the image path + the right answer to the event to the PlayState.
			PlayState.getEventGraphics("img/events/treeBranch.png");
			PlayState.getEventName("pull");
			PlayState.getEventInformationScreen("img/descriptions/treeBranchDescription.png");
			PlayState.getWrongFeedback("img/feedback/treebranchFeedbackNegative.png");
			PlayState.getRightFeedback("img/feedback/treebranchFeedbackPositive.png");
			
			// Changes the state to Playstate.
			Main.changeState("PlayState");
		}
		
		if (eventEnvironment == 0 && eventType == 1) 
		{	
			// Sends the image path + the right answer to the event to the PlayState.
			PlayState.getEventGraphics("img/events/monkeyz.png");
			PlayState.getEventName("push");
			PlayState.getEventInformationScreen("img/descriptions/monkeyDescription.png");
			PlayState.getWrongFeedback("img/feedback/monkeyFeedbackNegative.png");
			PlayState.getRightFeedback("img/feedback/monkeyFeedbackPositive.png");
			
			// Changes the state to Playstate.
			Main.changeState("PlayState");
		}
		
		if (eventEnvironment == 0 && eventType == 2) 
		{
				// Sends the image path + the right answer to the event to the PlayState.
			PlayState.getEventGraphics("img/events/seal.png");
			PlayState.getEventName("lift");
			PlayState.getEventInformationScreen("img/descriptions/sealDescription.png");
			PlayState.getWrongFeedback("img/feedback/sealFeedbackNegative.png");
			PlayState.getRightFeedback("img/feedback/sealFeedbackPositive.png");
			
			// Changes the state to Playstate.
			Main.changeState("PlayState");
		}
		
		if (eventEnvironment == 0 && eventType == 3) 
		{
			// Sends the image path + the right answer to the event to the PlayState.
			PlayState.getEventGraphics("img/events/penguin.png");
			PlayState.getEventName("push");
			PlayState.getEventInformationScreen("img/descriptions/penguinDescription.png");
			PlayState.getWrongFeedback("img/feedback/penguinFeedbackNegative.png");
			PlayState.getRightFeedback("img/feedback/penguinFeedbackPositive.png");
			
			// Changes the state to Playstate.
			Main.changeState("PlayState");
		}
		
		if (eventEnvironment == 0 && eventType == 4)
		{
			// Sends the image path + the right answer to the event to the PlayState.
			PlayState.getEventGraphics("img/events/pig.png");
			PlayState.getEventName("pull");
			PlayState.getEventInformationScreen("img/descriptions/pigDescription.png");
			PlayState.getWrongFeedback("img/feedback/pigFeedbackNegative.png");
			PlayState.getRightFeedback("img/feedback/pigFeedbackPositive.png");
			
			// Changes the state to Playstate.
			Main.changeState("PlayState");
		}
		
		if (eventEnvironment == 0 && eventType == 5) 
		{
			// Sends the image path + the right answer to the event to the PlayState.
			PlayState.getEventGraphics("img/events/turtle.png");
			PlayState.getEventName("lift");
			PlayState.getEventInformationScreen("img/descriptions/turtleDescription.png");
			PlayState.getWrongFeedback("img/feedback/turtleFeedbackNegative.png");
			PlayState.getRightFeedback("img/feedback/turtleFeedbackPositive.png");
			
			// Changes the state to Playstate.
			Main.changeState("PlayState");
		}
		
	}
	
	override function update()
	{
		
	}	
}