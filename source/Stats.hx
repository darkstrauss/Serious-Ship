package;

class Stats
{
	//This will be the unique instance created by the class
    private static var instance:Stats;
	
	//This variable will help us to determine whether the instance can be created
	private static var isOkayToCreate:Bool = false;   
	
	// This is your starting health
	public var health:Int = 4;
	public var gender:Int;
	
	public var eventArray:Array<Bool> = [false, false, false, false, false, false];
	
	public function new()
	{
		
	}
	
	public function setDone()
	{
		eventArray[Events.eventType] = true;
		trace(eventArray);
	}
	
    public static function getinstance():Stats
    {	
		 //If there's no instance, create it
         if (instance == null)
         {
            //Allow the creation of the instance, and after it is created, stop any more from being created
            isOkayToCreate = true;
            instance = new Stats();
            isOkayToCreate = false;
         }

		return instance;
    }
}