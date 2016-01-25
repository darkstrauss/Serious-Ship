package;

import flixel.addons.nape.FlxNapeSprite;
import flixel.addons.nape.FlxNapeState;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.system.debug.DebuggerUtil;
import flixel.system.debug.FlxDebugger.DebuggerLayout;
import flixel.system.frontEnds.DebuggerFrontEnd;
import nape.callbacks.Callback;
import nape.phys.BodyList;
import nape.phys.Compound;
import nape.util.Debug;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import nape.constraint.DistanceJoint;
import nape.constraint.AngleJoint;
import nape.constraint.PivotJoint;
import nape.constraint.WeldJoint;
import nape.dynamics.InteractionFilter;
import nape.dynamics.InteractionGroup;
import nape.callbacks.CbType;
import nape.callbacks.CbEvent;
import nape.callbacks.PreCallback;
import nape.callbacks.PreFlag;
import nape.callbacks.PreListener;
import nape.callbacks.InteractionCallback;
import nape.callbacks.InteractionListener;
import nape.callbacks.InteractionType;
import flixel.system.FlxCollisionType;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.constraint.Constraint;

/**
 * ...
 * @author Alan Hart
 */
class Ragdoll extends FlxGroup
{
	public var spriteArray:Array<FlxNapeSprite>;
	public var napeBodyArray:Array<Body> = [];
	
	public var headPoint:FlxPoint;
	public var torsoPoint:FlxPoint;
	public var upperArmPoint:FlxPoint;
	public var lowerArmPoint:FlxPoint;
	public var upperLegPoint:FlxPoint;
	public var lowerLegPoint:FlxPoint;
	
	public var head:FlxNapeSprite;
	public var torso:FlxNapeSprite;
	public var upperArm:FlxNapeSprite;
	public var lowerArm:FlxNapeSprite;
	public var backUpperLeg:FlxNapeSprite;
	public var backLowerLeg:FlxNapeSprite;
	public var frontUpperLeg:FlxNapeSprite;
	public var frontLowerLeg:FlxNapeSprite;
	
	public var startX:Float;
	public var startY:Float;
	
	private var space = FlxNapeState.space;
	
	public function new(x:Int, y:Int)
	{
		super();
		
		headPoint = FlxPoint.get(84, 69);
		torsoPoint = FlxPoint.get(63, 157);
		upperArmPoint = FlxPoint.get(39, 94);
		lowerArmPoint = FlxPoint.get(34, 96);
		upperLegPoint = FlxPoint.get(45, 113);
		lowerLegPoint = FlxPoint.get(58, 113);
		
		startY = y;
		startX = x;
	}
	
	public function init()
	{
		spriteArray = new Array<FlxNapeSprite>();
		
		head = new FlxNapeSprite(startX, startY); 
		spriteArray.push(head);
		
		torso = new FlxNapeSprite(startX, head.y + 95); 
		spriteArray.push(torso);
		
		upperArm = new FlxNapeSprite(startX, torso.y);
		spriteArray.push(upperArm);
		
		lowerArm = new FlxNapeSprite(startX, upperArm.y + upperArmPoint.y - 10);
		spriteArray.push(lowerArm);
		
		backUpperLeg = new FlxNapeSprite(startX + 1, torso.y + torsoPoint.y - 40);
		spriteArray.push(backUpperLeg);
		
		backLowerLeg = new FlxNapeSprite(startX + 13, backUpperLeg.y + upperLegPoint.y - 10);
		spriteArray.push(backLowerLeg);
		
		frontUpperLeg = new FlxNapeSprite(startX + 9, torso.y + torsoPoint.y - 35);
		spriteArray.push(frontUpperLeg);
		
		frontLowerLeg = new FlxNapeSprite(startX + 21, frontUpperLeg.y + upperLegPoint.y - 10);
		spriteArray.push(frontLowerLeg);
		
		add(backLowerLeg);
		add(backUpperLeg);
		add(torso);
		add(head);
		add(frontLowerLeg);
		add(frontUpperLeg);
		add(lowerArm);
		add(upperArm);
		
		createBodies();
		createContactListeners();
		createJoints();
		
		napeBodyArray.push(head.body);
		napeBodyArray.push(torso.body);
		napeBodyArray.push(upperArm.body);
		napeBodyArray.push(lowerArm.body);
		napeBodyArray.push(backUpperLeg.body);
		napeBodyArray.push(backLowerLeg.body);
		napeBodyArray.push(frontUpperLeg.body);
		napeBodyArray.push(frontLowerLeg.body);	
		
	}
	
