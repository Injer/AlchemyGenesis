package  Utils
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Injer
	 */
	public class AchievementsPanel extends Sprite
	{
		
		public function AchievementsPanel(newX: int = 0, newY: int = 0, twidth: int = 100, theight: int = 30, fontName: String = "Arial", fontSize: Number = 12, color: uint = 0, hideDelay: int = 100, bgImage: Texture = null) 
		{
			this.visible = false;
			this.x = newX;
			this.y = newY;
			this.width = twidth;
			this.height = theight;
			//инициализируем элементы
			currentText = new TextField(1, 1, "", fontName, fontSize, color);
			currentText.hAlign = "center";
			currentText.vAlign = "center";
			background = new Image(bgImage);
			currentImage = new Image(bgImage);
			
			//устанавливаем пропорцией размеры элементов панели
			var textWidth: Number = 200;//twidth / 100 * 35;
			var textHeight: Number = theight / 100 * 60;
			var imageHeight: Number = theight / 100 * 60;
			var imageWidth: Number = imageHeight;
			var imageX: Number = 45; //(twidth - (textWidth + imageWidth)) / 2;
			var imageY: Number = (theight - imageHeight) / 2;
			
			currentText.height = textHeight
			currentImage.height = imageHeight
			currentText.width = textWidth;
			currentImage.width = imageWidth;
			currentImage.x = imageX;
			currentText.x = imageX + imageWidth;
			currentText.y = imageY;
			currentImage.y = imageY;
			
			background.width = twidth;
			background.height = theight;
			
			addChild(background);
			addChild(currentText);
			
			myTimer = new Timer(hideDelay);
			myTimer.addEventListener(TimerEvent.TIMER, HideOnTimer);
			
		}
		
		private var myTimer: Timer;
		private var AlphaStep = 0.2;
		private var frames = 20;
		
		//векторы image и string для хранения данных ачивок
		private var images: Vector.<Texture>;
		private var texts : Vector.<String>;
		private var titles: Vector.<String>;
		//текущая картинка и отображаемое текстовое поле
		private var currentImage: Image;
		private var currentText: TextField;
		
		//задник панели
		private var background: Image;
		
		//на вход к загрузке ачивок подается два вектора - иконок для ачивок и строк с описаниями
		public function LoadAchievements(aImages: Vector.<Texture>, aStrings: Vector.<String>, aTitles: Vector.<String>)
		{
			images = new Vector.<Texture>;
			texts = new Vector.<String>;
			titles = new Vector.<String>;
			if (aImages.length != aStrings.length && aStrings.length != aTitles.length)
			{
				trace ("Error - achievements data incorrect - different vector's length");
				return; 
			}
			for (var i = 0; i < aImages.length; i++ )
			{
				images.push(aImages[i]);
				texts.push(aStrings[i]);
				titles.push(aTitles[i]);
			}
		}
		
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
		
		public function ShowAchievement (title: String = null)
		{
			//ищем ачивку в векторах по заголовку
			if (title != null)
			{
				var index = -1;
				for (var i = 0; i < titles.length; i++ )
					if (titles[i] == title)
					{
						index = i;
						break;
					}
				if (index == -1)
				{
					trace("Error - achievement '" + title + "' not found");
					return;
				}
				else 
				{
					var iwidth = currentImage.width;
					var iheight = currentImage.height;
					var ix = currentImage.x;
					var iy = currentImage.y;
					currentImage.removeFromParent(true);
					currentImage = new Image(images[i]);
					currentImage.width = iwidth;
					currentImage.height = iheight;
					currentImage.x = ix;
					currentImage.y = iy;
					addChild(currentImage);
					currentText.text = texts[i];
				}
			}
			
			if (myTimer.running)
				myTimer.stop();
			this.alpha = 1;
			frames = 30;
			this.visible = true;
			myTimer.start();
		}
		
		
	}

}