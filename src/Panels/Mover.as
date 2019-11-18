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
	/**
	 * ...
	 * @author injer
	 */
	public class Mover 
	{
		private var speed = 3;
		private var direction = false;
		public var hideButtonHeight = 50;
		public var stageWidth = 0;
		public var isHide: Boolean = true;
		private var panel: DisplayObject;
		private var limitHeight;
		private var limitWidth;
		
		public function Mover(panel: DisplayObject, height: int=0, width: int=0)
		{
			this.panel = panel;
			if (height == 0)
				limitHeight = panel.height;
			else 
				limitHeight = height;
			if (width == 0)
				limitWidth = panel.width;
			else
				limitWidth = width;
		}
		
		public function ShowPanelY (e: TouchEvent)
		{
			if (e ==null || ( e.getTouches(e.currentTarget as DisplayObject).length == 1 && e.getTouches(e.currentTarget as DisplayObject)[0].phase == TouchPhase.ENDED) )
			{
				if (panel.y < 0)
				{
					direction = true;
				}
				else 
				{
					direction = false;
				}
				if (panel.hasEventListener(Event.ENTER_FRAME))
					panel.removeEventListener(Event.ENTER_FRAME, moveY);
				panel.addEventListener(Event.ENTER_FRAME, moveY);
			}
		}
		
		private function moveY(e:Event)
		{
			if (direction)
			{
				isHide = false;
				if (panel.y < 0)
				{
					if (panel.y + speed >= 0)
						panel.y = 0;
					else 
						panel.y += speed; 
				}
				if (panel.y == 0)
				{
					panel.removeEventListener(Event.ENTER_FRAME, moveY);
				}
			}
			else 
			{
				if (panel.y > -limitHeight)
				{
					if (panel.y - speed <= -limitHeight)
						panel.y = - limitHeight; 
					else 
						panel.y -= speed;
				}
				if (panel.y == - limitHeight)
				{
					isHide = true;
					panel.removeEventListener(Event.ENTER_FRAME, moveY);
				}
			}
		}
		
		public function ShowPanelX (e: TouchEvent)
		{
			if (e.getTouches(e.currentTarget as DisplayObject).length == 1 && e.getTouches(e.currentTarget as DisplayObject)[0].phase == TouchPhase.ENDED)
			{
				if (panel.x >= stageWidth )
					direction = true;
				else 
					direction = false;
				if (panel.hasEventListener(Event.ENTER_FRAME))
					panel.removeEventListener(Event.ENTER_FRAME, moveX);
				panel.addEventListener(Event.ENTER_FRAME, moveX);
			}
		}
		
		private function moveX(e:Event)
		{
			if (direction)
			{
				isHide = false;
				if (panel.x > stageWidth - limitWidth)
				{
					if (panel.x - speed <= stageWidth - limitWidth)
						panel.x = stageWidth - limitWidth;
					else 
						panel.x -= speed; 
				}
				if (panel.x == stageWidth - limitWidth)
				{
					
					panel.removeEventListener(Event.ENTER_FRAME, moveX);
				}
			}
			else 
			{
				
				if (panel.x < stageWidth)
				{
					if (panel.x + speed >= stageWidth)
						panel.x = stageWidth;
					else 
						panel.x += speed;
				}
				if (panel.x == stageWidth)
				{
					isHide = true;
					panel.removeEventListener(Event.ENTER_FRAME, moveX);
				}
			}
		}
	}

}