	private function createBodies()
	{
		head.createRectangularBody(headPoint.x, headPoint.y);
		torso.createRectangularBody(torsoPoint.x, torsoPoint.y);
		upperArm.createRectangularBody(upperArmPoint.x, upperArmPoint.y);
		lowerArm.createRectangularBody(lowerArmPoint.x, lowerArmPoint.y);
		backUpperLeg.createRectangularBody(upperLegPoint.x, upperLegPoint.y);
		backLowerLeg.createRectangularBody(lowerLegPoint.x, lowerLegPoint.y);
		frontUpperLeg.createRectangularBody(upperLegPoint.x, upperLegPoint.y);
		frontLowerLeg.createRectangularBody(lowerLegPoint.x, lowerLegPoint.y);
	}
	
	private function createContactListeners()
	{
		var groupsArray:Array<CbType> = [];
		
		//head
		var group1:CbType = new CbType(); 
		groupsArray.push(group1);
		
		//torso
		var group2:CbType = new CbType(); 
		groupsArray.push(group2);
		
		//upperArm
		var group3:CbType = new CbType(); 
		groupsArray.push(group3);
		
		//lowerArm
		var group4:CbType = new CbType(); 
		groupsArray.push(group4);
		
		//backUpperLeg
		var group5:CbType = new CbType(); 
		groupsArray.push(group5);
		
		//backLowerLeg
		var group6:CbType = new CbType(); 
		groupsArray.push(group6);
		
		//frontUpperLeg
		var group7:CbType = new CbType(); 
		groupsArray.push(group7);
		
		//frontLowerLeg
		var group8:CbType = new CbType(); 
		groupsArray.push(group8);
		
		
		head.body.cbTypes.add(group1);
		torso.body.cbTypes.add(group2);
		upperArm.body.cbTypes.add(group3);
		lowerArm.body.cbTypes.add(group4);
		backUpperLeg.body.cbTypes.add(group5);
		backLowerLeg.body.cbTypes.add(group6);
		frontUpperLeg.body.cbTypes.add(group7);
		frontLowerLeg.body.cbTypes.add(group8);
		
		for (i in groupsArray)
		{
			var listener;
			listener = new PreListener(InteractionType.COLLISION, group1, i, ignoreCollision, 0, true);
			listener.space = space;
		}
		
		for (i in groupsArray)
		{
			var listener;
			listener = new PreListener(InteractionType.COLLISION, group2, i, ignoreCollision, 0, true);
			listener.space = space;
		}
		
		for (i in groupsArray)
		{
			var listener;
			listener = new PreListener(InteractionType.COLLISION, group3, i, ignoreCollision, 0, true);
			listener.space = space;
		}
		for (i in groupsArray)
		{
			var listener;
			listener = new PreListener(InteractionType.COLLISION, group4, i, ignoreCollision, 0, true);
			listener.space = space;
		}
		for (i in groupsArray)
		{
			var listener;
			listener = new PreListener(InteractionType.COLLISION, group5, i, ignoreCollision, 0, true);
			listener.space = space;
		}
		for (i in groupsArray)
		{
			var listener;
			listener = new PreListener(InteractionType.COLLISION, group6, i, ignoreCollision, 0, true);
			listener.space = space;
		}
		for (i in groupsArray)
		{
			var listener;
			listener = new PreListener(InteractionType.COLLISION, group7, i, ignoreCollision, 0, true);
			listener.space = space;
		}
		for (i in groupsArray)
		{
			var listener;
			listener = new PreListener(InteractionType.COLLISION, group8, i, ignoreCollision, 0, true);
			listener.space = space;
		}
	}
	
