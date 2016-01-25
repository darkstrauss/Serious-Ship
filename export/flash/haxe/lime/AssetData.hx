package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("img/book/pageBook1.png", "img/book/pageBook1.png");
			type.set ("img/book/pageBook1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/book/pageBook2.png", "img/book/pageBook2.png");
			type.set ("img/book/pageBook2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/book/pageBook3.png", "img/book/pageBook3.png");
			type.set ("img/book/pageBook3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/book/pageBook4.png", "img/book/pageBook4.png");
			type.set ("img/book/pageBook4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/Credits.png", "img/buttons/Credits.png");
			type.set ("img/buttons/Credits.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/Duwen.png", "img/buttons/Duwen.png");
			type.set ("img/buttons/Duwen.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/monkeybutton.png", "img/buttons/monkeybutton.png");
			type.set ("img/buttons/monkeybutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/penguinbutton.png", "img/buttons/penguinbutton.png");
			type.set ("img/buttons/penguinbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/pigbutton.png", "img/buttons/pigbutton.png");
			type.set ("img/buttons/pigbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/sealbutton.png", "img/buttons/sealbutton.png");
			type.set ("img/buttons/sealbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/Start.png", "img/buttons/Start.png");
			type.set ("img/buttons/Start.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/Terug.png", "img/buttons/Terug.png");
			type.set ("img/buttons/Terug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/Tillen.png", "img/buttons/Tillen.png");
			type.set ("img/buttons/Tillen.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/treebutton.png", "img/buttons/treebutton.png");
			type.set ("img/buttons/treebutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/Trekken.png", "img/buttons/Trekken.png");
			type.set ("img/buttons/Trekken.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/buttons/turtlebutton.png", "img/buttons/turtlebutton.png");
			type.set ("img/buttons/turtlebutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/credits.png", "img/credits.png");
			type.set ("img/credits.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/descriptions/monkeyDescription.png", "img/descriptions/monkeyDescription.png");
			type.set ("img/descriptions/monkeyDescription.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/descriptions/penguinDescription.png", "img/descriptions/penguinDescription.png");
			type.set ("img/descriptions/penguinDescription.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/descriptions/pigDescription.png", "img/descriptions/pigDescription.png");
			type.set ("img/descriptions/pigDescription.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/descriptions/sealDescription.png", "img/descriptions/sealDescription.png");
			type.set ("img/descriptions/sealDescription.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/descriptions/treeBranchDescription.png", "img/descriptions/treeBranchDescription.png");
			type.set ("img/descriptions/treeBranchDescription.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/descriptions/turtleDescription.png", "img/descriptions/turtleDescription.png");
			type.set ("img/descriptions/turtleDescription.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/events/monkeyz.png", "img/events/monkeyz.png");
			type.set ("img/events/monkeyz.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/events/penguin.png", "img/events/penguin.png");
			type.set ("img/events/penguin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/events/pig.png", "img/events/pig.png");
			type.set ("img/events/pig.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/events/seal.png", "img/events/seal.png");
			type.set ("img/events/seal.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/events/treeBranch.png", "img/events/treeBranch.png");
			type.set ("img/events/treeBranch.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/events/turtle.png", "img/events/turtle.png");
			type.set ("img/events/turtle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/monkeyFeedbackNegative.png", "img/feedback/monkeyFeedbackNegative.png");
			type.set ("img/feedback/monkeyFeedbackNegative.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/monkeyFeedbackPositive.png", "img/feedback/monkeyFeedbackPositive.png");
			type.set ("img/feedback/monkeyFeedbackPositive.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/penguinFeedbackNegative.png", "img/feedback/penguinFeedbackNegative.png");
			type.set ("img/feedback/penguinFeedbackNegative.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/penguinFeedbackPositive.png", "img/feedback/penguinFeedbackPositive.png");
			type.set ("img/feedback/penguinFeedbackPositive.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/pigFeedbackNegative.png", "img/feedback/pigFeedbackNegative.png");
			type.set ("img/feedback/pigFeedbackNegative.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/pigFeedbackPositive.png", "img/feedback/pigFeedbackPositive.png");
			type.set ("img/feedback/pigFeedbackPositive.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/sealFeedbackNegative.png", "img/feedback/sealFeedbackNegative.png");
			type.set ("img/feedback/sealFeedbackNegative.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/sealFeedbackPositive.png", "img/feedback/sealFeedbackPositive.png");
			type.set ("img/feedback/sealFeedbackPositive.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/treebranchFeedbackNegative.png", "img/feedback/treebranchFeedbackNegative.png");
			type.set ("img/feedback/treebranchFeedbackNegative.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/treebranchFeedbackPositive.png", "img/feedback/treebranchFeedbackPositive.png");
			type.set ("img/feedback/treebranchFeedbackPositive.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/turtleFeedbackNegative.png", "img/feedback/turtleFeedbackNegative.png");
			type.set ("img/feedback/turtleFeedbackNegative.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/feedback/turtleFeedbackPositive.png", "img/feedback/turtleFeedbackPositive.png");
			type.set ("img/feedback/turtleFeedbackPositive.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/gameOver.png", "img/gameOver.png");
			type.set ("img/gameOver.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/health.png", "img/health.png");
			type.set ("img/health.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/Heart1.png", "img/Heart1.png");
			type.set ("img/Heart1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/Heart2.png", "img/Heart2.png");
			type.set ("img/Heart2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/Heart3.png", "img/Heart3.png");
			type.set ("img/Heart3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/Heart4.png", "img/Heart4.png");
			type.set ("img/Heart4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/howToPlay.png", "img/howToPlay.png");
			type.set ("img/howToPlay.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/hub1.png", "img/hub1.png");
			type.set ("img/hub1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/mainMenu.png", "img/mainMenu.png");
			type.set ("img/mainMenu.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/menu/menu room empty.png", "img/menu/menu room empty.png");
			type.set ("img/menu/menu room empty.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/menu/menufinal.png", "img/menu/menufinal.png");
			type.set ("img/menu/menufinal.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/menu/prestatie.png", "img/menu/prestatie.png");
			type.set ("img/menu/prestatie.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/menu/prestatiehover.png", "img/menu/prestatiehover.png");
			type.set ("img/menu/prestatiehover.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/menu/speluitleg.png", "img/menu/speluitleg.png");
			type.set ("img/menu/speluitleg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/menu/Speluitleghover.png", "img/menu/Speluitleghover.png");
			type.set ("img/menu/Speluitleghover.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/menu/teleporter.png", "img/menu/teleporter.png");
			type.set ("img/menu/teleporter.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/menu/teleporterhover.png", "img/menu/teleporterhover.png");
			type.set ("img/menu/teleporterhover.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/steave.png", "img/steave.png");
			type.set ("img/steave.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/sounds/beep.mp3", "assets/sounds/beep.mp3");
			type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/flixel.mp3", "assets/sounds/flixel.mp3");
			type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
