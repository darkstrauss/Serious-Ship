package ;

import flixel.util.FlxPoint;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.input.keyboard.FlxKeyList;
import flixel.input.keyboard.FlxKey;
import flixel.FlxCamera;
import flixel.util.FlxSpriteUtil;
import flash.Lib;
import openfl.Assets;

class Hub extends FlxState
{	
	// Let us use the variable in the Stats class in order to change it throughout the game
	var _instance:Stats = Stats.getinstance();
	
	
	var _book:FlxSprite;
	var _back:FlxButton;
	
	var bookFront:BookOfKnowledge;
	
	var healthDisplay:FlxSprite;
	
	var backdrop:FlxSprite;
	
	private var overlayCamera:FlxCamera;
	
	static var LEVEL_MIN_X;		 	
 	static var LEVEL_MAX_X;		 	
 	static var LEVEL_MIN_Y;		 	
 	static var LEVEL_MAX_Y;
	
	var _one:FlxSprite;
	var _two:FlxSprite;
	var _three:FlxSprite;
	var _four:FlxSprite;
	var _five:FlxSprite;
	var _six:FlxSprite;
	var characterDisplay:FlxSprite;
	var eave:FlxSprite;
	var walkSpeed:Int = 5;
	var facing:FlxObject;
	
	override public function create():Void
	{	
		LEVEL_MIN_X = 0;	 	
 		LEVEL_MAX_X = 5123;		 		
 		LEVEL_MIN_Y = 0;		 		
 		LEVEL_MAX_Y = 768;
		
		super.create();
		
		createFloor();
		
		placeEventButtons();	
		
		createForeground();
		
		bookFront = new BookOfKnowledge();
		
		getHealth();
		
		switch(_instance.gender)
		{	
			case 0:
				drawCharacter("img/steave.png");
			
			case 1:
				drawCharacter("img/Eave.png");
		}
		
		camera();	
		
		FlxG.sound.playMusic("music/worldsoundpeople.wav", 1, true);
	}
	
	function createForeground()
	{
		var image:FlxSprite = new FlxSprite(0, FlxG.stage.stageHeight - 420, "img/World/environment props.png");
		add(image);
	}
	
	function drawCharacter(gender:String)
	{
		characterDisplay = new FlxSprite();
		characterDisplay.loadGraphic(gender, true, 165, 220);
		characterDisplay.animation.add("idleright", [0] , 5,true);
		characterDisplay.animation.add("idleleft", [9] , 5, true);
		characterDisplay.animation.add("walkright", [1, 2, 3, 4, 5, 6, 7, 8 ], 10, true);
		characterDisplay.animation.add("walkleft", [10, 11, 12, 13, 14, 15, 16, 17], 10, true);
		characterDisplay.y = 500;
		add(characterDisplay);
	}
	
	private function createFloor() 		 	
 	{		 		 		
 		var	FloorImg = Assets.getBitmapData("img/hub1.png");		 		
 		var ImgWidth = FloorImg.width;		 		
 		var ImgHeight = FloorImg.height;		 		
 		var i = LEVEL_MIN_X; 		 		
 		var j = LEVEL_MIN_Y; 		 		 
 				 		
			while (j <= LEVEL_MAX_Y)		 			
			{		 			
				var spr = new FlxSprite(i, j, FloorImg);		 				
				add(spr);		 				
				j += ImgHeight;		 					
			}
			
			i += ImgWidth;		 						
 	}
	
	
	function camera()
	{		 		
 		var cameraOverlay = new FlxSprite(-100000,-100000);		 		
 		cameraOverlay.makeGraphic(2560, 767, 0x0);		 				 		
 		cameraOverlay.antialiasing = true;
		
		var offset:Int = 250;		 			 		
		
		overlayCamera = new FlxCamera(0, 0, 2560, 767);		 		
 		overlayCamera.follow(cameraOverlay);		 		
 		overlayCamera.bgColor = 0x0;		 		
 		FlxG.cameras.add(overlayCamera);		 		
 		add(cameraOverlay);
		
		FlxG.camera.setBounds(LEVEL_MIN_X , LEVEL_MIN_Y , LEVEL_MAX_X + Math.abs(LEVEL_MIN_X), LEVEL_MAX_Y + Math.abs(LEVEL_MIN_Y), true);		 		
 		FlxG.camera.follow(characterDisplay);
	}
	
	function placeEventButtons()
	{	
		// Makes the buttons, puts them on place and gives them the right picture.
		_one = new FlxSprite(563, 155);
		_one.loadGraphic("img/buttons/treebutton.png");
		
		_two = new FlxSprite(1163, 50);
		_two.loadGraphic("img/buttons/monkeybutton.png");
		
		_three = new FlxSprite(2200, 430);
		_three.loadGraphic("img/buttons/sealbutton.png");
		
		_four = new FlxSprite(2980, 380);
		_four.loadGraphic("img/buttons/penguinbutton.png");
		
		_five = new FlxSprite(3645, 270);
		_five.loadGraphic("img/buttons/pigbutton.png");
		
		_six = new FlxSprite(4600, 200);
		_six.loadGraphic("img/buttons/turtlebutton.png");
		
		// Adds the event buttons
		add(_one);
		add(_two);
		add(_three);
		add(_four);
		add(_five);
		add(_six);
	}
	
