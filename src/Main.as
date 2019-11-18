package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	//import Cursor;
	import starling.core.Starling;
	

	

	/**
	 * ...
	 * @author Injer
	 */
	[Frame(factoryClass="Preloader")]
	[SWF(width="320", height="480", frameRate="60", backgroundColor="#000000")]
	public class Main extends Sprite 
	{

		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private var _aStarling: Starling;
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			/*
			 * // are we running hardware of software ?
			var isHW:Boolean = Starling.context.driverInfo.toLowerCase().indexOf("software") == -1;
			starling.deg2grad () - переводит из градусов в радианы :)
			 */
			_aStarling = new Starling(MainLevel, stage);
			//_aStarling.simulateMultitouch = true;
			_aStarling.antiAliasing = 16;
			_aStarling.start();

		}

		

		

	}

}