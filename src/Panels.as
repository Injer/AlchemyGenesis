package  
{
	import Box2D.Dynamics.b2World;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.textures.Texture;
	import Panels.ShopPanel;
	import Panels.DictionaryPanel;
	import Panels.MenuPanel;
	import starling.utils.Color;
	/**
	 * ...
	 * @author ...
	 */
	
	 
	public class Panels extends Sprite
	{
		public var panelsSpeed = 3;
		public var shop: ShopPanel;
		public var dict: DictionaryPanel;
		public var menu: MenuPanel;
		
		public var Paused: Boolean = false;
		
		public var MenuShowButton: Quad;
		
		public function PreLoadTables()
		{
			shop.LoadTable();
			dict.LoadTable();
		}
		
		public function Panels(width: Number, height: Number, FormulsList :Vector.<Vector.<String>>, OpenList:Vector.<Boolean>,  CostList: Vector.<Number>, NamesList: Vector.<String>, main: MainLevel) 
		{
			this.width = width; 
			this.height = height;
			shop = new ShopPanel(width, 350, FormulsList, OpenList, CostList, NamesList, main, 20,20);
			shop.x = -5; 
			shop.width += 20;  shop.y = -shop.background.height; shop.masked.visible = false;
			addChild(shop);
			dict = new DictionaryPanel(width, 350, FormulsList, OpenList, CostList, NamesList, main, 20,20);
			dict.x = -5; dict.width += 20; dict.y = -dict.background.height; dict.masked.visible = false;
			addChild(dict);
			menu = new MenuPanel(150, 200, width, main);
			menu.x = width; menu.y = 50;
			addChild(menu);
			
			MenuShowButton = new Image(main.texContainer.SliderButton);
			MenuShowButton.width = 91;
			MenuShowButton.height = shop.showButton.height - 12;
			MenuShowButton.addEventListener(TouchEvent.TOUCH, menu.mover.ShowPanelX);
			addChild(MenuShowButton);
			var text: TextField = new TextField(100, 35, "Menu", "Donaldina", 12, 0xffffff);
			text.x = width - 92;
		
			text.addEventListener(TouchEvent.TOUCH, menu.mover.ShowPanelX);
			addChild(text);
			
			shop.addEventListener(TouchEvent.TOUCH, Click);
			dict.addEventListener(TouchEvent.TOUCH, Click);
			menu.addEventListener(TouchEvent.TOUCH, Click);
			MenuShowButton.addEventListener(TouchEvent.TOUCH, Click);
			addEventListener(Event.ENTER_FRAME, CheckPanels);
			
			
		}
		
		private function CheckPanels(e: Event)
		{
			if (shop.mover.isHide && dict.mover.isHide && menu.mover.isHide)
			{
				Paused = false;
				return;
			}
			Paused = true;
		}
		
		private function Click(e: TouchEvent)
		{
			if (e.getTouches(e.currentTarget as DisplayObject).length == 1 && 
				e.getTouches(e.currentTarget as DisplayObject)[0].phase == TouchPhase.ENDED)
					addChild(e.currentTarget as DisplayObject);
		}

		
	}

}