	// Changes the state to Events and gives event the two variables needed to play that specific event.
	function startEventOne()
	{	
		Events.eventEnvironment = 0;
		Events.eventType = 0;
		Main.changeState("Events");
	}
	
	// Changes the state to Events and gives event the two variables needed to play that specific event.
	function startEventTwo()
	{	
		Events.eventEnvironment = 0;
		Events.eventType = 1;
		Main.changeState("Events");
	}
	
	// Changes the state to Events and gives event the two variables needed to play that specific event.
	function startEventThree()
	{
		Events.eventEnvironment = 0;
		Events.eventType = 2;
		Main.changeState("Events");
	}
	
	// Changes the state to Events and gives event the two variables needed to play that specific event.
	function startEventFour()
	{
		Events.eventEnvironment = 0;
		Events.eventType = 3;
		Main.changeState("Events");
	}
	
	// Changes the state to Events and gives event the two variables needed to play that specific event.
	function startEventFive()
	{
		Events.eventEnvironment = 0;
		Events.eventType = 4;
		Main.changeState("Events");
	}
	
	// Changes the state to Events and gives event the two variables needed to play that specific event.
	function startEventSix()
	{
		Events.eventEnvironment = 0;
		Events.eventType = 5;
		Main.changeState("Events");
	}
	
	// Looks how many health you have and gives it to the drawHealth function in order to display it on the screen.
	function getHealth()
	{	
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
					// If you lost all your health you go back to the start screen.
					_instance.health += 4;
					Main.changeState("DeathScreen");
				}
		}
	}
	
	// Displays the health in the level
	function drawHealth(health:String)
	{	
		healthDisplay = new FlxSprite();
		healthDisplay.loadGraphic(health);
		healthDisplay.scrollFactor.x = 0;
		healthDisplay.scrollFactor.y = 0;
		add(healthDisplay);		
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		// If you press E on an event go to the function that activates that event.
		if (FlxG.keys.justReleased.E)
		{
			if (FlxG.overlap(characterDisplay, _one) && _instance.eventArray[0] != true)
			{
				startEventOne();
			}
			
			if (FlxG.overlap(characterDisplay, _two) && _instance.eventArray[1] != true)
			{
				startEventTwo();
			}
			
			if (FlxG.overlap(characterDisplay, _three) && _instance.eventArray[2] != true)
			{
				startEventThree();
			}
			
			if (FlxG.overlap(characterDisplay, _four) && _instance.eventArray[3] != true)
			{
				startEventFour();
			}
			
			if (FlxG.overlap(characterDisplay, _five) && _instance.eventArray[4] != true)
			{
				startEventFive();
			}
			
			if (FlxG.overlap(characterDisplay, _six) && _instance.eventArray[5] != true)
			{
				startEventSix();
			}
		}
		
		// If you press escape than you go to the starting menu
		if (FlxG.keys.anyPressed(["ESCAPE"]))
		{	
			FlxG.sound.destroy(true);
			Main.changeState("StartMenu");
		}
		
		// IF you press tab the book of knowledge pops up and you can look through it.
		if (FlxG.keys.anyJustPressed(["TAB"]))
		{	
			// If the book is active so if it displays on the screen.
			if (!bookFront.isActiveFront) 
			{	
				bookFront.isActiveFront = true;
				bookFront.scrollFactor.x = 0;
				bookFront.scrollFactor.y = 0;
				add(bookFront);
			} 
			
			// If the book is not active
			else
			{	
				bookFront.isActiveFront = false;
				remove(bookFront);
			}
		}
		
		// If you press the right key
		if (FlxG.keys.anyJustPressed(['RIGHT'])) 
		{	
			// And the book is active go to the next page.
			if (bookFront.isActiveFront) 
			{
				bookFront.showNextPage();
			}
		}
		
		characterWalking();
	}	
	
	function characterWalking()
	{
			if (FlxG.keys.anyPressed(["D"]))
			{
				characterDisplay.x += walkSpeed;
				characterDisplay.animation.play("walkright");
				
			}
			
			if (FlxG.keys.anyJustReleased(["D"]))
			{
				characterDisplay.animation.play("idleright");
			}
			

			if (FlxG.keys.anyPressed(["A"]))
			{
				
				characterDisplay.x -= walkSpeed;
				characterDisplay.animation.play("walkleft");
	
			}
			
			if (FlxG.keys.anyJustReleased(["A"]))
			{
				characterDisplay.animation.play("idleleft");
			}
	}
	
}