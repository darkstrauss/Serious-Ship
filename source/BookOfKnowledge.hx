package;
import flixel.FlxState;
import flixel.group.FlxTypedSpriteGroup;
import flixel.ui.FlxButton;
import flash.display.Sprite;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class BookOfKnowledge extends FlxTypedSpriteGroup<Page>
{
	public var isActiveFront:Bool = false;
	public var isActivePage1:Bool = false;
	
	private var pages:Array<Page> = new Array<Page>();
	
	private static var PAGES_AMOUNT:Int = 4;
	
	private var hub:Hub;
	
	private var currentPageIndex : Int = 0;
	
	public function new() 
	{
		super();
		
		for (i in 0...PAGES_AMOUNT) {
			pages[i] = new Page(i);
		}
		
		defaultPage();		
	}
	
	private function defaultPage() {
		currentPageIndex = 0;
		pages[currentPageIndex]._active = true;
		add(pages[currentPageIndex]);
	}
	
	public function showNextPage() {
		pages[currentPageIndex]._active = false;
		remove(pages[currentPageIndex]);
		
		currentPageIndex = (currentPageIndex + 1) % PAGES_AMOUNT;
		
		pages[currentPageIndex]._active = true;
		add(pages[currentPageIndex]);
	}
}