package ;
import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author Daan
 */
class Page extends FlxSprite
{
	public var number:Int;
	
	public var _active = false;
	
	public function new(Number:Int) 
	{
		super();
		number = Number;
		
		switch (number) {
			case 0: {
				//loadGraphic("pageFront");
				loadGraphic("img/book/pageBook1.png");
			}
			case 1: {
				//loadGraphic("page1");
				loadGraphic("img/book/pageBook2.png");
			}
			case 2: {
				//loadGraphic("page2");
				loadGraphic("img/book/pageBook3.png");
			}
			case 3: {
				//loadGraphic("page3");
				loadGraphic("img/book/pageBook4.png");
			}		
		}
	}
	
}