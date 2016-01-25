#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if (flash || js)
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLLoader;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("img/book/pageBook1.png", "img/book/pageBook1.png");
		type.set ("img/book/pageBook1.png", AssetType.IMAGE);
		path.set ("img/book/pageBook2.png", "img/book/pageBook2.png");
		type.set ("img/book/pageBook2.png", AssetType.IMAGE);
		path.set ("img/book/pageBook3.png", "img/book/pageBook3.png");
		type.set ("img/book/pageBook3.png", AssetType.IMAGE);
		path.set ("img/book/pageBook4.png", "img/book/pageBook4.png");
		type.set ("img/book/pageBook4.png", AssetType.IMAGE);
		path.set ("img/boxPlaceholder.png", "img/boxPlaceholder.png");
		type.set ("img/boxPlaceholder.png", AssetType.IMAGE);
		path.set ("img/buttons/Credits.png", "img/buttons/Credits.png");
		type.set ("img/buttons/Credits.png", AssetType.IMAGE);
		path.set ("img/buttons/Duwen.png", "img/buttons/Duwen.png");
		type.set ("img/buttons/Duwen.png", AssetType.IMAGE);
		path.set ("img/buttons/monkeybutton.png", "img/buttons/monkeybutton.png");
		type.set ("img/buttons/monkeybutton.png", AssetType.IMAGE);
		path.set ("img/buttons/penguinbutton.png", "img/buttons/penguinbutton.png");
		type.set ("img/buttons/penguinbutton.png", AssetType.IMAGE);
		path.set ("img/buttons/pigbutton.png", "img/buttons/pigbutton.png");
		type.set ("img/buttons/pigbutton.png", AssetType.IMAGE);
		path.set ("img/buttons/sealbutton.png", "img/buttons/sealbutton.png");
		type.set ("img/buttons/sealbutton.png", AssetType.IMAGE);
		path.set ("img/buttons/Start.png", "img/buttons/Start.png");
		type.set ("img/buttons/Start.png", AssetType.IMAGE);
		path.set ("img/buttons/Terug.png", "img/buttons/Terug.png");
		type.set ("img/buttons/Terug.png", AssetType.IMAGE);
		path.set ("img/buttons/Tillen.png", "img/buttons/Tillen.png");
		type.set ("img/buttons/Tillen.png", AssetType.IMAGE);
		path.set ("img/buttons/treebutton.png", "img/buttons/treebutton.png");
		type.set ("img/buttons/treebutton.png", AssetType.IMAGE);
		path.set ("img/buttons/Trekken.png", "img/buttons/Trekken.png");
		type.set ("img/buttons/Trekken.png", AssetType.IMAGE);
		path.set ("img/buttons/turtlebutton.png", "img/buttons/turtlebutton.png");
		type.set ("img/buttons/turtlebutton.png", AssetType.IMAGE);
		path.set ("img/credits.png", "img/credits.png");
		type.set ("img/credits.png", AssetType.IMAGE);
		path.set ("img/descriptions/monkeyDescription.png", "img/descriptions/monkeyDescription.png");
		type.set ("img/descriptions/monkeyDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/penguinDescription.png", "img/descriptions/penguinDescription.png");
		type.set ("img/descriptions/penguinDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/pigDescription.png", "img/descriptions/pigDescription.png");
		type.set ("img/descriptions/pigDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/sealDescription.png", "img/descriptions/sealDescription.png");
		type.set ("img/descriptions/sealDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/treeBranchDescription.png", "img/descriptions/treeBranchDescription.png");
		type.set ("img/descriptions/treeBranchDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/turtleDescription.png", "img/descriptions/turtleDescription.png");
		type.set ("img/descriptions/turtleDescription.png", AssetType.IMAGE);
		path.set ("img/Eave.png", "img/Eave.png");
		type.set ("img/Eave.png", AssetType.IMAGE);
		path.set ("img/events/monkeyz.png", "img/events/monkeyz.png");
		type.set ("img/events/monkeyz.png", AssetType.IMAGE);
		path.set ("img/events/penguin.png", "img/events/penguin.png");
		type.set ("img/events/penguin.png", AssetType.IMAGE);
		path.set ("img/events/pig.png", "img/events/pig.png");
		type.set ("img/events/pig.png", AssetType.IMAGE);
		path.set ("img/events/seal.png", "img/events/seal.png");
		type.set ("img/events/seal.png", AssetType.IMAGE);
		path.set ("img/events/treeBranch.png", "img/events/treeBranch.png");
		type.set ("img/events/treeBranch.png", AssetType.IMAGE);
		path.set ("img/events/turtle.png", "img/events/turtle.png");
		type.set ("img/events/turtle.png", AssetType.IMAGE);
		path.set ("img/feedback/armen.png", "img/feedback/armen.png");
		type.set ("img/feedback/armen.png", AssetType.IMAGE);
		path.set ("img/feedback/benen feedback.png", "img/feedback/benen feedback.png");
		type.set ("img/feedback/benen feedback.png", AssetType.IMAGE);
		path.set ("img/feedback/hoofd torso.png", "img/feedback/hoofd torso.png");
		type.set ("img/feedback/hoofd torso.png", AssetType.IMAGE);
		path.set ("img/feedback/monkeyFeedbackNegative.png", "img/feedback/monkeyFeedbackNegative.png");
		type.set ("img/feedback/monkeyFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/monkeyFeedbackPositive.png", "img/feedback/monkeyFeedbackPositive.png");
		type.set ("img/feedback/monkeyFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/penguinFeedbackNegative.png", "img/feedback/penguinFeedbackNegative.png");
		type.set ("img/feedback/penguinFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/penguinFeedbackPositive.png", "img/feedback/penguinFeedbackPositive.png");
		type.set ("img/feedback/penguinFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/pigFeedbackNegative.png", "img/feedback/pigFeedbackNegative.png");
		type.set ("img/feedback/pigFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/pigFeedbackPositive.png", "img/feedback/pigFeedbackPositive.png");
		type.set ("img/feedback/pigFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/sealFeedbackNegative.png", "img/feedback/sealFeedbackNegative.png");
		type.set ("img/feedback/sealFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/sealFeedbackPositive.png", "img/feedback/sealFeedbackPositive.png");
		type.set ("img/feedback/sealFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/treebranchFeedbackNegative.png", "img/feedback/treebranchFeedbackNegative.png");
		type.set ("img/feedback/treebranchFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/treebranchFeedbackPositive.png", "img/feedback/treebranchFeedbackPositive.png");
		type.set ("img/feedback/treebranchFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/turtleFeedbackNegative.png", "img/feedback/turtleFeedbackNegative.png");
		type.set ("img/feedback/turtleFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/turtleFeedbackPositive.png", "img/feedback/turtleFeedbackPositive.png");
		type.set ("img/feedback/turtleFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/gameOver.png", "img/gameOver.png");
		type.set ("img/gameOver.png", AssetType.IMAGE);
		path.set ("img/health.png", "img/health.png");
		type.set ("img/health.png", AssetType.IMAGE);
		path.set ("img/Heart1.png", "img/Heart1.png");
		type.set ("img/Heart1.png", AssetType.IMAGE);
		path.set ("img/Heart2.png", "img/Heart2.png");
		type.set ("img/Heart2.png", AssetType.IMAGE);
		path.set ("img/Heart3.png", "img/Heart3.png");
		type.set ("img/Heart3.png", AssetType.IMAGE);
		path.set ("img/Heart4.png", "img/Heart4.png");
		type.set ("img/Heart4.png", AssetType.IMAGE);
		path.set ("img/howToPlay.png", "img/howToPlay.png");
		type.set ("img/howToPlay.png", AssetType.IMAGE);
		path.set ("img/hub1.png", "img/hub1.png");
		type.set ("img/hub1.png", AssetType.IMAGE);
		path.set ("img/last planet.png", "img/last planet.png");
		type.set ("img/last planet.png", AssetType.IMAGE);
		path.set ("img/mainMenu.png", "img/mainMenu.png");
		type.set ("img/mainMenu.png", AssetType.IMAGE);
		path.set ("img/menu/menu room empty.png", "img/menu/menu room empty.png");
		type.set ("img/menu/menu room empty.png", AssetType.IMAGE);
		path.set ("img/menu/menufinal.png", "img/menu/menufinal.png");
		type.set ("img/menu/menufinal.png", AssetType.IMAGE);
		path.set ("img/menu/pickEave.png", "img/menu/pickEave.png");
		type.set ("img/menu/pickEave.png", AssetType.IMAGE);
		path.set ("img/menu/pickHero.png", "img/menu/pickHero.png");
		type.set ("img/menu/pickHero.png", AssetType.IMAGE);
		path.set ("img/menu/pickSteave.png", "img/menu/pickSteave.png");
		type.set ("img/menu/pickSteave.png", AssetType.IMAGE);
		path.set ("img/menu/prestatie.png", "img/menu/prestatie.png");
		type.set ("img/menu/prestatie.png", AssetType.IMAGE);
		path.set ("img/menu/prestatiehover.png", "img/menu/prestatiehover.png");
		type.set ("img/menu/prestatiehover.png", AssetType.IMAGE);
		path.set ("img/menu/skuixoniabutton.png", "img/menu/skuixoniabutton.png");
		type.set ("img/menu/skuixoniabutton.png", AssetType.IMAGE);
		path.set ("img/menu/speluitleg.png", "img/menu/speluitleg.png");
		type.set ("img/menu/speluitleg.png", AssetType.IMAGE);
		path.set ("img/menu/Speluitleghover.png", "img/menu/Speluitleghover.png");
		type.set ("img/menu/Speluitleghover.png", AssetType.IMAGE);
		path.set ("img/menu/teleporter.png", "img/menu/teleporter.png");
		type.set ("img/menu/teleporter.png", AssetType.IMAGE);
		path.set ("img/menu/teleporterhover.png", "img/menu/teleporterhover.png");
		type.set ("img/menu/teleporterhover.png", AssetType.IMAGE);
		path.set ("img/placeholder100x50.jpg", "img/placeholder100x50.jpg");
		type.set ("img/placeholder100x50.jpg", AssetType.IMAGE);
		path.set ("img/placeholder50x50.jpg", "img/placeholder50x50.jpg");
		type.set ("img/placeholder50x50.jpg", AssetType.IMAGE);
		path.set ("img/placeholdergray100x50.jpg", "img/placeholdergray100x50.jpg");
		type.set ("img/placeholdergray100x50.jpg", AssetType.IMAGE);
		path.set ("img/planet2.png", "img/planet2.png");
		type.set ("img/planet2.png", AssetType.IMAGE);
		path.set ("img/ragdoll/headEave.png", "img/ragdoll/headEave.png");
		type.set ("img/ragdoll/headEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/headSteave.png", "img/ragdoll/headSteave.png");
		type.set ("img/ragdoll/headSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/lowerArmEave.png", "img/ragdoll/lowerArmEave.png");
		type.set ("img/ragdoll/lowerArmEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/lowerArmSteave.png", "img/ragdoll/lowerArmSteave.png");
		type.set ("img/ragdoll/lowerArmSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/lowerLegEave.png", "img/ragdoll/lowerLegEave.png");
		type.set ("img/ragdoll/lowerLegEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/lowerLegSteave.png", "img/ragdoll/lowerLegSteave.png");
		type.set ("img/ragdoll/lowerLegSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/torsoEave.png", "img/ragdoll/torsoEave.png");
		type.set ("img/ragdoll/torsoEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/torsoSteave.png", "img/ragdoll/torsoSteave.png");
		type.set ("img/ragdoll/torsoSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/upperArmEave.png", "img/ragdoll/upperArmEave.png");
		type.set ("img/ragdoll/upperArmEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/upperArmSteave.png", "img/ragdoll/upperArmSteave.png");
		type.set ("img/ragdoll/upperArmSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/upperLegEave.png", "img/ragdoll/upperLegEave.png");
		type.set ("img/ragdoll/upperLegEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/upperLegSteave.png", "img/ragdoll/upperLegSteave.png");
		type.set ("img/ragdoll/upperLegSteave.png", AssetType.IMAGE);
		path.set ("img/stars.png", "img/stars.png");
		type.set ("img/stars.png", AssetType.IMAGE);
		path.set ("img/steave.png", "img/steave.png");
		type.set ("img/steave.png", AssetType.IMAGE);
		path.set ("img/World/environment props.png", "img/World/environment props.png");
		type.set ("img/World/environment props.png", AssetType.IMAGE);
		path.set ("img/World/without.png", "img/World/without.png");
		type.set ("img/World/without.png", AssetType.IMAGE);
		path.set ("music/menu1uncut.wav", "music/menu1uncut.wav");
		type.set ("music/menu1uncut.wav", AssetType.SOUND);
		path.set ("music/music-goes-here.txt", "music/music-goes-here.txt");
		type.set ("music/music-goes-here.txt", AssetType.TEXT);
		path.set ("music/Story.wav", "music/Story.wav");
		type.set ("music/Story.wav", AssetType.SOUND);
		path.set ("music/teleport.wav", "music/teleport.wav");
		type.set ("music/teleport.wav", AssetType.SOUND);
		path.set ("music/worldsoundpeople.wav", "music/worldsoundpeople.wav");
		type.set ("music/worldsoundpeople.wav", AssetType.SOUND);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		id = "img/book/pageBook1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/book/pageBook2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/book/pageBook3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/book/pageBook4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/boxPlaceholder.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Credits.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Duwen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/monkeybutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/penguinbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/pigbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/sealbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Start.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Terug.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Tillen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/treebutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Trekken.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/turtlebutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/credits.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/monkeyDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/penguinDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/pigDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/sealDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/treeBranchDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/turtleDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Eave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/monkeyz.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/penguin.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/pig.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/seal.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/treeBranch.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/turtle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/armen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/benen feedback.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/hoofd torso.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/monkeyFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/monkeyFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/penguinFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/penguinFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/pigFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/pigFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/sealFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/sealFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/treebranchFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/treebranchFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/turtleFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/turtleFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/gameOver.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/health.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Heart1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Heart2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Heart3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Heart4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/howToPlay.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/hub1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/last planet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/mainMenu.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/menu room empty.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/menufinal.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/pickEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/pickHero.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/pickSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/prestatie.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/prestatiehover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/skuixoniabutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/speluitleg.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/Speluitleghover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/teleporter.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/teleporterhover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/placeholder100x50.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/placeholder50x50.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/placeholdergray100x50.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/planet2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/headEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/headSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/lowerArmEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/lowerArmSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/lowerLegEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/lowerLegSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/torsoEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/torsoSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/upperArmEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/upperArmSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/upperLegEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/upperLegSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/stars.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/steave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/World/environment props.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/World/without.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "music/menu1uncut.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "music/Story.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/teleport.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/worldsoundpeople.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		
		
		#else
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);

		#elseif (js || openfl_html5 || pixi)
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash


































































































