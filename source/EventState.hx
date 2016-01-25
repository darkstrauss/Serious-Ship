package;

import flixel.addons.nape.FlxNapeSprite;
import flixel.addons.nape.FlxNapeState;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import nape.callbacks.CbEvent;
import nape.callbacks.CbType;
import nape.callbacks.InteractionCallback;
import nape.callbacks.InteractionListener;
import nape.callbacks.InteractionType;
import flixel.addons.nape.FlxNapeSprite;
import nape.callbacks.PreCallback;
import nape.callbacks.PreFlag;
import nape.callbacks.PreListener;
import nape.constraint.DistanceJoint;
import nape.constraint.PivotJoint;
import nape.constraint.AngleJoint;
import nape.constraint.WeldJoint;
import nape.dynamics.InteractionFilter;
import nape.dynamics.InteractionGroup;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import flixel.util.FlxColor;
import openfl.geom.Point;

/**
 * ...
 * @author Alan Hart
 */
class EventState extends FlxNapeState
{	
	//
	var _instance:Stats = Stats.getinstance();
	var healthDisplay:FlxSprite;
	
	//space for the nape physics to act upon
	public static var space = FlxNapeState.space;
	
	//variables used for ease
	private var stageWidth:Int = 1280;
	private var stageHeight:Int = 768;
	
	//used to determine of the player is moving the ragdoll
	private var pressedABox:Bool = false;
	private var tempSpr:Dynamic;
	
	//screen that provides feedback to the player after an event
	private var feedbackScreen:FlxSprite;
	
	//ragdoll variables
	private var body:Body;
	public var picture:Ragdoll;
	
	//the current event on screen
	private var eventSpace:Dynamic;
	
	//size and position for the ragdoll's bounding boxes for the head and torso
	private var headAndTorsoSize:Point;	
	private var headAndTorsoPosition:Point;
	
	//size and position for the ragdoll's bounding boxes for the arms
	private var armSize:Point;
	private var armPosition:Point;
	
	//size and position for the ragdoll's bounding boxes for the legs
	private var legsSize:Point;
	private var legsPosition:Point;
	
	//event properties
	public static var eventName:String;
	public static var eventBackdrop:String;
	public static var goodFeedback:String;
	
	//location strings
	private var head:String;
	private var torso:String;
	private var upperArm:String;
	private var lowerArm:String;
	private var upperLeg:String;
	private var lowerLeg:String;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		//napeDebugEnabled = true;
		//FlxG.debugger.visible = true;
		
		trace(eventName);
		
		//if the player chooses steave
		if (_instance.gender == 0)
		{
			head = "img/ragdoll/headSteave.png";
			torso = "img/ragdoll/torsoSteave.png";
			upperArm = "img/ragdoll/upperArmSteave.png";
			lowerArm = "img/ragdoll/lowerArmSteave.png";
			upperLeg = "img/ragdoll/upperLegSteave.png";
			lowerLeg = "img/ragdoll/lowerLegSteave.png";
		}
		
		//is the player chooses eave
		if (_instance.gender == 1)
		{
			head = "img/ragdoll/headEave.png";
			torso = "img/ragdoll/torsoEave.png";
			upperArm = "img/ragdoll/upperArmEave.png";
			lowerArm = "img/ragdoll/lowerArmEave.png";
			upperLeg = "img/ragdoll/upperLegEave.png";
			lowerLeg = "img/ragdoll/lowerLegEave.png";
		}
		
		//adds a backdrop to the current stage
		var backDrop:FlxSprite = new FlxSprite(0, 0, eventBackdrop);
		add(backDrop);
		
		//determine event type and place the according event type
		if (eventName == "lift")
		{
			//adds the ragdoll to the stage and positions it
			picture = new Ragdoll(200, 325);
			
			//runs the init function of the ragdoll
			picture.init();
			
			//creates the ragdoll's graphics
			picture.createGraphics(head, torso, upperArm, lowerArm, upperLeg, lowerLeg);
			add(picture);
			
			//gets the necessary data to place the event's bounding boxes
			getData();
			
			//places the bounding boxes on the screen for the ragdoll to compare with
			eventSpace = new EventOne(headAndTorsoSize, headAndTorsoPosition, armSize, armPosition, legsSize, legsPosition, 1.3, this);
			add(eventSpace);
		}
		
		//determine event type and place the according event type
		if (eventName == "pull")
		{
			picture = new Ragdoll(200, 325);
			picture.init();
			picture.createGraphics(head, torso, upperArm, lowerArm, upperLeg, lowerLeg);
			add(picture);
			
			getData();
			
			eventSpace = new EventTwo(headAndTorsoSize, headAndTorsoPosition, armSize, armPosition, legsSize, legsPosition, 1.3, this);
			add(eventSpace);
		}
		
