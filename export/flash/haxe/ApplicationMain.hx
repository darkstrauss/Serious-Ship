#if !macro


@:access(lime.Assets)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new lime.app.Application ();
		app.create (config);
		openfl.Lib.application = app;
		
		#if !flash
		var stage = new openfl.display.Stage (app.window.width, app.window.height, config.background);
		stage.addChild (openfl.Lib.current);
		app.addModule (stage);
		#end
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("img/book/pageBook1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/book/pageBook2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/book/pageBook3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/book/pageBook4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/boxPlaceholder.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/Credits.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/Duwen.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/monkeybutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/penguinbutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/pigbutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/sealbutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/Start.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/Terug.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/Tillen.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/treebutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/Trekken.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/buttons/turtlebutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/credits.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/descriptions/monkeyDescription.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/descriptions/penguinDescription.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/descriptions/pigDescription.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/descriptions/sealDescription.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/descriptions/treeBranchDescription.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/descriptions/turtleDescription.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/events/monkeyz.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/events/penguin.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/events/pig.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/events/seal.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/events/treeBranch.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/events/turtle.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/monkeyFeedbackNegative.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/monkeyFeedbackPositive.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/penguinFeedbackNegative.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/penguinFeedbackPositive.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/pigFeedbackNegative.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/pigFeedbackPositive.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/sealFeedbackNegative.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/sealFeedbackPositive.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/treebranchFeedbackNegative.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/treebranchFeedbackPositive.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/turtleFeedbackNegative.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/feedback/turtleFeedbackPositive.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/gameOver.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/head.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/health.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Heart1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Heart2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Heart3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Heart4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/howToPlay.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/hub1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/lowerArm.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/lowerLeg.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/mainMenu.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/menu/menu room empty.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/menu/menufinal.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/menu/prestatie.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/menu/prestatiehover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/menu/speluitleg.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/menu/Speluitleghover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/menu/teleporter.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/menu/teleporterhover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/placeholder100x50.jpg");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/placeholder50x50.jpg");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/placeholdergray100x50.jpg");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/steave.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/torso.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/upperArm.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/upperLeg.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			company: "HaxeFlixel",
			depthBuffer: false,
			file: "Serious Ship",
			fps: Std.int (60),
			fullscreen: false,
			hardware: true,
			height: Std.int (768),
			orientation: "portrait",
			packageName: "com.example.myapp",
			resizable: true,
			stencilBuffer: true,
			title: "Serious Ship",
			version: "0.0.1",
			vsync: true,
			width: Std.int (1280),
			
		}
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 1280, 768, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