#elseif html5


































































































#else

#if (windows || mac || linux)







#else




#end

#end


#else


package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("img/book/pageBook1.png", "img/book/pageBook1.png");
		type.set ("img/book/pageBook1.png", AssetType.IMAGE);
		path.set ("img/book/pageBook2.png", "img/book/pageBook2.png");
		type.set ("img/book/pageBook2.png", AssetType.IMAGE);
		path.set ("img/book/pageBook3.png", "img/book/pageBook3.png");
		type.set ("img/book/pageBook3.png", AssetType.IMAGE);
		path.set ("img/book/pageBook4.png", "img/book/pageBook4.png");
		type.set ("img/book/pageBook4.png", AssetType.IMAGE);
		path.set ("img/boxPlaceholder.png", "img/boxPlaceholder.png");
		type.set ("img/boxPlaceholder.png", AssetType.IMAGE);
		path.set ("img/buttons/Credits.png", "img/buttons/Credits.png");
		type.set ("img/buttons/Credits.png", AssetType.IMAGE);
		path.set ("img/buttons/Duwen.png", "img/buttons/Duwen.png");
		type.set ("img/buttons/Duwen.png", AssetType.IMAGE);
		path.set ("img/buttons/monkeybutton.png", "img/buttons/monkeybutton.png");
		type.set ("img/buttons/monkeybutton.png", AssetType.IMAGE);
		path.set ("img/buttons/penguinbutton.png", "img/buttons/penguinbutton.png");
		type.set ("img/buttons/penguinbutton.png", AssetType.IMAGE);
		path.set ("img/buttons/pigbutton.png", "img/buttons/pigbutton.png");
		type.set ("img/buttons/pigbutton.png", AssetType.IMAGE);
		path.set ("img/buttons/sealbutton.png", "img/buttons/sealbutton.png");
		type.set ("img/buttons/sealbutton.png", AssetType.IMAGE);
		path.set ("img/buttons/Start.png", "img/buttons/Start.png");
		type.set ("img/buttons/Start.png", AssetType.IMAGE);
		path.set ("img/buttons/Terug.png", "img/buttons/Terug.png");
		type.set ("img/buttons/Terug.png", AssetType.IMAGE);
		path.set ("img/buttons/Tillen.png", "img/buttons/Tillen.png");
		type.set ("img/buttons/Tillen.png", AssetType.IMAGE);
		path.set ("img/buttons/treebutton.png", "img/buttons/treebutton.png");
		type.set ("img/buttons/treebutton.png", AssetType.IMAGE);
		path.set ("img/buttons/Trekken.png", "img/buttons/Trekken.png");
		type.set ("img/buttons/Trekken.png", AssetType.IMAGE);
		path.set ("img/buttons/turtlebutton.png", "img/buttons/turtlebutton.png");
		type.set ("img/buttons/turtlebutton.png", AssetType.IMAGE);
		path.set ("img/credits.png", "img/credits.png");
		type.set ("img/credits.png", AssetType.IMAGE);
		path.set ("img/descriptions/monkeyDescription.png", "img/descriptions/monkeyDescription.png");
		type.set ("img/descriptions/monkeyDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/penguinDescription.png", "img/descriptions/penguinDescription.png");
		type.set ("img/descriptions/penguinDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/pigDescription.png", "img/descriptions/pigDescription.png");
		type.set ("img/descriptions/pigDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/sealDescription.png", "img/descriptions/sealDescription.png");
		type.set ("img/descriptions/sealDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/treeBranchDescription.png", "img/descriptions/treeBranchDescription.png");
		type.set ("img/descriptions/treeBranchDescription.png", AssetType.IMAGE);
		path.set ("img/descriptions/turtleDescription.png", "img/descriptions/turtleDescription.png");
		type.set ("img/descriptions/turtleDescription.png", AssetType.IMAGE);
		path.set ("img/Eave.png", "img/Eave.png");
		type.set ("img/Eave.png", AssetType.IMAGE);
		path.set ("img/events/monkeyz.png", "img/events/monkeyz.png");
		type.set ("img/events/monkeyz.png", AssetType.IMAGE);
		path.set ("img/events/penguin.png", "img/events/penguin.png");
		type.set ("img/events/penguin.png", AssetType.IMAGE);
		path.set ("img/events/pig.png", "img/events/pig.png");
		type.set ("img/events/pig.png", AssetType.IMAGE);
		path.set ("img/events/seal.png", "img/events/seal.png");
		type.set ("img/events/seal.png", AssetType.IMAGE);
		path.set ("img/events/treeBranch.png", "img/events/treeBranch.png");
		type.set ("img/events/treeBranch.png", AssetType.IMAGE);
		path.set ("img/events/turtle.png", "img/events/turtle.png");
		type.set ("img/events/turtle.png", AssetType.IMAGE);
		path.set ("img/feedback/armen.png", "img/feedback/armen.png");
		type.set ("img/feedback/armen.png", AssetType.IMAGE);
		path.set ("img/feedback/benen feedback.png", "img/feedback/benen feedback.png");
		type.set ("img/feedback/benen feedback.png", AssetType.IMAGE);
		path.set ("img/feedback/hoofd torso.png", "img/feedback/hoofd torso.png");
		type.set ("img/feedback/hoofd torso.png", AssetType.IMAGE);
		path.set ("img/feedback/monkeyFeedbackNegative.png", "img/feedback/monkeyFeedbackNegative.png");
		type.set ("img/feedback/monkeyFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/monkeyFeedbackPositive.png", "img/feedback/monkeyFeedbackPositive.png");
		type.set ("img/feedback/monkeyFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/penguinFeedbackNegative.png", "img/feedback/penguinFeedbackNegative.png");
		type.set ("img/feedback/penguinFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/penguinFeedbackPositive.png", "img/feedback/penguinFeedbackPositive.png");
		type.set ("img/feedback/penguinFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/pigFeedbackNegative.png", "img/feedback/pigFeedbackNegative.png");
		type.set ("img/feedback/pigFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/pigFeedbackPositive.png", "img/feedback/pigFeedbackPositive.png");
		type.set ("img/feedback/pigFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/sealFeedbackNegative.png", "img/feedback/sealFeedbackNegative.png");
		type.set ("img/feedback/sealFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/sealFeedbackPositive.png", "img/feedback/sealFeedbackPositive.png");
		type.set ("img/feedback/sealFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/treebranchFeedbackNegative.png", "img/feedback/treebranchFeedbackNegative.png");
		type.set ("img/feedback/treebranchFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/treebranchFeedbackPositive.png", "img/feedback/treebranchFeedbackPositive.png");
		type.set ("img/feedback/treebranchFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/feedback/turtleFeedbackNegative.png", "img/feedback/turtleFeedbackNegative.png");
		type.set ("img/feedback/turtleFeedbackNegative.png", AssetType.IMAGE);
		path.set ("img/feedback/turtleFeedbackPositive.png", "img/feedback/turtleFeedbackPositive.png");
		type.set ("img/feedback/turtleFeedbackPositive.png", AssetType.IMAGE);
		path.set ("img/gameOver.png", "img/gameOver.png");
		type.set ("img/gameOver.png", AssetType.IMAGE);
		path.set ("img/health.png", "img/health.png");
		type.set ("img/health.png", AssetType.IMAGE);
		path.set ("img/Heart1.png", "img/Heart1.png");
		type.set ("img/Heart1.png", AssetType.IMAGE);
		path.set ("img/Heart2.png", "img/Heart2.png");
		type.set ("img/Heart2.png", AssetType.IMAGE);
		path.set ("img/Heart3.png", "img/Heart3.png");
		type.set ("img/Heart3.png", AssetType.IMAGE);
		path.set ("img/Heart4.png", "img/Heart4.png");
		type.set ("img/Heart4.png", AssetType.IMAGE);
		path.set ("img/howToPlay.png", "img/howToPlay.png");
		type.set ("img/howToPlay.png", AssetType.IMAGE);
		path.set ("img/hub1.png", "img/hub1.png");
		type.set ("img/hub1.png", AssetType.IMAGE);
		path.set ("img/last planet.png", "img/last planet.png");
		type.set ("img/last planet.png", AssetType.IMAGE);
		path.set ("img/mainMenu.png", "img/mainMenu.png");
		type.set ("img/mainMenu.png", AssetType.IMAGE);
		path.set ("img/menu/menu room empty.png", "img/menu/menu room empty.png");
		type.set ("img/menu/menu room empty.png", AssetType.IMAGE);
		path.set ("img/menu/menufinal.png", "img/menu/menufinal.png");
		type.set ("img/menu/menufinal.png", AssetType.IMAGE);
		path.set ("img/menu/pickEave.png", "img/menu/pickEave.png");
		type.set ("img/menu/pickEave.png", AssetType.IMAGE);
		path.set ("img/menu/pickHero.png", "img/menu/pickHero.png");
		type.set ("img/menu/pickHero.png", AssetType.IMAGE);
		path.set ("img/menu/pickSteave.png", "img/menu/pickSteave.png");
		type.set ("img/menu/pickSteave.png", AssetType.IMAGE);
		path.set ("img/menu/prestatie.png", "img/menu/prestatie.png");
		type.set ("img/menu/prestatie.png", AssetType.IMAGE);
		path.set ("img/menu/prestatiehover.png", "img/menu/prestatiehover.png");
		type.set ("img/menu/prestatiehover.png", AssetType.IMAGE);
		path.set ("img/menu/skuixoniabutton.png", "img/menu/skuixoniabutton.png");
		type.set ("img/menu/skuixoniabutton.png", AssetType.IMAGE);
		path.set ("img/menu/speluitleg.png", "img/menu/speluitleg.png");
		type.set ("img/menu/speluitleg.png", AssetType.IMAGE);
		path.set ("img/menu/Speluitleghover.png", "img/menu/Speluitleghover.png");
		type.set ("img/menu/Speluitleghover.png", AssetType.IMAGE);
		path.set ("img/menu/teleporter.png", "img/menu/teleporter.png");
		type.set ("img/menu/teleporter.png", AssetType.IMAGE);
		path.set ("img/menu/teleporterhover.png", "img/menu/teleporterhover.png");
		type.set ("img/menu/teleporterhover.png", AssetType.IMAGE);
		path.set ("img/placeholder100x50.jpg", "img/placeholder100x50.jpg");
		type.set ("img/placeholder100x50.jpg", AssetType.IMAGE);
		path.set ("img/placeholder50x50.jpg", "img/placeholder50x50.jpg");
		type.set ("img/placeholder50x50.jpg", AssetType.IMAGE);
		path.set ("img/placeholdergray100x50.jpg", "img/placeholdergray100x50.jpg");
		type.set ("img/placeholdergray100x50.jpg", AssetType.IMAGE);
		path.set ("img/planet2.png", "img/planet2.png");
		type.set ("img/planet2.png", AssetType.IMAGE);
		path.set ("img/ragdoll/headEave.png", "img/ragdoll/headEave.png");
		type.set ("img/ragdoll/headEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/headSteave.png", "img/ragdoll/headSteave.png");
		type.set ("img/ragdoll/headSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/lowerArmEave.png", "img/ragdoll/lowerArmEave.png");
		type.set ("img/ragdoll/lowerArmEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/lowerArmSteave.png", "img/ragdoll/lowerArmSteave.png");
		type.set ("img/ragdoll/lowerArmSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/lowerLegEave.png", "img/ragdoll/lowerLegEave.png");
		type.set ("img/ragdoll/lowerLegEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/lowerLegSteave.png", "img/ragdoll/lowerLegSteave.png");
		type.set ("img/ragdoll/lowerLegSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/torsoEave.png", "img/ragdoll/torsoEave.png");
		type.set ("img/ragdoll/torsoEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/torsoSteave.png", "img/ragdoll/torsoSteave.png");
		type.set ("img/ragdoll/torsoSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/upperArmEave.png", "img/ragdoll/upperArmEave.png");
		type.set ("img/ragdoll/upperArmEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/upperArmSteave.png", "img/ragdoll/upperArmSteave.png");
		type.set ("img/ragdoll/upperArmSteave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/upperLegEave.png", "img/ragdoll/upperLegEave.png");
		type.set ("img/ragdoll/upperLegEave.png", AssetType.IMAGE);
		path.set ("img/ragdoll/upperLegSteave.png", "img/ragdoll/upperLegSteave.png");
		type.set ("img/ragdoll/upperLegSteave.png", AssetType.IMAGE);
		path.set ("img/stars.png", "img/stars.png");
		type.set ("img/stars.png", AssetType.IMAGE);
		path.set ("img/steave.png", "img/steave.png");
		type.set ("img/steave.png", AssetType.IMAGE);
		path.set ("img/World/environment props.png", "img/World/environment props.png");
		type.set ("img/World/environment props.png", AssetType.IMAGE);
		path.set ("img/World/without.png", "img/World/without.png");
		type.set ("img/World/without.png", AssetType.IMAGE);
		path.set ("music/menu1uncut.wav", "music/menu1uncut.wav");
		type.set ("music/menu1uncut.wav", AssetType.SOUND);
		path.set ("music/music-goes-here.txt", "music/music-goes-here.txt");
		type.set ("music/music-goes-here.txt", AssetType.TEXT);
		path.set ("music/Story.wav", "music/Story.wav");
		type.set ("music/Story.wav", AssetType.SOUND);
		path.set ("music/teleport.wav", "music/teleport.wav");
		type.set ("music/teleport.wav", AssetType.SOUND);
		path.set ("music/worldsoundpeople.wav", "music/worldsoundpeople.wav");
		type.set ("music/worldsoundpeople.wav", AssetType.SOUND);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		id = "img/book/pageBook1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/book/pageBook2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/book/pageBook3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/book/pageBook4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/boxPlaceholder.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Credits.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Duwen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/monkeybutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/penguinbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/pigbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/sealbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Start.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Terug.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Tillen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/treebutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/Trekken.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/buttons/turtlebutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/credits.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/monkeyDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/penguinDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/pigDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/sealDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/treeBranchDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/descriptions/turtleDescription.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Eave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/monkeyz.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/penguin.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/pig.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/seal.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/treeBranch.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/events/turtle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/armen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/benen feedback.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/hoofd torso.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/monkeyFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/monkeyFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/penguinFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/penguinFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/pigFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/pigFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/sealFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/sealFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/treebranchFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/treebranchFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/turtleFeedbackNegative.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/feedback/turtleFeedbackPositive.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/gameOver.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/health.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Heart1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Heart2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Heart3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Heart4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/howToPlay.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/hub1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/last planet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/mainMenu.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/menu room empty.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/menufinal.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/pickEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/pickHero.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/pickSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/prestatie.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/prestatiehover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/skuixoniabutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/speluitleg.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/Speluitleghover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/teleporter.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/menu/teleporterhover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/placeholder100x50.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/placeholder50x50.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/placeholdergray100x50.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/planet2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/headEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/headSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/lowerArmEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/lowerArmSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/lowerLegEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/lowerLegSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/torsoEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/torsoSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/upperArmEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/upperArmSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/upperLegEave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ragdoll/upperLegSteave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/stars.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/steave.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/World/environment props.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/World/without.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "music/menu1uncut.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "music/Story.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/teleport.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/worldsoundpeople.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash


































































































#elseif html5


































































































#else



#if (windows || mac || linux)





#end

#if openfl

#end

#end
#end


#end