	private function ignoreCollision(cb:Callback):PreFlag
	{
		return PreFlag.IGNORE;
	}
	
	public function createGraphics(_head:String, _torso:String, _upperArm:String, _lowerArm:String, _upperLeg:String, _lowerLeg:String)
	{
		head.loadGraphic(_head);
		torso.loadGraphic(_torso);
		upperArm.loadGraphic(_upperArm);
		lowerArm.loadGraphic(_lowerArm);
		backUpperLeg.loadGraphic(_upperLeg);
		backLowerLeg.loadGraphic(_lowerLeg);
		frontUpperLeg.loadGraphic(_upperLeg);
		frontLowerLeg.loadGraphic(_lowerLeg);
	}
	
	private function createJoints()
	{
		var constrain:PivotJoint;
		
		var headAndTorsoPoint:Vec2 = Vec2.get(head.x, head.y + headPoint.y / 2);
		var torsoAndArmPoint:Vec2 = Vec2.get(upperArm.x, upperArm.y - upperArmPoint.y / 2 + 15);
		var armAndArmPoint:Vec2 = Vec2.get(lowerArm.x, lowerArm.y - lowerArmPoint.y / 2 + 15);
		var torsoAndLegPoint:Vec2 = Vec2.get(frontUpperLeg.x, frontUpperLeg.y - upperLegPoint.y / 2);
		var fUpperLegAndLowerLegPoint:Vec2 = Vec2.get(frontLowerLeg.x - 9, frontLowerLeg.y - lowerLegPoint.y / 2);
		var bUpperLegAndLowerLegPoint:Vec2 = Vec2.get(backLowerLeg.x - 13, backLowerLeg.y - lowerLegPoint.y / 2);
		
		constrain = new PivotJoint(head.body, torso.body, head.body.worldPointToLocal(headAndTorsoPoint, false), torso.body.worldPointToLocal(headAndTorsoPoint, false));
		format(constrain);
		
		constrain = new PivotJoint(torso.body, upperArm.body, torso.body.worldPointToLocal(torsoAndArmPoint, false), upperArm.body.worldPointToLocal(torsoAndArmPoint, false));
		format(constrain);
		
		constrain = new PivotJoint(upperArm.body, lowerArm.body, upperArm.body.worldPointToLocal(armAndArmPoint, false), lowerArm.body.worldPointToLocal(armAndArmPoint, false));
		format(constrain);
		
		constrain = new PivotJoint(torso.body, frontUpperLeg.body, torso.body.worldPointToLocal(torsoAndLegPoint, false), frontUpperLeg.body.worldPointToLocal(torsoAndLegPoint, false));
		format(constrain);
		
		constrain = new PivotJoint(frontUpperLeg.body, frontLowerLeg.body, frontUpperLeg.body.worldPointToLocal(fUpperLegAndLowerLegPoint, false), frontLowerLeg.body.worldPointToLocal(fUpperLegAndLowerLegPoint, false));
		format(constrain);
		
		constrain = new PivotJoint(torso.body, backUpperLeg.body, torso.body.worldPointToLocal(torsoAndLegPoint, false), backUpperLeg.body.worldPointToLocal(torsoAndLegPoint, false));
		format(constrain);
		
		constrain = new PivotJoint(backUpperLeg.body, backLowerLeg.body, backUpperLeg.body.worldPointToLocal(bUpperLegAndLowerLegPoint, false), backLowerLeg.body.worldPointToLocal(bUpperLegAndLowerLegPoint, false));
		format(constrain);
		
	}
	
	private function format(c:Constraint)
	{
		c.stiff = true;
		c.frequency = 1;
		c.damping = 1;
		c.space = space;
	}
}