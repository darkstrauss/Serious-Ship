package source;
import flixel.FlxG;
import flixel.FlxSprite;
import openfl.Assets;

class Steave extends FlxSprite
{

	public function new() 
	{
		super(0,500, Assets.getBitmapData("img/steave.png"));
		
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (FlxG.camera.target != null && FlxG.camera.followLead.x == 0) // target check is used for debug purposes.
		{
			x = Math.round(x); // Smooths camera and orb shadow following. Does not work well with camera lead.
			y = Math.round(y); // Smooths camera and orb shadow following. Does not work well with camera lead.
		}
		
	}
}