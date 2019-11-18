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
	import Panels.Mover;
	import Panels.Scroller;

	/**
	 * ...
	 * Панель со скроллингом. Можно прикрутить механизм слайдера - по нажатию выдвигать/задвигать
	 * За слайдер отвечает класс Mover
	 * Для использования следует перегрузить метод GenerateTable - это собственно заполняет область контента
	 * @author injer
	 */
	public class ScrollSlidePanel extends Sprite
	{
		public var background: Image;
		public var innerPanel: Sprite;
		public var showButton: Quad;
		public var showButtonWidth:Number = 50;
		public var showButtonHeight: Number = 35;
		public var mover: Mover;

		public var BorderHor: int = 40;
		public var BorderVert: int = 40;
		public var myWidth;
		public var myHeight;
		
		public var panelWidth;
		public var panelHeight;
		
		public var scroller: Scroller;
		
		//Параметры ячейки
		//Радиус ячейки
		public var CellRad: int = 15;
		public var MiniRad: int = 10;
		//Размер разделителя
		public var SeparatorHor: int = 30;
		public var SeparatorVert: int = 50;
		public var StartX;
		public var StartY;
		var currX; 
		var currY;
		//----------------------
		
		var FormulsList :Vector.<Vector.<String>>;
		var OpenList:Vector.<Boolean>;
		var CostList: Vector.<Number>;
		var NamesList: Vector.<String>;
		
		[Embed(source = "/../res/panels/shop/background.png")]
		const Background: Class;
		[Embed(source = "/../res/panels/shop/inner.png")]
		const InnerPanel: Class;
		
		public function GenerateTable (CellRad: int, MiniRad: int, SeparatorHor: int, SeparatorVert: int): void
		{

		}
		
		public function ScrollSlidePanel()
		{

		}
		
		public function InitPanel (width: int, height: int, FormulsList :Vector.<Vector.<String>>, OpenList:Vector.<Boolean>,  CostList: Vector.<Number>, NamesList: Vector.<String>, StartX: int = 10, StartY:int = 10 )
		{
			this.FormulsList = FormulsList;
			this.OpenList = OpenList;
			this.CostList = CostList;
			this.NamesList = NamesList;

			this.StartX = StartX;
			this.StartY = StartY;
			
			myWidth = width;
			myHeight = height;
			panelWidth = width - BorderHor;
			panelHeight = height - BorderVert;
			
			var tex = Texture.fromBitmap(new Background);
			background = new Image(tex);
			background.width = myWidth;
			background.height = myHeight;
			addChild(background);
			
			innerPanel = new Sprite();
			var mask: Quad = new Quad(panelWidth, panelHeight, 0x000000);

			var masked = new PixelMaskDisplayObject();
			masked.addChild(innerPanel);
			masked.mask = mask;
			masked.x = 15; masked.y = 15;
			addChild(masked);
			
			currX = StartX;
			currY = StartY;
			
			scroller = new Scroller(innerPanel, mask.height, myWidth - panelWidth + masked.x, mask.height, mask.width);
			scroller.x = masked.x + panelWidth;
			scroller.y = masked.y;
			
			addChild(scroller);
		}
		
		public function AddSlider (): void
		{
			mover = new Mover(this, myHeight, myWidth);
			mover.hideButtonHeight = showButtonHeight;
			showButton = new Quad(showButtonWidth, showButtonHeight, 0xaaaaaa);
			showButton.x = myWidth / 2 - showButtonWidth / 2;
			showButton.y = myHeight;
			showButton.addEventListener (TouchEvent.TOUCH, mover.ShowPanelY);
			showButton.addEventListener (TouchEvent.TOUCH, ExecGenerator);
			addChild(showButton);
		}
		
		private function ExecGenerator (e: TouchEvent)
		{
			if (e.getTouches(e.currentTarget as DisplayObject).length == 1 && 
				e.getTouches(e.currentTarget as DisplayObject)[0].phase == TouchPhase.ENDED)
				{
					if (mover.isHide)
						GenerateTable(CellRad, MiniRad, SeparatorHor, SeparatorVert);
				}
		}
		
	}

}