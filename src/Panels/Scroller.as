package Panels 
{
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * ...
	 * @author Injer
	 */
	public class Scroller extends Sprite 
	{	
		//перемещаемая панель
		private var panel: DisplayObject;
		private var scrollBlock: Quad;
		private var background: Quad;
		private var maskHeight;
		private var maskWidth;
		private var panelHeight;
		private var panelWidth;
		
		public function Scroller(panel: DisplayObject, height: int, width: int, panelHeight: int, panelWidth: int) 
		{
			this.panel = panel;
			maskWidth = width;
			maskHeight = height;
			this.panelHeight = panelHeight;
			this.panelWidth = panelWidth;
			background = new Quad(width, height, 0xffffff);
			scrollBlock = new Quad(width, height, 0x000000);
			scrollBlock.addEventListener(TouchEvent.TOUCH, TouchScroller);
			addChild(background);
			addChild(scrollBlock);
		}
		
		public function Update ()
		{
			if (background.height * (maskHeight / panel.height) < background.height)
				scrollBlock.height =  background.height * (maskHeight / panel.height);
			else 
				scrollBlock.height = background.height;
			
			scrollBlock.y = 0;	
		}
		
		private function TouchScroller (e: TouchEvent): void
		{
			if (e.getTouches(e.currentTarget as DisplayObject).length != 1)
				return;
			var touches: Vector.<Touch> = new Vector.<Touch>;
			touches = e.getTouches(e.currentTarget as DisplayObject);
			if (touches[0].phase == TouchPhase.MOVED)
			{
				var buf = (e.currentTarget as DisplayObject).y + (touches[0].globalY - touches[0].previousGlobalY);
				if (buf < 0 || buf + (e.currentTarget as DisplayObject).height > maskHeight)
					return;
				(e.currentTarget as DisplayObject).y += touches[0].globalY - touches[0].previousGlobalY;
				if ((e.currentTarget as DisplayObject).y < 0)
					(e.currentTarget as DisplayObject).y = 0;
				else if ((e.currentTarget as DisplayObject).y + (e.currentTarget as DisplayObject).height > maskHeight)
					(e.currentTarget as DisplayObject).y = maskHeight - (e.currentTarget as DisplayObject).height;
				UpdateScroller();
			}
		}
		
		public function UpdateScroller ()
		{
			panel.y = -scrollBlock.y * ( panel.height/maskHeight);
		}
	}
}