		//determine event type and place the according event type
		if (eventName == "push")
		{
			//something
			picture = new Ragdoll(200, 325);
			picture.init();
			picture.createGraphics(head, torso, upperArm, lowerArm, upperLeg, lowerLeg);
			add(picture);
			
			getData();
			
			eventSpace = new EventThree(headAndTorsoSize, headAndTorsoPosition, armSize, armPosition, legsSize, legsPosition, 1.3, this);
			add(eventSpace);
		}
		
		FlxNapeState.space.gravity.setxy(0, 0);
		createWalls(0,-300,FlxG.width, FlxG.height - 30);
		
		for (i in picture.spriteArray)
		{
			i.antialiasing = true;
			registerPhysSprite(i);
		}
	}
	
	//gets data needed to place the event's bounding boxes
	private function getData()
	{
		headAndTorsoSize = new Point(picture.headPoint.x, picture.torsoPoint.y);
		headAndTorsoPosition = new Point(picture.head.x - picture.head.width / 2 - 30, picture.head.y - picture.head.height / 2 - 10);
		
		armSize = new Point(picture.upperArmPoint.y + picture.lowerArmPoint.y, picture.upperArmPoint.x + picture.upperArmPoint.x / 2);
		armPosition = new Point(picture.upperArm.x - picture.upperArm.height * 2 + 5, picture.upperArm.y + 20);
		
		legsSize = new Point(picture.upperLegPoint.x * 3, picture.upperLegPoint.y + picture.lowerLegPoint.y / 4 * 3);
		legsPosition = new Point(picture.frontUpperLeg.x - picture.upperLegPoint.x * 4 / 2, picture.frontUpperLeg.y - picture.frontUpperLeg.height / 4);
	}
	
	//enables the player to interact with the ragdoll's seperate parts
	public function registerPhysSprite(spr:FlxNapeSprite):Void
	{
		MouseEventManager.add(spr, mousePress, mouseRelease, mouseOver, onOut);
	}
	
	//when the player is done they run this to disable the interaction with the ragdoll
	public function deRegisterPhysSprite(spr:FlxNapeSprite):Void
	{
		MouseEventManager.remove(spr);
		
		//makes sure that the color coding to indicate interaction possibilities is null
		mouseRelease(spr);
		onOut(spr);
	}
	
	//what should happen when the player presses and holds the mouse on a sprite
	private function mousePress(spr:FlxSprite):Void
	{
		spr.color = FlxColor.FOREST_GREEN;
		pressedABox = true;
		tempSpr = spr;
	}
	
	//what happens when the player releases their mouse button
	private function mouseRelease(spr:FlxSprite):Void
	{
		spr.color = FlxColor.WHITE;
		pressedABox = false;
	}
	
	//what happens when the mouse hovers over a sprite
	private function mouseOver(spr:FlxSprite):Void
	{
		spr.color = FlxColor.LIME;
	}
	
	//what happens when the mouse leaves the area of the sprite
	private function onOut(spr:FlxSprite):Void
	{
		if (!pressedABox)
			spr.color = FlxColor.WHITE;
	}

	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		//changes corresponding with the player's remaining health
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
		
		//functionality for the ragdoll
		if (pressedABox == true && FlxG.mouse.pressed == true)
		{
			body = cast(tempSpr, FlxNapeSprite).body;
			
			//rotate the selected sprite to the left
			if (FlxG.keys.pressed.A)
				body.rotation -= 0.05;
				
			//rotate the selected sprite to the right
			if (FlxG.keys.pressed.D)
				body.rotation += 0.05;
				
			//moves the selected sprite down
			if (FlxG.keys.pressed.W)
				body.position.y -= 1;
				
			//moves the selected sprite up
			if (FlxG.keys.pressed.S)
				body.position.y += 1;
				
			//moves the selected sprite left
			if (FlxG.keys.pressed.Q)
				body.position.x -= 1;
				
			//moves the selected sprite right
			if (FlxG.keys.pressed.E)
				body.position.x += 1;
		}
		
		//checks if there is an eventSpace already in game. If there is it tracks the position of the ragdoll and moves the bounding boxes to increase the amount of error the player can make
		if (eventSpace != null)
		{
			headAndTorsoPosition.x = picture.head.x + picture.head.width;
			headAndTorsoPosition.y = picture.head.y + picture.torso.height / 2;
			
			armPosition.x = picture.upperArm.x;
			armPosition.y = picture.lowerArm.y;
			
			legsPosition.x = picture.frontUpperLeg.x + picture.frontLowerLeg.width / 2;
			legsPosition.y = picture.frontLowerLeg.y + 50;
			
			eventSpace.trackPosition(headAndTorsoPosition, armPosition, legsPosition);
		}
		
		//when the player is done setting the position they can press C to confirm
		if (FlxG.keys.justReleased.C)
		{
			//bools for the three bounding boxes
			var booleanArray:Array<Bool> = [false, false, false];
			
			for (i in 0...3)
			{
				if (i == 0)
				{
					//checks the head and torso if they're in the corresponding bounding box
					if (overlap(eventSpace.boundingBoxOne, picture.head) && overlap(eventSpace.boundingBoxOne, picture.torso))
					{
						trace("good");
						booleanArray[i] = true;
					}
					
					else {
						trace("bad");
					}
				}
				
				if (i == 1)
				{
					var overlapTop:Bool = FlxG.overlap(eventSpace.boundingCircleOne, picture.upperArm);
					var overlapBottom:Bool = FlxG.overlap(eventSpace.boundingCircleTwo, picture.lowerArm);
					
					//checks the 
					if (overlapTop && overlapBottom)
					{
						trace("good");
						booleanArray[i] = true;
					}
					
					else {
						trace("bad");
					}
				}
				
				if (i == 2)
				{
					if (overlap(eventSpace.boundingBoxTwo, picture.frontUpperLeg) && overlap(eventSpace.boundingBoxTwo, picture.frontLowerLeg) && overlap(eventSpace.boundingBoxTwo, picture.backUpperLeg) && overlap(eventSpace.boundingBoxTwo, picture.backLowerLeg))
					{
						trace("good");
						booleanArray[i] = true;
					}
					
					else {
						trace("bad");
					}
				}
			}
			
			var i:Int = 0;
			for (booleans in booleanArray)
			{
				
				var feedbackType:Int = -1;
				
				if (!booleans)
				{
					_instance.health  -= 1;
					
					for (i in booleanArray)
					{
						if (i == false)
						{
							feedbackType = booleanArray.indexOf(i);
							break;
						}
					}
					
					//show a screen that tells what you did wrong || show a screen with what you should take a better look at
					if (feedbackType == 0)
					{
						feedbackScreen = new FlxSprite(0, 0, "img/feedback/hoofd torso.png");
						add(feedbackScreen);
					}
					
					else if (feedbackType == 1)
					{
						feedbackScreen = new FlxSprite(0, 0, "img/feedback/armen.png");
						add(feedbackScreen);
					}
					
					else if (feedbackType == 2)
					{
						feedbackScreen = new FlxSprite(0, 0, "img/feedback/benen feedback.png");
						add(feedbackScreen);
					}
					
					break;
				}
				
				
				
				else if (booleanArray[0] == true && booleanArray[1] == true && booleanArray[2] == true)
				{
					//go back to hub with on a good note
					feedbackScreen = new FlxSprite(0, 0, goodFeedback);
					add(feedbackScreen);
					_instance.setDone();
					break;
				}
			}
			
			MouseEventManager.add(feedbackScreen, onMouseDown);
			
			remove(eventSpace);
			
			for (ragdoll in picture.spriteArray)
			{
				deRegisterPhysSprite(ragdoll);
			}
		}
		
		if (FlxG.keys.justPressed.R)
			FlxG.resetState();
			
		if (FlxG.keys.justPressed.G)
			napeDebugEnabled = !napeDebugEnabled;
			
		if (FlxG.keys.justPressed.ESCAPE)
			Sys.exit(0);
	}
	
	private function onMouseDown(sprite:FlxSprite)
	{
		MouseEventManager.remove(sprite);
		remove(sprite);
		FlxG.sound.destroy(true);
		Main.changeState("Hub");
	}
	
	private function drawHealth(health:String)
	{	
		healthDisplay = new FlxSprite();
		healthDisplay.loadGraphic(health);
		add(healthDisplay);
	}
	
	private function overlap(_boundingBox:FlxNapeSprite, _ragdollPart:FlxNapeSprite):Bool
	{
		var withinBounds:Bool = false;
		
		var firstCheckBoxX:Int = Math.floor(_boundingBox.x);
		var firstCheckPartX:Int = Math.floor(_ragdollPart.x);
		
		var firstCheckBoxY:Int = Math.floor(_boundingBox.y);
		var firstCheckPartY:Int = Math.floor(_ragdollPart.y);
		
		var secondCheckBoxX:Int = Math.floor(_boundingBox.x + _boundingBox.width);
		var secondCheckPartX:Int = Math.floor(_ragdollPart.x + _ragdollPart.width);
		
		var secondCheckBoxY:Int = Math.floor(_boundingBox.y + _boundingBox.height);
		var secondCheckPartY:Int = Math.floor(_ragdollPart.y + _ragdollPart.height);
		
		if (firstCheckBoxX <= firstCheckPartX && firstCheckBoxY <= firstCheckPartY && secondCheckBoxX >=  secondCheckPartX && secondCheckBoxY >= secondCheckPartY)
		{
			withinBounds = true;
		}
		
		return withinBounds;
	}
	
	private function distanceFromLine(p1:Point, p2:Point, v:Point):Float
	{
		var c1:Float = (p2.x - p1.x) * (p1.y - v.y) - (p1.x - v.x) * (p2.y - p1.y);
		var c2:Float = Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2);
		var d:Float = Math.abs(c1) / Math.sqrt(c2);
		
		return d;
	}
	
	public static function getEventType(type:String):Void 
	{
		eventName = type;
	}
	
	public static function passFile(image:String):Void
	{
		eventBackdrop = image;
	}
	
	public static function rightEventFeedback(feedback:String)
	{
		goodFeedback = feedback;
	}
}