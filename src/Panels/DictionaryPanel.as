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
	public class DictionaryPanel extends ScrollSlidePanel
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
						if (NamesList[i] == (innerPanel.getChildAt(j) as Cell).name)
						{
							check = true; break;
							
						}
					if (! check)
					{
						currX = StartX;
						var cell = innerPanel.addChild(ObjectConstructor.CreateCell(NamesList[i], main.texContainer,CellRad, currX, currY));
						cell.name = NamesList[i];
						currX += CellRad + SeparatorHor;
						for (var j = 0; j < FormulsList[i].length; j++ )
						{
							for (var c = 0; c < NamesList.length; c++ )
								if (NamesList[c] == FormulsList[i][j])
								{
									innerPanel.addChild(ObjectConstructor.CreateCell(NamesList[c], main.texContainer, MiniRad, currX, currY));
									break;
								}
							currX += MiniRad + SeparatorHor;
						}
						currY += SeparatorVert;
						
					}
					check = false;
				}		
			}
			innerPanel.y = 0;
			scroller.Update();
		}
		
		public function DictionaryPanel(width: int, height: int, FormulsList :Vector.<Vector.<String>>, OpenList:Vector.<Boolean>,  CostList: Vector.<Number>, NamesList: Vector.<String>, main: MainLevel, StartX: int = 10, StartY:int = 10 )
		{
			this.main = main;
			InitPanel(width, height, FormulsList, OpenList,  CostList, NamesList, StartX, StartY);
			//Если нужен Slider - иницициализируем его
			AddSlider();
		}
		
	}

}