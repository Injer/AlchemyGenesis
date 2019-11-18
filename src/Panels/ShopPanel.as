package Panels 
{
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;
	import flash.geom.Rectangle;
	import starling.core.RenderSupport;
	import starling.core.Starling;
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
	import Panels.ScrollSlidePanel;

	/**
	 * ...
	 * @author injer
	 */
	public class ShopPanel extends ScrollSlidePanel
	{
		var main: MainLevel;
		
		override public function GenerateTable (CellRad: int, MiniRad: int, SeparatorHor: int, SeparatorVert: int): void
		{
			var check: Boolean = false;
			for (var i = 0; i < OpenList.length; i++ )
			{
				if (OpenList[i])
				{
					for (var j = 0; j < innerPanel.numChildren; j++ )
					{
						if (NamesList[i] == (innerPanel.getChildAt(j) as Cell).type)
						{
							check = true; break;
						}
					}
					if (! check)
					{
						var cell = innerPanel.addChild(ObjectConstructor.CreateCell(NamesList[i], main.texContainer, CellRad, currX, currY));
						cell.addEventListener(TouchEvent.TOUCH, CellClick);
						currX += CellRad + SeparatorHor;
						if (currX + CellRad + SeparatorHor >= panelWidth)
						{
							currX = StartX;
							currY += CellRad + SeparatorVert;
						}
					}
					check = false;
				}		
			}
			innerPanel.y = 0;
			scroller.Update();
		}
		
		private function CellClick (e: TouchEvent): void
		{
			if (e.getTouches(e.currentTarget as DisplayObject).length == 1 && e.touches[0].phase == TouchPhase.ENDED)
			{
				main.GenerateBallWithType((e.currentTarget as Cell).type);
				mover.ShowPanelY(null);
			}
		}
		
		public function ShopPanel(width: int, height: int, FormulsList :Vector.<Vector.<String>>, OpenList:Vector.<Boolean>,  CostList: Vector.<Number>, NamesList: Vector.<String>, main: MainLevel, StartX: int = 10, StartY:int = 10)
		{
			this.main = main;
			InitPanel(width, height, FormulsList, OpenList,  CostList, NamesList, StartX, StartY);
			//Если нужен Slider - иницициализируем его
			AddSlider();
		}
		
	}
}