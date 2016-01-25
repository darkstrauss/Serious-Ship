package;

import flixel.addons.display.FlxSpriteAniRot;
import flixel.addons.display.shapes.FlxShapeBox;
import flixel.addons.nape.FlxNapeSprite;
import flixel.addons.nape.FlxNapeState;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.FlxG;
import nape.callbacks.Callback;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import openfl.geom.Point;
import nape.callbacks.CbType;
import nape.callbacks.CbEvent;
import nape.callbacks.PreCallback;
import nape.callbacks.PreFlag;
import nape.callbacks.PreListener;
import nape.callbacks.InteractionCallback;
import nape.callbacks.InteractionListener;
import nape.callbacks.InteractionType;

/**
 * ...
 * @author Alan Hart
 */

 //pushing
class EventThree extends FlxGroup
{
	private var space = FlxNapeState.space;
	
	public var boundingBoxes:Array<Body> = [];
	
	public var boundingBoxOne:FlxNapeSprite;
	public var boundingBoxTwo:FlxNapeSprite;
	
	public var boundingCircleOne:FlxNapeSprite;
	public var boundingCircleTwo:FlxNapeSprite;
	
	private var currentState:EventState;

	public function new(_headTorsoSize:Point, _headTorsoPosition:Point, _armSize:Point, _armPosition:Point, _legSize:Point, _legPosition:Point, _scaleFactor:Float, _currentState:EventState) 
	{
		super();
		
		currentState = _currentState;
		
		var headTorsoSizeX:Int = Math.floor(_headTorsoSize.x * (_scaleFactor * 1.2));
		var headTorsoSizeY:Int = Math.floor(_headTorsoSize.y * (_scaleFactor * 1.2));
		
		var armSizeX:Int = Math.floor(_armSize.x * _scaleFactor);
		var armSizeY:Int = Math.floor(_armSize.y * (_scaleFactor * 1.1));
		
		var legSizeX:Int = Math.floor(_legSize.x * _scaleFactor);
		var legSizeY:Int = Math.floor(_legSize.y * _scaleFactor);
		
		boundingCircleOne = new FlxNapeSprite(207, 400);
		boundingCircleOne.createCircularBody(armSizeX / 6, BodyType.DYNAMIC);
		boundingCircleOne.makeGraphic(Math.floor(armSizeX / 3), Math.floor(armSizeX / 3), FlxColor.WHITE, true);
		boundingCircleOne.alpha = 0.01;
		add(boundingCircleOne);
		
		boundingCircleTwo = new FlxNapeSprite(314, 488);
		boundingCircleTwo.createCircularBody(armSizeX / 6, BodyType.DYNAMIC);
		boundingCircleTwo.makeGraphic(Math.floor(armSizeX / 3), Math.floor(armSizeX / 3), FlxColor.WHITE, true);
		boundingCircleTwo.alpha = 0.01;
		add(boundingCircleTwo);
		
		boundingBoxOne = new FlxNapeSprite(0,0);
		boundingBoxOne.createRectangularBody(headTorsoSizeX, headTorsoSizeY, BodyType.KINEMATIC);
		boundingBoxOne.makeGraphic(headTorsoSizeX, headTorsoSizeY, FlxColor.WHITE, true);
		boundingBoxOne.alpha = 0.01;
		boundingBoxes.push(boundingBoxOne.body);
		add(boundingBoxOne);
		
		boundingBoxTwo = new FlxNapeSprite(0, 0);
		boundingBoxTwo.createRectangularBody(legSizeX, legSizeY, BodyType.KINEMATIC);
		boundingBoxTwo.makeGraphic(legSizeX, legSizeY, FlxColor.WHITE, true);
		boundingBoxTwo.alpha = 0.01;
		boundingBoxes.push(boundingBoxTwo.body);
		add(boundingBoxTwo);
		
		ignoreCollisionWithRagdoll();
	}
	
	private function ignoreCollisionWithRagdoll()
	{
		var groupsArray:Array<CbType> = [];
		
		var group1:CbType = new CbType(); 
		groupsArray.push(group1);
		
		var group2:CbType = new CbType(); 
		groupsArray.push(group2);
		
		var ragdollGroup:CbType = new CbType(); 
		groupsArray.push(ragdollGroup);
		
		boundingBoxOne.body.cbTypes.add(group1);
		boundingBoxTwo.body.cbTypes.add(group1);
		
		boundingCircleOne.body.cbTypes.add(group2);
		boundingCircleTwo.body.cbTypes.add(group2);
		
		for (bodies in 0...currentState.picture.napeBodyArray.length)
		{
			currentState.picture.napeBodyArray[bodies].cbTypes.add(ragdollGroup);
		}
		
		var listener;
		listener = new PreListener(InteractionType.COLLISION, group1, ragdollGroup, ignoreCollision, 0, true);
		listener.space = space;
		
		var listener;
		listener = new PreListener(InteractionType.COLLISION, group1, group1, ignoreCollision, 0, true);
		listener.space = space;
		
		var listener;
		listener = new PreListener(InteractionType.COLLISION, group1, group2, ignoreCollision, 0, true);
		listener.space = space;
		
		var listener;
		listener = new PreListener(InteractionType.COLLISION, group2, ragdollGroup, ignoreCollision, 0, true);
		listener.space = space;
		
		var listener;
		listener = new PreListener(InteractionType.COLLISION, group2, group2, ignoreCollision, 0, true);
		listener.space = space;
		
	}
	
	private function ignoreCollision(cb:Callback):PreFlag
	{
		return PreFlag.IGNORE;
	}
	
	public function trackPosition(_positionForHeadBox:Point, _positionForArmBox:Point, _positionForLegBox:Point)
	{
		//need to track the position of the ragdoll in space and apply the newly gotten x and y coordinates.
		boundingBoxes[0].position.x = _positionForHeadBox.x - 40; boundingBoxes[0].position.y = _positionForHeadBox.y + 30;
		
		boundingBoxes[1].position.x = _positionForLegBox.x; boundingBoxes[1].position.y = _positionForLegBox.y - 40;
		
		if (FlxG.mouse.justReleased)
			trace(FlxG.mouse.getScreenPosition());
	}
	
}