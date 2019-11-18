package  Utils
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.text.TextField;
	/**
	 * ...
	 * @author Injer
	 */
	public class ShadowTextField extends TextField
	{
		
		public function ShadowTextField(newX: int = 0, newY: int = 0, width: int = 100, height: int = 30, text: String = "", fontName: String = "Arial", fontSize: Number = 12, color: uint = 0, bold: Boolean = false, hideSpeed: int = 100 ) 
		{
			super(width, height, text, fontName, fontSize, color, bold);
			this.visible = false;
			this.x = newX;
			this.y = newY;
			this.hAlign = "center";
			myTimer = new Timer(hideSpeed);
			myTimer.addEventListener(TimerEvent.TIMER, HideOnTimer);
		}
		
		private var myTimer: Timer;
		private var AlphaStep = 0.1;
		private var frames = 20;
		
		private function HideOnTimer (e: TimerEvent)
		{
			if (frames > 0)
			{
				frames --;
				return;
			}
			if (this.alpha > 0)
				this.alpha -= AlphaStep;
			else 
			{
				this.visible = false;
				this.alpha = 1;
				myTimer.stop();
			}
		}
		
		public function ShowMessage (text: String = null)
		{
			if (text != null)
				this.text = text;
			if (myTimer.running)
				myTimer.stop();
			this.alpha = 1;
			frames = 10;
			this.visible = true;
			myTimer.start();
		}
		
		
	}

}