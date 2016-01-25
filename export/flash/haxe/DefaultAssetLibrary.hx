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
		
		className.set ("img/book/pageBook1.png", __ASSET__img_book_pagebook1_png);
		type.set ("img/book/pageBook1.png", AssetType.IMAGE);
		className.set ("img/book/pageBook2.png", __ASSET__img_book_pagebook2_png);
		type.set ("img/book/pageBook2.png", AssetType.IMAGE);
		className.set ("img/book/pageBook3.png", __ASSET__img_book_pagebook3_png);
		type.set ("img/book/pageBook3.png", AssetType.IMAGE);
		className.set ("img/book/pageBook4.png", __ASSET__img_book_pagebook4_png);
		type.set ("img/book/pageBook4.png", AssetType.IMAGE);
		className.set ("img/boxPlaceholder.png", __ASSET__img_boxplaceholder_png);
		type.set ("img/boxPlaceholder.png", AssetType.IMAGE);
		className.set ("img/buttons/Credits.png", __ASSET__img_buttons_credits_png);
		type.set ("img/buttons/Credits.png", AssetType.IMAGE);
		className.set ("img/buttons/Duwen.png", __ASSET__img_buttons_duwen_png);
		type.set ("img/buttons/Duwen.png", AssetType.IMAGE);
		className.set ("img/buttons/monkeybutton.png", __ASSET__img_buttons_monkeybutton_png);
		type.set ("img/buttons/monkeybutton.png", AssetType.IMAGE);
		className.set ("img/buttons/penguinbutton.png", __ASSET__img_buttons_penguinbutton_png);
		type.set ("img/buttons/penguinbutton.png", AssetType.IMAGE);
		className.set ("img/buttons/pigbutton.png", __ASSET__img_buttons_pigbutton_png);
		type.set ("img/buttons/pigbutton.png", AssetType.IMAGE);
		className.set ("img/buttons/sealbutton.png", __ASSET__img_buttons_sealbutton_png);
		type.set ("img/buttons/sealbutton.png", AssetType.IMAGE);
		className.set ("img/buttons/Start.png", __ASSET__img_buttons_start_png);
		type.set ("img/buttons/Start.png", AssetType.IMAGE);
		className.set ("img/buttons/Terug.png", __ASSET__img_buttons_terug_png);
		type.set ("img/buttons/Terug.png", AssetType.IMAGE);
		className.set ("img/buttons/Tillen.png", __ASSET__img_buttons_tillen_png);
		type.set ("img/buttons/Tillen.png", AssetType.IMAGE);
		className.set ("img/buttons/treebutton.png", __ASSET__img_buttons_treebutton_png);
		type.set ("img/buttons/treebutton.png", AssetType.IMAGE);
		className.set ("img/buttons/Trekken.png", __ASSET__img_buttons_trekken_png);
		type.set ("img/buttons/Trekken.png", AssetType.IMAGE);
		className.set ("img/buttons/turtlebutton.png", __ASSET__img_buttons_turtlebutton_png);
		type.set ("img/buttons/turtlebutton.png", AssetType.IMAGE);
		className.set ("img/credits.png", __ASSET__img_credits_png);
		type.set ("img/credits.png", AssetType.IMAGE);
		className.set ("img/descriptions/monkeyDescription.png", __ASSET__img_descriptions_monkeydescription_png);
		type.set ("img/descriptions/monkeyDescription.png", AssetType.IMAGE);
		className.set ("img/descriptions/penguinDescription.png", __ASSET__img_descriptions_penguindescription_png);
		type.set ("img/descriptions/penguinDescription.png", AssetType.IMAGE);
		className.set ("img/descriptions/pigDescription.png", __ASSET__img_descriptions_pigdescription_png);
		type.set ("img/descriptions/pigDescription.png", AssetType.IMAGE);
		className.set ("img/descriptions/sealDescription.png", __ASSET__img_descriptions_sealdescription_png);
		type.set ("img/descriptions/sealDescription.png", AssetType.IMAGE);
		className.set ("img/descriptions/treeBranchDescription.png", __ASSET__img_descriptions_treebranchdescription_png);
		type.set ("img/descriptions/treeBranchDescription.png", AssetType.IMAGE);
		className.set ("img/descriptions/turtleDescription.png", __ASSET__img_descriptions_turtledescription_png);
		type.set ("img/descriptions/turtleDescription.png", AssetType.IMAGE);
		className.set ("img/events/monkeyz.png", __ASSET__img_events_monkeyz_png);
		type.set ("img/events/monkeyz.png", AssetType.IMAGE);
		className.set ("img/events/penguin.png", __ASSET__img_events_penguin_png);
		type.set ("img/events/penguin.png", AssetType.IMAGE);
		className.set ("img/events/pig.png", __ASSET__img_events_pig_png);
		type.set ("img/events/pig.png", AssetType.IMAGE);
		className.set ("img/events/seal.png", __ASSET__img_events_seal_png);
		type.set ("img/events/seal.png", AssetType.IMAGE);
		className.set ("img/events/treeBranch.png", __ASSET__img_events_treebranch_png);
		type.set ("img/events/treeBranch.png", AssetType.IMAGE);
		className.set ("img/events/turtle.png", __ASSET__img_events_turtle_png);
		type.set ("img/events/turtle.png", AssetType.IMAGE);
		className.set ("img/feedback/monkeyFeedbackNegative.png", __ASSET__img_feedback_monkeyfeedbacknegative_png);
		type.set ("img/feedback/monkeyFeedbackNegative.png", AssetType.IMAGE);
		className.set ("img/feedback/monkeyFeedbackPositive.png", __ASSET__img_feedback_monkeyfeedbackpositive_png);
		type.set ("img/feedback/monkeyFeedbackPositive.png", AssetType.IMAGE);
		className.set ("img/feedback/penguinFeedbackNegative.png", __ASSET__img_feedback_penguinfeedbacknegative_png);
		type.set ("img/feedback/penguinFeedbackNegative.png", AssetType.IMAGE);
		className.set ("img/feedback/penguinFeedbackPositive.png", __ASSET__img_feedback_penguinfeedbackpositive_png);
		type.set ("img/feedback/penguinFeedbackPositive.png", AssetType.IMAGE);
		className.set ("img/feedback/pigFeedbackNegative.png", __ASSET__img_feedback_pigfeedbacknegative_png);
		type.set ("img/feedback/pigFeedbackNegative.png", AssetType.IMAGE);
		className.set ("img/feedback/pigFeedbackPositive.png", __ASSET__img_feedback_pigfeedbackpositive_png);
		type.set ("img/feedback/pigFeedbackPositive.png", AssetType.IMAGE);
		className.set ("img/feedback/sealFeedbackNegative.png", __ASSET__img_feedback_sealfeedbacknegative_png);
		type.set ("img/feedback/sealFeedbackNegative.png", AssetType.IMAGE);
		className.set ("img/feedback/sealFeedbackPositive.png", __ASSET__img_feedback_sealfeedbackpositive_png);
		type.set ("img/feedback/sealFeedbackPositive.png", AssetType.IMAGE);
		className.set ("img/feedback/treebranchFeedbackNegative.png", __ASSET__img_feedback_treebranchfeedbacknegative_png);
		type.set ("img/feedback/treebranchFeedbackNegative.png", AssetType.IMAGE);
		className.set ("img/feedback/treebranchFeedbackPositive.png", __ASSET__img_feedback_treebranchfeedbackpositive_png);
		type.set ("img/feedback/treebranchFeedbackPositive.png", AssetType.IMAGE);
		className.set ("img/feedback/turtleFeedbackNegative.png", __ASSET__img_feedback_turtlefeedbacknegative_png);
		type.set ("img/feedback/turtleFeedbackNegative.png", AssetType.IMAGE);
		className.set ("img/feedback/turtleFeedbackPositive.png", __ASSET__img_feedback_turtlefeedbackpositive_png);
		type.set ("img/feedback/turtleFeedbackPositive.png", AssetType.IMAGE);
		className.set ("img/gameOver.png", __ASSET__img_gameover_png);
		type.set ("img/gameOver.png", AssetType.IMAGE);
		className.set ("img/head.png", __ASSET__img_head_png);
		type.set ("img/head.png", AssetType.IMAGE);
		className.set ("img/health.png", __ASSET__img_health_png);
		type.set ("img/health.png", AssetType.IMAGE);
		className.set ("img/Heart1.png", __ASSET__img_heart1_png);
		type.set ("img/Heart1.png", AssetType.IMAGE);
		className.set ("img/Heart2.png", __ASSET__img_heart2_png);
		type.set ("img/Heart2.png", AssetType.IMAGE);
		className.set ("img/Heart3.png", __ASSET__img_heart3_png);
		type.set ("img/Heart3.png", AssetType.IMAGE);
		className.set ("img/Heart4.png", __ASSET__img_heart4_png);
		type.set ("img/Heart4.png", AssetType.IMAGE);
		className.set ("img/howToPlay.png", __ASSET__img_howtoplay_png);
		type.set ("img/howToPlay.png", AssetType.IMAGE);
		className.set ("img/hub1.png", __ASSET__img_hub1_png);
		type.set ("img/hub1.png", AssetType.IMAGE);
		className.set ("img/lowerArm.png", __ASSET__img_lowerarm_png);
		type.set ("img/lowerArm.png", AssetType.IMAGE);
		className.set ("img/lowerLeg.png", __ASSET__img_lowerleg_png);
		type.set ("img/lowerLeg.png", AssetType.IMAGE);
		className.set ("img/mainMenu.png", __ASSET__img_mainmenu_png);
		type.set ("img/mainMenu.png", AssetType.IMAGE);
		className.set ("img/menu/menu room empty.png", __ASSET__img_menu_menu_room_empty_png);
		type.set ("img/menu/menu room empty.png", AssetType.IMAGE);
		className.set ("img/menu/menufinal.png", __ASSET__img_menu_menufinal_png);
		type.set ("img/menu/menufinal.png", AssetType.IMAGE);
		className.set ("img/menu/prestatie.png", __ASSET__img_menu_prestatie_png);
		type.set ("img/menu/prestatie.png", AssetType.IMAGE);
		className.set ("img/menu/prestatiehover.png", __ASSET__img_menu_prestatiehover_png);
		type.set ("img/menu/prestatiehover.png", AssetType.IMAGE);
		className.set ("img/menu/speluitleg.png", __ASSET__img_menu_speluitleg_png);
		type.set ("img/menu/speluitleg.png", AssetType.IMAGE);
		className.set ("img/menu/Speluitleghover.png", __ASSET__img_menu_speluitleghover_png);
		type.set ("img/menu/Speluitleghover.png", AssetType.IMAGE);
		className.set ("img/menu/teleporter.png", __ASSET__img_menu_teleporter_png);
		type.set ("img/menu/teleporter.png", AssetType.IMAGE);
		className.set ("img/menu/teleporterhover.png", __ASSET__img_menu_teleporterhover_png);
		type.set ("img/menu/teleporterhover.png", AssetType.IMAGE);
		className.set ("img/placeholder100x50.jpg", __ASSET__img_placeholder100x50_jpg);
		type.set ("img/placeholder100x50.jpg", AssetType.IMAGE);
		className.set ("img/placeholder50x50.jpg", __ASSET__img_placeholder50x50_jpg);
		type.set ("img/placeholder50x50.jpg", AssetType.IMAGE);
		className.set ("img/placeholdergray100x50.jpg", __ASSET__img_placeholdergray100x50_jpg);
		type.set ("img/placeholdergray100x50.jpg", AssetType.IMAGE);
		className.set ("img/steave.png", __ASSET__img_steave_png);
		type.set ("img/steave.png", AssetType.IMAGE);
		className.set ("img/torso.png", __ASSET__img_torso_png);
		type.set ("img/torso.png", AssetType.IMAGE);
		className.set ("img/upperArm.png", __ASSET__img_upperarm_png);
		type.set ("img/upperArm.png", AssetType.IMAGE);
		className.set ("img/upperLeg.png", __ASSET__img_upperleg_png);
		type.set ("img/upperLeg.png", AssetType.IMAGE);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
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
		id = "img/head.png";
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
		id = "img/lowerArm.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/lowerLeg.png";
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
		id = "img/menu/prestatie.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/menu/prestatiehover.png";
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
		id = "img/steave.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/torso.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/upperArm.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/upperLeg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
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
		
		className.set ("img/book/pageBook1.png", __ASSET__img_book_pagebook1_png);
		type.set ("img/book/pageBook1.png", AssetType.IMAGE);
		
		className.set ("img/book/pageBook2.png", __ASSET__img_book_pagebook2_png);
		type.set ("img/book/pageBook2.png", AssetType.IMAGE);
		
		className.set ("img/book/pageBook3.png", __ASSET__img_book_pagebook3_png);
		type.set ("img/book/pageBook3.png", AssetType.IMAGE);
		
		className.set ("img/book/pageBook4.png", __ASSET__img_book_pagebook4_png);
		type.set ("img/book/pageBook4.png", AssetType.IMAGE);
		
		className.set ("img/boxPlaceholder.png", __ASSET__img_boxplaceholder_png);
		type.set ("img/boxPlaceholder.png", AssetType.IMAGE);
		
		className.set ("img/buttons/Credits.png", __ASSET__img_buttons_credits_png);
		type.set ("img/buttons/Credits.png", AssetType.IMAGE);
		
		className.set ("img/buttons/Duwen.png", __ASSET__img_buttons_duwen_png);
		type.set ("img/buttons/Duwen.png", AssetType.IMAGE);
		
		className.set ("img/buttons/monkeybutton.png", __ASSET__img_buttons_monkeybutton_png);
		type.set ("img/buttons/monkeybutton.png", AssetType.IMAGE);
		
		className.set ("img/buttons/penguinbutton.png", __ASSET__img_buttons_penguinbutton_png);
		type.set ("img/buttons/penguinbutton.png", AssetType.IMAGE);
		
		className.set ("img/buttons/pigbutton.png", __ASSET__img_buttons_pigbutton_png);
		type.set ("img/buttons/pigbutton.png", AssetType.IMAGE);
		
		className.set ("img/buttons/sealbutton.png", __ASSET__img_buttons_sealbutton_png);
		type.set ("img/buttons/sealbutton.png", AssetType.IMAGE);
		
		className.set ("img/buttons/Start.png", __ASSET__img_buttons_start_png);
		type.set ("img/buttons/Start.png", AssetType.IMAGE);
		
		className.set ("img/buttons/Terug.png", __ASSET__img_buttons_terug_png);
		type.set ("img/buttons/Terug.png", AssetType.IMAGE);
		
		className.set ("img/buttons/Tillen.png", __ASSET__img_buttons_tillen_png);
		type.set ("img/buttons/Tillen.png", AssetType.IMAGE);
		
		className.set ("img/buttons/treebutton.png", __ASSET__img_buttons_treebutton_png);
		type.set ("img/buttons/treebutton.png", AssetType.IMAGE);
		
		className.set ("img/buttons/Trekken.png", __ASSET__img_buttons_trekken_png);
		type.set ("img/buttons/Trekken.png", AssetType.IMAGE);
		
		className.set ("img/buttons/turtlebutton.png", __ASSET__img_buttons_turtlebutton_png);
		type.set ("img/buttons/turtlebutton.png", AssetType.IMAGE);
		
		className.set ("img/credits.png", __ASSET__img_credits_png);
		type.set ("img/credits.png", AssetType.IMAGE);
		
		className.set ("img/descriptions/monkeyDescription.png", __ASSET__img_descriptions_monkeydescription_png);
		type.set ("img/descriptions/monkeyDescription.png", AssetType.IMAGE);
		
		className.set ("img/descriptions/penguinDescription.png", __ASSET__img_descriptions_penguindescription_png);
		type.set ("img/descriptions/penguinDescription.png", AssetType.IMAGE);
		
		className.set ("img/descriptions/pigDescription.png", __ASSET__img_descriptions_pigdescription_png);
		type.set ("img/descriptions/pigDescription.png", AssetType.IMAGE);
		
		className.set ("img/descriptions/sealDescription.png", __ASSET__img_descriptions_sealdescription_png);
		type.set ("img/descriptions/sealDescription.png", AssetType.IMAGE);
		
		className.set ("img/descriptions/treeBranchDescription.png", __ASSET__img_descriptions_treebranchdescription_png);
		type.set ("img/descriptions/treeBranchDescription.png", AssetType.IMAGE);
		
		className.set ("img/descriptions/turtleDescription.png", __ASSET__img_descriptions_turtledescription_png);
		type.set ("img/descriptions/turtleDescription.png", AssetType.IMAGE);
		
		className.set ("img/events/monkeyz.png", __ASSET__img_events_monkeyz_png);
		type.set ("img/events/monkeyz.png", AssetType.IMAGE);
		
		className.set ("img/events/penguin.png", __ASSET__img_events_penguin_png);
		type.set ("img/events/penguin.png", AssetType.IMAGE);
		
		className.set ("img/events/pig.png", __ASSET__img_events_pig_png);
		type.set ("img/events/pig.png", AssetType.IMAGE);
		
		className.set ("img/events/seal.png", __ASSET__img_events_seal_png);
		type.set ("img/events/seal.png", AssetType.IMAGE);
		
		className.set ("img/events/treeBranch.png", __ASSET__img_events_treebranch_png);
		type.set ("img/events/treeBranch.png", AssetType.IMAGE);
		
		className.set ("img/events/turtle.png", __ASSET__img_events_turtle_png);
		type.set ("img/events/turtle.png", AssetType.IMAGE);
		
		className.set ("img/feedback/monkeyFeedbackNegative.png", __ASSET__img_feedback_monkeyfeedbacknegative_png);
		type.set ("img/feedback/monkeyFeedbackNegative.png", AssetType.IMAGE);
		
		className.set ("img/feedback/monkeyFeedbackPositive.png", __ASSET__img_feedback_monkeyfeedbackpositive_png);
		type.set ("img/feedback/monkeyFeedbackPositive.png", AssetType.IMAGE);
		
		className.set ("img/feedback/penguinFeedbackNegative.png", __ASSET__img_feedback_penguinfeedbacknegative_png);
		type.set ("img/feedback/penguinFeedbackNegative.png", AssetType.IMAGE);
		
		className.set ("img/feedback/penguinFeedbackPositive.png", __ASSET__img_feedback_penguinfeedbackpositive_png);
		type.set ("img/feedback/penguinFeedbackPositive.png", AssetType.IMAGE);
		
		className.set ("img/feedback/pigFeedbackNegative.png", __ASSET__img_feedback_pigfeedbacknegative_png);
		type.set ("img/feedback/pigFeedbackNegative.png", AssetType.IMAGE);
		
		className.set ("img/feedback/pigFeedbackPositive.png", __ASSET__img_feedback_pigfeedbackpositive_png);
		type.set ("img/feedback/pigFeedbackPositive.png", AssetType.IMAGE);
		
		className.set ("img/feedback/sealFeedbackNegative.png", __ASSET__img_feedback_sealfeedbacknegative_png);
		type.set ("img/feedback/sealFeedbackNegative.png", AssetType.IMAGE);
		
		className.set ("img/feedback/sealFeedbackPositive.png", __ASSET__img_feedback_sealfeedbackpositive_png);
		type.set ("img/feedback/sealFeedbackPositive.png", AssetType.IMAGE);
		
		className.set ("img/feedback/treebranchFeedbackNegative.png", __ASSET__img_feedback_treebranchfeedbacknegative_png);
		type.set ("img/feedback/treebranchFeedbackNegative.png", AssetType.IMAGE);
		
		className.set ("img/feedback/treebranchFeedbackPositive.png", __ASSET__img_feedback_treebranchfeedbackpositive_png);
		type.set ("img/feedback/treebranchFeedbackPositive.png", AssetType.IMAGE);
		
		className.set ("img/feedback/turtleFeedbackNegative.png", __ASSET__img_feedback_turtlefeedbacknegative_png);
		type.set ("img/feedback/turtleFeedbackNegative.png", AssetType.IMAGE);
		
		className.set ("img/feedback/turtleFeedbackPositive.png", __ASSET__img_feedback_turtlefeedbackpositive_png);
		type.set ("img/feedback/turtleFeedbackPositive.png", AssetType.IMAGE);
		
		className.set ("img/gameOver.png", __ASSET__img_gameover_png);
		type.set ("img/gameOver.png", AssetType.IMAGE);
		
		className.set ("img/head.png", __ASSET__img_head_png);
		type.set ("img/head.png", AssetType.IMAGE);
		
		className.set ("img/health.png", __ASSET__img_health_png);
		type.set ("img/health.png", AssetType.IMAGE);
		
		className.set ("img/Heart1.png", __ASSET__img_heart1_png);
		type.set ("img/Heart1.png", AssetType.IMAGE);
		
		className.set ("img/Heart2.png", __ASSET__img_heart2_png);
		type.set ("img/Heart2.png", AssetType.IMAGE);
		
		className.set ("img/Heart3.png", __ASSET__img_heart3_png);
		type.set ("img/Heart3.png", AssetType.IMAGE);
		
		className.set ("img/Heart4.png", __ASSET__img_heart4_png);
		type.set ("img/Heart4.png", AssetType.IMAGE);
		
		className.set ("img/howToPlay.png", __ASSET__img_howtoplay_png);
		type.set ("img/howToPlay.png", AssetType.IMAGE);
		
		className.set ("img/hub1.png", __ASSET__img_hub1_png);
		type.set ("img/hub1.png", AssetType.IMAGE);
		
		className.set ("img/lowerArm.png", __ASSET__img_lowerarm_png);
		type.set ("img/lowerArm.png", AssetType.IMAGE);
		
		className.set ("img/lowerLeg.png", __ASSET__img_lowerleg_png);
		type.set ("img/lowerLeg.png", AssetType.IMAGE);
		
		className.set ("img/mainMenu.png", __ASSET__img_mainmenu_png);
		type.set ("img/mainMenu.png", AssetType.IMAGE);
		
		className.set ("img/menu/menu room empty.png", __ASSET__img_menu_menu_room_empty_png);
		type.set ("img/menu/menu room empty.png", AssetType.IMAGE);
		
		className.set ("img/menu/menufinal.png", __ASSET__img_menu_menufinal_png);
		type.set ("img/menu/menufinal.png", AssetType.IMAGE);
		
		className.set ("img/menu/prestatie.png", __ASSET__img_menu_prestatie_png);
		type.set ("img/menu/prestatie.png", AssetType.IMAGE);
		
		className.set ("img/menu/prestatiehover.png", __ASSET__img_menu_prestatiehover_png);
		type.set ("img/menu/prestatiehover.png", AssetType.IMAGE);
		
		className.set ("img/menu/speluitleg.png", __ASSET__img_menu_speluitleg_png);
		type.set ("img/menu/speluitleg.png", AssetType.IMAGE);
		
		className.set ("img/menu/Speluitleghover.png", __ASSET__img_menu_speluitleghover_png);
		type.set ("img/menu/Speluitleghover.png", AssetType.IMAGE);
		
		className.set ("img/menu/teleporter.png", __ASSET__img_menu_teleporter_png);
		type.set ("img/menu/teleporter.png", AssetType.IMAGE);
		
		className.set ("img/menu/teleporterhover.png", __ASSET__img_menu_teleporterhover_png);
		type.set ("img/menu/teleporterhover.png", AssetType.IMAGE);
		
		className.set ("img/placeholder100x50.jpg", __ASSET__img_placeholder100x50_jpg);
		type.set ("img/placeholder100x50.jpg", AssetType.IMAGE);
		
		className.set ("img/placeholder50x50.jpg", __ASSET__img_placeholder50x50_jpg);
		type.set ("img/placeholder50x50.jpg", AssetType.IMAGE);
		
		className.set ("img/placeholdergray100x50.jpg", __ASSET__img_placeholdergray100x50_jpg);
		type.set ("img/placeholdergray100x50.jpg", AssetType.IMAGE);
		
		className.set ("img/steave.png", __ASSET__img_steave_png);
		type.set ("img/steave.png", AssetType.IMAGE);
		
		className.set ("img/torso.png", __ASSET__img_torso_png);
		type.set ("img/torso.png", AssetType.IMAGE);
		
		className.set ("img/upperArm.png", __ASSET__img_upperarm_png);
		type.set ("img/upperArm.png", AssetType.IMAGE);
		
		className.set ("img/upperLeg.png", __ASSET__img_upperleg_png);
		type.set ("img/upperLeg.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
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

@:keep @:bind #if display private #end class __ASSET__img_book_pagebook1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_book_pagebook2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_book_pagebook3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_book_pagebook4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_boxplaceholder_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_credits_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_duwen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_monkeybutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_penguinbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_pigbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_sealbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_start_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_terug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_tillen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_treebutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_trekken_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttons_turtlebutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_credits_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_descriptions_monkeydescription_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_descriptions_penguindescription_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_descriptions_pigdescription_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_descriptions_sealdescription_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_descriptions_treebranchdescription_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_descriptions_turtledescription_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_events_monkeyz_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_events_penguin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_events_pig_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_events_seal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_events_treebranch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_events_turtle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_monkeyfeedbacknegative_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_monkeyfeedbackpositive_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_penguinfeedbacknegative_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_penguinfeedbackpositive_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_pigfeedbacknegative_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_pigfeedbackpositive_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_sealfeedbacknegative_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_sealfeedbackpositive_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_treebranchfeedbacknegative_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_treebranchfeedbackpositive_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_turtlefeedbacknegative_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_feedback_turtlefeedbackpositive_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_head_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_heart1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_heart2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_heart3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_heart4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_howtoplay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_hub1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lowerarm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lowerleg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_mainmenu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_menu_room_empty_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_menufinal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_prestatie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_prestatiehover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_speluitleg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_speluitleghover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_teleporter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_teleporterhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_placeholder100x50_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_placeholder50x50_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_placeholdergray100x50_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_steave_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_torso_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_upperarm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_upperleg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5










































































#else



#if (windows || mac || linux)


@:image("assets/images/book/pageBook1.png") #if display private #end class __ASSET__img_book_pagebook1_png extends lime.graphics.Image {}
@:image("assets/images/book/pageBook2.png") #if display private #end class __ASSET__img_book_pagebook2_png extends lime.graphics.Image {}
@:image("assets/images/book/pageBook3.png") #if display private #end class __ASSET__img_book_pagebook3_png extends lime.graphics.Image {}
@:image("assets/images/book/pageBook4.png") #if display private #end class __ASSET__img_book_pagebook4_png extends lime.graphics.Image {}
@:image("assets/images/boxPlaceholder.png") #if display private #end class __ASSET__img_boxplaceholder_png extends lime.graphics.Image {}
@:image("assets/images/buttons/Credits.png") #if display private #end class __ASSET__img_buttons_credits_png extends lime.graphics.Image {}
@:image("assets/images/buttons/Duwen.png") #if display private #end class __ASSET__img_buttons_duwen_png extends lime.graphics.Image {}
@:image("assets/images/buttons/monkeybutton.png") #if display private #end class __ASSET__img_buttons_monkeybutton_png extends lime.graphics.Image {}
@:image("assets/images/buttons/penguinbutton.png") #if display private #end class __ASSET__img_buttons_penguinbutton_png extends lime.graphics.Image {}
@:image("assets/images/buttons/pigbutton.png") #if display private #end class __ASSET__img_buttons_pigbutton_png extends lime.graphics.Image {}
@:image("assets/images/buttons/sealbutton.png") #if display private #end class __ASSET__img_buttons_sealbutton_png extends lime.graphics.Image {}
@:image("assets/images/buttons/Start.png") #if display private #end class __ASSET__img_buttons_start_png extends lime.graphics.Image {}
@:image("assets/images/buttons/Terug.png") #if display private #end class __ASSET__img_buttons_terug_png extends lime.graphics.Image {}
@:image("assets/images/buttons/Tillen.png") #if display private #end class __ASSET__img_buttons_tillen_png extends lime.graphics.Image {}
@:image("assets/images/buttons/treebutton.png") #if display private #end class __ASSET__img_buttons_treebutton_png extends lime.graphics.Image {}
@:image("assets/images/buttons/Trekken.png") #if display private #end class __ASSET__img_buttons_trekken_png extends lime.graphics.Image {}
@:image("assets/images/buttons/turtlebutton.png") #if display private #end class __ASSET__img_buttons_turtlebutton_png extends lime.graphics.Image {}
@:image("assets/images/credits.png") #if display private #end class __ASSET__img_credits_png extends lime.graphics.Image {}
@:image("assets/images/descriptions/monkeyDescription.png") #if display private #end class __ASSET__img_descriptions_monkeydescription_png extends lime.graphics.Image {}
@:image("assets/images/descriptions/penguinDescription.png") #if display private #end class __ASSET__img_descriptions_penguindescription_png extends lime.graphics.Image {}
@:image("assets/images/descriptions/pigDescription.png") #if display private #end class __ASSET__img_descriptions_pigdescription_png extends lime.graphics.Image {}
@:image("assets/images/descriptions/sealDescription.png") #if display private #end class __ASSET__img_descriptions_sealdescription_png extends lime.graphics.Image {}
@:image("assets/images/descriptions/treeBranchDescription.png") #if display private #end class __ASSET__img_descriptions_treebranchdescription_png extends lime.graphics.Image {}
@:image("assets/images/descriptions/turtleDescription.png") #if display private #end class __ASSET__img_descriptions_turtledescription_png extends lime.graphics.Image {}
@:image("assets/images/events/monkeyz.png") #if display private #end class __ASSET__img_events_monkeyz_png extends lime.graphics.Image {}
@:image("assets/images/events/penguin.png") #if display private #end class __ASSET__img_events_penguin_png extends lime.graphics.Image {}
@:image("assets/images/events/pig.png") #if display private #end class __ASSET__img_events_pig_png extends lime.graphics.Image {}
@:image("assets/images/events/seal.png") #if display private #end class __ASSET__img_events_seal_png extends lime.graphics.Image {}
@:image("assets/images/events/treeBranch.png") #if display private #end class __ASSET__img_events_treebranch_png extends lime.graphics.Image {}
@:image("assets/images/events/turtle.png") #if display private #end class __ASSET__img_events_turtle_png extends lime.graphics.Image {}
@:image("assets/images/feedback/monkeyFeedbackNegative.png") #if display private #end class __ASSET__img_feedback_monkeyfeedbacknegative_png extends lime.graphics.Image {}
@:image("assets/images/feedback/monkeyFeedbackPositive.png") #if display private #end class __ASSET__img_feedback_monkeyfeedbackpositive_png extends lime.graphics.Image {}
@:image("assets/images/feedback/penguinFeedbackNegative.png") #if display private #end class __ASSET__img_feedback_penguinfeedbacknegative_png extends lime.graphics.Image {}
@:image("assets/images/feedback/penguinFeedbackPositive.png") #if display private #end class __ASSET__img_feedback_penguinfeedbackpositive_png extends lime.graphics.Image {}
@:image("assets/images/feedback/pigFeedbackNegative.png") #if display private #end class __ASSET__img_feedback_pigfeedbacknegative_png extends lime.graphics.Image {}
@:image("assets/images/feedback/pigFeedbackPositive.png") #if display private #end class __ASSET__img_feedback_pigfeedbackpositive_png extends lime.graphics.Image {}
@:image("assets/images/feedback/sealFeedbackNegative.png") #if display private #end class __ASSET__img_feedback_sealfeedbacknegative_png extends lime.graphics.Image {}
@:image("assets/images/feedback/sealFeedbackPositive.png") #if display private #end class __ASSET__img_feedback_sealfeedbackpositive_png extends lime.graphics.Image {}
@:image("assets/images/feedback/treebranchFeedbackNegative.png") #if display private #end class __ASSET__img_feedback_treebranchfeedbacknegative_png extends lime.graphics.Image {}
@:image("assets/images/feedback/treebranchFeedbackPositive.png") #if display private #end class __ASSET__img_feedback_treebranchfeedbackpositive_png extends lime.graphics.Image {}
@:image("assets/images/feedback/turtleFeedbackNegative.png") #if display private #end class __ASSET__img_feedback_turtlefeedbacknegative_png extends lime.graphics.Image {}
@:image("assets/images/feedback/turtleFeedbackPositive.png") #if display private #end class __ASSET__img_feedback_turtlefeedbackpositive_png extends lime.graphics.Image {}
@:image("assets/images/gameOver.png") #if display private #end class __ASSET__img_gameover_png extends lime.graphics.Image {}
@:image("assets/images/head.png") #if display private #end class __ASSET__img_head_png extends lime.graphics.Image {}
@:image("assets/images/health.png") #if display private #end class __ASSET__img_health_png extends lime.graphics.Image {}
@:image("assets/images/Heart1.png") #if display private #end class __ASSET__img_heart1_png extends lime.graphics.Image {}
@:image("assets/images/Heart2.png") #if display private #end class __ASSET__img_heart2_png extends lime.graphics.Image {}
@:image("assets/images/Heart3.png") #if display private #end class __ASSET__img_heart3_png extends lime.graphics.Image {}
@:image("assets/images/Heart4.png") #if display private #end class __ASSET__img_heart4_png extends lime.graphics.Image {}
@:image("assets/images/howToPlay.png") #if display private #end class __ASSET__img_howtoplay_png extends lime.graphics.Image {}
@:image("assets/images/hub1.png") #if display private #end class __ASSET__img_hub1_png extends lime.graphics.Image {}
@:image("assets/images/lowerArm.png") #if display private #end class __ASSET__img_lowerarm_png extends lime.graphics.Image {}
@:image("assets/images/lowerLeg.png") #if display private #end class __ASSET__img_lowerleg_png extends lime.graphics.Image {}
@:image("assets/images/mainMenu.png") #if display private #end class __ASSET__img_mainmenu_png extends lime.graphics.Image {}
@:image("assets/images/menu/menu room empty.png") #if display private #end class __ASSET__img_menu_menu_room_empty_png extends lime.graphics.Image {}
@:image("assets/images/menu/menufinal.png") #if display private #end class __ASSET__img_menu_menufinal_png extends lime.graphics.Image {}
@:image("assets/images/menu/prestatie.png") #if display private #end class __ASSET__img_menu_prestatie_png extends lime.graphics.Image {}
@:image("assets/images/menu/prestatiehover.png") #if display private #end class __ASSET__img_menu_prestatiehover_png extends lime.graphics.Image {}
@:image("assets/images/menu/speluitleg.png") #if display private #end class __ASSET__img_menu_speluitleg_png extends lime.graphics.Image {}
@:image("assets/images/menu/Speluitleghover.png") #if display private #end class __ASSET__img_menu_speluitleghover_png extends lime.graphics.Image {}
@:image("assets/images/menu/teleporter.png") #if display private #end class __ASSET__img_menu_teleporter_png extends lime.graphics.Image {}
@:image("assets/images/menu/teleporterhover.png") #if display private #end class __ASSET__img_menu_teleporterhover_png extends lime.graphics.Image {}
@:image("assets/images/placeholder100x50.jpg") #if display private #end class __ASSET__img_placeholder100x50_jpg extends lime.graphics.Image {}
@:image("assets/images/placeholder50x50.jpg") #if display private #end class __ASSET__img_placeholder50x50_jpg extends lime.graphics.Image {}
@:image("assets/images/placeholdergray100x50.jpg") #if display private #end class __ASSET__img_placeholdergray100x50_jpg extends lime.graphics.Image {}
@:image("assets/images/steave.png") #if display private #end class __ASSET__img_steave_png extends lime.graphics.Image {}
@:image("assets/images/torso.png") #if display private #end class __ASSET__img_torso_png extends lime.graphics.Image {}
@:image("assets/images/upperArm.png") #if display private #end class __ASSET__img_upperarm_png extends lime.graphics.Image {}
@:image("assets/images/upperLeg.png") #if display private #end class __ASSET__img_upperleg_png extends lime.graphics.Image {}
@:file("E:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("E:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}



#end

#if openfl

#end

#end
#end

