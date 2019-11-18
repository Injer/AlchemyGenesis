package Panels 
{
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import Panels.Mover;
	/**
	 * ...
	 * @author injer
	 */
	public class MenuPanel extends Sprite
	{
		
		private var background: Image;
		private var showButton: Quad;
		public var showButtonWidth:Number = 0;
		public var showButtonHeight: Number = 0;
		public var mover: Mover;
		
		public function MenuPanel(width: int, height: int, stageWidth: int)
		{
			[Embed(source = "/../res/panels/shop/background.png")]
			const Background: Class;
			
			this.width = width;
			this.height = height;
			
			var tex = Texture.fromBitmap(new Background);
			background = new Image(tex);
			background.width = width;
			background.height = height;
			background.x = 0;
			background.y = 0;
			
			addChild(background);
			
			mover = new Mover(this);
			mover.stageWidth = stageWidth;
			
			showButton = new Quad(showButtonWidth, showButtonHeight, 0xaaaaaa);
			showButton.x = this.width / 2 - showButtonWidth / 2;
			showButton.y = this.height - showButtonHeight / 2;
			
			addChild(showButton);
			showButton.addEventListener (TouchEvent.TOUCH, mover.ShowPanelX);
		}
	}

}