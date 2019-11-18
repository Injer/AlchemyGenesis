package  
{
	import Beasts.Beast;
	import Box2D.Collision.Shapes.b2MassData;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Utils3D;
	import flash.utils.Timer;
	import starling.text.TextField;
	
	import fl.motion.BezierSegment;
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.sampler.NewObjectSample;
	import starling.animation.Juggler;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.Color;
	import starling.utils.deg2rad;

	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import PDParticleSystem;
	import ParticleSystem;
	
	import Utils.ShadowTextField;
	import Utils.AchievementsPanel;
	import MathHelper;
	import ObjectConstructor;
	import ScenePainter;
	import Panels;

	public class MainLevel extends Sprite
	{
		//глав меню
		var mainsprite: Sprite;
		//Переменные, которые необходимо инициализировать при создании уровня
		private var bodyDef:b2BodyDef;
		public var m_world:b2World;
		public var m_velocityIterations:int = 10;
		public var m_positionIterations:int = 10;
		public var m_timeStep:Number = 1.0 / 30.0;
		public var mainGravityY: Number = 0.1;
		public var mainGravityX: Number = 0.0;
		var wall_width = 10;
		
		var myCrButtonSprite: Sprite;
		private var WaterPainter: ScenePainter;
		//Партиклы тумана, создания и canCombine
		private var waterFogParticle: PDParticleSystem;
		private var creationParticle: PDParticleSystem;
		private var createButtonPatricle: PDParticleSystem;
		private var creationParticleTimer: Timer;
		
		private var canCombineParticleVector: Vector.<PDParticleSystem>;
		//--------------------------------------------------
		
		//Необходимая близость для захвата ячйки точкой покоя
		var accuracyLength = 60;
		var openedCombinations = 0;
		var generatorEnabled = false;
		var generatorDelay = 75;
		//Количество элеметарных ячеек с начала списка ячеек - для генерации через random
		var elementalCount = 18;
		var newBallX = 160;
		var newBallY = 145;
		var newBallRad = 20;
		var canCombine: int = -1;
		var staticbb: Vector.<b2Body>;
		//счетчик очков
		var ScoreCounter = 0;
		//Лист с формулами типа id - key - List <items>
		var FormulsList :Vector.<Vector.<String>> = new Vector.<Vector.<String>>;
		//Лист со стоимостями типа id - cost
		var CostList: Vector.<Number> = new Vector.<Number>;
		var NamesList: Vector.<String> = new Vector.<String>;
		var OpenList: Vector.<Boolean> = new Vector.<Boolean>;
		
		var MyPanels: Panels;
		
		//Контейнер для текстур
		public var texContainer: TextureContainer;
		
		var paused: Boolean = false;
		//--------------------------------------------------------------------
		//Всплывающее сообщение
		var shadowMessage: ShadowTextField;
		//Панель с ачивками
		var achievmentsPanel: AchievementsPanel;
		
		private var staticPoints: Vector.<b2Body> = new Vector.<b2Body>();
		
		/*
		//сохранение игры в пространстве под AIR
		private function SaveGame()
		{
			var myFile: File = File.documentsDirectory.resolvePath("Genesis/statistic.txt");
			var myStream:FileStream = new FileStream();
			myStream.open(myFile, FileMode.WRITE);
			var str = MathHelper.GetOpenedAsBitString(OpenList);
			myStream.writeObject(str);
			myStream.close();
		}
		//загрузка игры в пространстве под AIR
		private function LoadGame()
		{
			var myFile: File = File.documentsDirectory.resolvePath("Genesis/statistic.txt");
			if (! myFile.exists)
				SaveGame();
			var myStream:FileStream = new FileStream();
			myStream.open(myFile, FileMode.READ);
			var s: String = myStream.readObject();
			
			for (var i = 1; i < s.length; i++ )
				if (s.charAt(i) == "1")
					OpenList[i] = true;
			myStream.close();
		}*/
		
		public function MainLevel() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			PreLoad();
			ShowMainScreen();
			//InitLevel();
		}
		
		//загружаем сохраненные данные и инициализируем ресурсы
		private function PreLoad()
		{
			//Инициализируем формулы и контейнер с текстурами (после получения вектора имен элементов)
			texContainer = new TextureContainer(NamesList);
			var achHeight = 80;
			achievmentsPanel = new AchievementsPanel(0, stage.stageHeight/2 + 50, stage.stageWidth, achHeight, "Sabomaster", 18, 0xffffff, 100, texContainer.AchievementBackground);
			addChild(achievmentsPanel);
			
			MathHelper.SetFormulas(FormulsList, OpenList, CostList, NamesList);
			MathHelper.LoadAchievements(texContainer, achievmentsPanel);
			
			//LoadGame();
			openedCombinations = MathHelper.GetPureOpenedCount(FormulsList, OpenList);
			
			//------------------------------------------------
		}
		
		private function ShowMainScreen()
		{
			var mainquad: Quad = new Quad(stage.stageWidth, stage.stageHeight, 0x000000);
			var maintext: TextField = new TextField(stage.stageWidth, 200, "A L C H E M Y", "Ogilvie", 38, 0xffffff);
			maintext.hAlign = "center";
			maintext.y = stage.stageHeight / 2 - 220;
			var subtext: TextField = new TextField(stage.stageWidth, 200, "Genesis", "Sabomaster", 50, Color.argb(250, 44,118,175));
			subtext.hAlign = "center";
			subtext.y = stage.stageHeight / 2 - 170;
			var subtext2: TextField = new TextField(stage.stageWidth, 200, "Click(Touch) screen to start game", "Arial", 14, 0xffffff);
			subtext2.hAlign = "center";
			subtext2.y = stage.stageHeight / 2 - 80;
			mainsprite = new Sprite();
			mainsprite.addChild(mainquad);
			mainsprite.addChild(subtext);
			mainsprite.addChild(subtext2);
			mainsprite.addChild(maintext);
			var part: PDParticleSystem = new PDParticleSystem(texContainer.MainScreenXML, texContainer.MainScreenTexture);
			part.x = stage.stageWidth/2;
			part.y = stage.stageHeight;
			Starling.juggler.add(part);
			part.start();
			mainsprite.addChild(part);
			addChild(mainsprite);
			mainsprite.addEventListener(Event.REMOVED_FROM_STAGE, SpriteRemove);
			mainsprite.addEventListener(TouchEvent.TOUCH, ClickMainScreen);
		}
		
		private function SpriteRemove(e: Event)
		{
			while ((e.currentTarget as Sprite).numChildren > 0)
			{
				var sprite: Sprite = e.currentTarget as Sprite;
				if (sprite.getChildAt(sprite.numChildren - 1) is PDParticleSystem)
				{
					Starling.juggler.remove(sprite.getChildAt(sprite.numChildren - 1) as PDParticleSystem);
				}
				sprite.getChildAt(sprite.numChildren - 1).removeFromParent(true);
			}
		}
		
		private function ClickMainScreen(e: TouchEvent)
		{
			if (e.getTouches(e.currentTarget as DisplayObject).length == 1 && e.getTouches(e.currentTarget as DisplayObject)[0].phase == TouchPhase.ENDED)
			{
				mainsprite.visible = false;
				mainsprite.removeFromParent(true);
				InitLevel();
			}
		}
		
		
		private function InitLevel(): void
		{
			this.visible = false;
			
			//Переменные Box2D
			var gravity:b2Vec2 = new b2Vec2(mainGravityX, mainGravityY);
			var doSleep:Boolean = true;
			m_world = new b2World(gravity, doSleep);
			addEventListener(Event.ENTER_FRAME, Update);
			
			//Текстура-задник игрового экрана
			var myBg: Image = new Image(texContainer.MainBGTex);
			myBg.alpha = 0.3;
			addChild(myBg);
			
			MyPanels = new Panels(stage.stageWidth, stage.stageHeight, FormulsList, OpenList,  CostList, NamesList, this);
			
			//trace (stage.stageWidth.toString() + " " +  MyPanels.shop.width.toString() + " " + MyPanels.shop.height.toString());
			
			MyPanels.shop.showButton.width = 110;
			MyPanels.dict.showButton.width = 135;
			MyPanels.shop.showButton.x = 0;
			MyPanels.shop.showButton.y -= 5;
			MyPanels.dict.showButton.y -= 5;
			MyPanels.MenuShowButton.y -= 5;
			MyPanels.shop.showButtonText.x = MyPanels.shop.showButton.x - 5;
			MyPanels.dict.showButton.x = MyPanels.shop.showButton.width - 10 ;
			MyPanels.dict.showButtonText.x = MyPanels.dict.showButton.x + 5;
			MyPanels.MenuShowButton.x = MyPanels.shop.showButton.width + MyPanels.shop.showButton.width + 15 ;
			//Поставим стенки 0xB4EAF5
			//ObjectConstructor.CreateWall(this, m_world, wall_width, stage.stageHeight, 0,0,0,0xB4EAF5,Color.argb(250,0,0,0));
			//ObjectConstructor.CreateWall(this, m_world, wall_width, stage.stageHeight, stage.stageWidth-wall_width,0,1,0xB4EAF5,Color.argb(250,0,0,0));
			//ObjectConstructor.CreateWall(this, m_world, stage.stageWidth-wall_width, wall_width+2, wall_width,0,2,0xB4EAF5,Color.argb(250,0,0,0));
			ObjectConstructor.CreateWall(this, m_world, wall_width, stage.stageHeight, 0,0,0,Color.argb(250, 0, 110, 250),Color.argb(250,0,0,0));
			ObjectConstructor.CreateWall(this, m_world, wall_width, stage.stageHeight, stage.stageWidth-wall_width,0,1,Color.argb(250, 0, 110, 250),Color.argb(250,0,0,0));
			ObjectConstructor.CreateWall(this, m_world, stage.stageWidth-wall_width, wall_width+2, wall_width,0,2,Color.argb(250, 0, 110, 250),Color.argb(250,0,0,0));
			//ObjectConstructor.CreateWall(this, m_world, stage.stageWidth-wall_width, wall_width+2, wall_width,300,2,Color.argb(207, 207, 207, 0),Color.argb(100,100,100,0));
			
			//Создадим зону, в которой происходит смешивание
			var stepSP = 15; var startPointX = 47; var pointRad = 20; var staticPointY = 100;
			var SPCount = 4;
			var startPoint: Number = startPointX + stepSP / 2;
			var nextPoint: Number = startPoint;
			for (var i = 0; i < SPCount; i++ )
			{
				staticPoints.push(ObjectConstructor.CreateStaticPoint(this, m_world, pointRad, nextPoint, staticPointY));
				nextPoint += pointRad*2 + stepSP;
			}
			nextPoint += stepSP / 2;
			var staticArea: Image = new Image(texContainer.StaticAreaTex);
			staticArea.x = startPoint - stepSP /2;
			staticArea.width = nextPoint - startPoint;
			staticArea.height = 50;
			staticArea.y = staticPointY - 40;
			staticArea.alpha = 1;
			addChild(staticArea);
			//-----------------
			
			WaterPainter = new ScenePainter();
			WaterPainter.AnimationDelay = 1;
			WaterPainter.water_length = 320;
			WaterPainter.water_x = 0;
			WaterPainter.water_y = 400;
			WaterPainter.water_amplitude = 35;
			WaterPainter.water_height = 150;
			WaterPainter.drawWater = true;
			WaterPainter.stopRefresh = true;
			WaterPainter.visible = false;
			//Создание партиклов
			waterFogParticle = new PDParticleSystem(texContainer.WaterFogXML, texContainer.WaterFogTexture);
			waterFogParticle.x = WaterPainter.water_x+ 80;
			waterFogParticle.y = WaterPainter.water_y + 80;
			waterFogParticle.start();
			//Убрать потом !!!!
			waterFogParticle.scaleX = 1;
			waterFogParticle.scaleY = 0.6;
			//-----------------
			Starling.juggler.add(waterFogParticle);
			addChild(waterFogParticle);
			
			creationParticle = new PDParticleSystem(texContainer.CreationXML, texContainer.CreationTexture);
			Starling.juggler.add(creationParticle);
			addChild(creationParticle);
			creationParticleTimer = new Timer(500, 1);
			creationParticle.scaleX = .3;
			creationParticle.scaleY = .3;
			creationParticleTimer.addEventListener(TimerEvent.TIMER, HideCreationParticle);
			
			canCombineParticleVector = new Vector.<PDParticleSystem>;
			startPoint += stepSP /2;
			for (var i = 0; i < SPCount; i++ )
			{
				canCombineParticleVector.push(new PDParticleSystem(texContainer.CombineXML, texContainer.CombineTexture));
				canCombineParticleVector[canCombineParticleVector.length - 1].x = startPoint + newBallRad;
				canCombineParticleVector[canCombineParticleVector.length - 1].y = staticArea.height / 2 + staticArea.y - canCombineParticleVector[canCombineParticleVector.length - 1].height /2 ;
				canCombineParticleVector[canCombineParticleVector.length - 1].scaleX = .3;
				canCombineParticleVector[canCombineParticleVector.length - 1].scaleY = .3;
				Starling.juggler.add(canCombineParticleVector[canCombineParticleVector.length - 1]);
				addChild(canCombineParticleVector[canCombineParticleVector.length - 1]);
				startPoint += pointRad*2 + stepSP;
			}
			//---------------------------
			addChild(WaterPainter);
			addChild(MyPanels);
			//тухтулогия
			var createButtonWidth: int = 110;
			var createButtonHeight: int = 35;
			createButtonPatricle = new PDParticleSystem(texContainer.CreateButtonParticleXML, texContainer.CreateButtonParticleTexture);
			createButtonPatricle.x = stage.stageWidth / 2 ;
			createButtonPatricle.y = 160;
			createButtonPatricle.scaleX = 0.6;
			createButtonPatricle.scaleY = 0.4;
			addChild(createButtonPatricle);
			Starling.juggler.add(createButtonPatricle); 
			
			CreateCreationButton(stage.stageWidth/2 - createButtonWidth/2 ,140, createButtonWidth, createButtonHeight);
			
			
			generatorEnabled = true;
			//Подгружаем содержимое таблиц словаря и магазина (при добавлении большого числа элементов подвисает, поэтому делаем это до начала игры)
			MyPanels.PreLoadTables();
			//Добавляем объект - всплывающее сообщение
			shadowMessage = new ShadowTextField(0, 350, stage.stageWidth, 150, "", "Sabomaster", 24, Color.argb(250, 250, 250, 250), false, 100);
			addChild(shadowMessage);
			
			this.visible = true;
		}
		
		//Кнопка создания нового элемента
		private function CreateCreationButton(bx: int = -1, by: int = -1, buttonWidth: int = 200, buttonHeight: int = 80)
		{
			var createButton: Image = new Image(texContainer.CreateButtonTexture);
			createButton.width = buttonWidth;
			createButton.height = buttonHeight;
			myCrButtonSprite = new Sprite();
			var buttonText: TextField = new TextField(createButton.width, createButton.height, "combine" , "Sabomaster", 18, Color.argb(250,250,250,250));//(200,202,221,216));
			buttonText.x = 0; buttonText.y = 0;
			myCrButtonSprite.addChild(createButton);
			myCrButtonSprite.addChild(buttonText);
			addChild(myCrButtonSprite);
			
			myCrButtonSprite.addEventListener(TouchEvent.TOUCH, CombineCells);
			myCrButtonSprite.x = bx;
			myCrButtonSprite.y = by;
			myCrButtonSprite.alpha = 0;
			myCrButtonSprite.name = "hide";
			myCrButtonSprite.addEventListener(Event.ENTER_FRAME, ShowSprite);
		}
		//----------------------------------
		
		//эффект затемнения при наведении на кнопку
		private function TouchButton (e: TouchEvent)
		{
			
			if (e.getTouches(e.currentTarget as DisplayObject).length == 1
				&& e.getTouches(e.currentTarget as DisplayObject)[0].phase == TouchPhase.HOVER)
				{
					(e.currentTarget as Sprite).alpha = 0.9;
				}
			else 
			if (e.getTouches(e.currentTarget as DisplayObject).length == 1
				&& e.getTouches(e.currentTarget as DisplayObject)[0].phase == TouchPhase.BEGAN)
				{
					(e.currentTarget as Sprite).alpha = 0.7;
				}
			else 
				(e.currentTarget as Sprite).alpha = 0.9;
		}
		
		private function ShowSprite(e: Event)
		{
			var myDo: DisplayObject = e.currentTarget as DisplayObject;
			if (myDo.name == "hide")
			{
				if (myDo.alpha > 0)
					myDo.alpha -= 0.05;
				else if (myDo.alpha < 0)
					myDo.alpha = 0;
			}
			else if (myDo.name == "show")
			{
				if (myDo.alpha < 1)
					myDo.alpha += 0.1;
				else if (myDo.alpha < 1.2)
				{
					myDo.alpha = 1.2;
					createButtonPatricle.start();
				}
				
			}
		}
		
		private function HideCreationParticle (e: TimerEvent)
		{
			creationParticle.pause();
		}
		
		public function GenerateBallWithType (type: String)
		{
			delayCounter = 0;
			var body: b2Body = ObjectConstructor.CreateBall(this, m_world, texContainer, type, newBallRad, stage.stageWidth/2 , myCrButtonSprite.y + 65);
			body.GetUserData().visible = true;
			(body.GetUserData() as Beast).addEventListener(TouchEvent.TOUCH, ClipClick);
		}
		
		var delayCounter = 0;
		private function GenerateNewBall()
		{
			if (myCrButtonSprite.alpha > 0)
			{
				return;
			}
			if (delayCounter < generatorDelay)
			{
				delayCounter++;
				return;
			}
			else 
			{
				delayCounter = 0;
				var elementIndex: int = Math.random() * (MathHelper.GetOpenedCount(OpenList) - 1);
				var ballRad = newBallRad; 
				var ballStartPosX = stage.stageWidth / 2 - 100 + (Math.random() * 200); // newBallX - newBallRad / 2;
				var ballStartPosY = newBallY;
				//Партикл при создании нового элемента
				creationParticle.x = ballStartPosX;
				creationParticle.y = ballStartPosY;
				creationParticle.start();
				creationParticleTimer.start();
				//------------
				var body: b2Body = ObjectConstructor.CreateBall(this, m_world, texContainer, this.NamesList[MathHelper.GetOpenedByIndex(elementIndex, OpenList)], ballRad, ballStartPosX, ballStartPosY);
				body.GetUserData().visible = true;
				(body.GetUserData() as DisplayObject).addEventListener(TouchEvent.TOUCH, ClipClick);
				
			}
		}
		
		//проверка идентичности содержимого двух векторов (без учета последовательности)
		private function VectorEqual (vec1: Vector.<String>, vec2: Vector.<String>): Boolean
		{
			if (vec1.length != vec2.length)
				return false;
			for (var i = 0; i < vec1.length; i++ )
				if (vec2.indexOf(vec1[i]) == -1)
					return false;
			return true;
		}
		
		//Проверка содержимого точек покоя
		private function CheckStaticPoints(): void
		{
			var currentCells: Vector.<String> = new Vector.<String>;
			staticbb = new Vector.<b2Body>;
			for (var i = 0; i < canCombineParticleVector.length; i++ )
				canCombineParticleVector[i].pause();
			myCrButtonSprite.name = "hide";
			createButtonPatricle.pause();
			generatorEnabled = true;
			for (var j = 0; j < staticPoints.length; j++ )
			{
				if (staticPoints[j].name == "")
					continue; 
				for (var bb:b2Body = m_world.GetBodyList(); bb; bb = bb.GetNext())
				{
					if (bb.GetUserData() is Beast && bb.name == staticPoints[j].name)
					{
						currentCells.push((bb.GetUserData() as Beast).type);
						staticbb.push(bb);
					}
				}
			}
			if (currentCells.length < 2)
				return;
			canCombine = -1;
			for (var i = 0; i < FormulsList.length; i++ )
			{
				if (VectorEqual(FormulsList[i] , currentCells))
				{
					//for (var j = 0; j < staticPoints.length; j++ )
						//if (staticPoints[j].name != "")
							//canCombineParticleVector[j].start();
					myCrButtonSprite.name = "show";
					canCombine = i;
					shadowMessage.ShowMessage("CAN COMBINE ELEMENTS");
					generatorEnabled = false;
				}
			}
		}
		
		private function CheckOnAchievements()
		{
			if (openedCombinations == 1)
				achievmentsPanel.ShowAchievement("First");
			else if (openedCombinations == 5)
				achievmentsPanel.ShowAchievement("Five");
			else if (openedCombinations == 10)
				achievmentsPanel.ShowAchievement("Ten");
		}
		
		private function CombineCells (e: TouchEvent = null)
		{
			if (e.getTouches(e.currentTarget as DisplayObject).length == 1
				&& e.getTouches(e.currentTarget as DisplayObject)[0].phase == TouchPhase.ENDED)
			{
				if (canCombine < 0)
					return;
					
				GenerateBallWithType(NamesList[canCombine]);
				if (! OpenList[canCombine])
				{
					//Сохраняемся и обновляеем панели после открытия нового элемента
					shadowMessage.ShowMessage("NEW ELEMENT: \n" + NamesList[canCombine]);
					OpenList[canCombine] = true;
					MyPanels.PreLoadTables();
					//SaveGame();
					openedCombinations++;
					CheckOnAchievements();
				}
				for (var j = 0; j < staticbb.length; j++ )
				{
					m_world.DestroyBody(staticbb[j]);
					staticbb[j].GetUserData().visible = false;
					removeChild(staticbb[j].GetUserData(), true);
				}
				for (var j = 0; j < staticPoints.length; j++ )
				{
					staticPoints[j].name = "";
				}
				canCombine = -1;
				CheckStaticPoints();
			}
		}
		
		
		//Обработчик клика на ячейке
		private function ClipClick(e: TouchEvent): void
		{
			if (MyPanels.Paused)
				return;
			var touches: Vector.<Touch> = e.getTouches(e.currentTarget as Sprite);
			 if (touches.length == 1)
			 {
				 if (touches[0].phase == TouchPhase.MOVED)
				 {
					for (var bb:b2Body = m_world.GetBodyList(); bb; bb = bb.GetNext())
					{
						if (bb.GetUserData() == e.currentTarget)
						{
							if (bb.IsActive())
								bb.SetActive(false);
							bb.SetPosition(new b2Vec2(touches[0].globalX / 30, touches[0].globalY / 30));
						}
					}
				 }
				 else if (touches[0].phase == TouchPhase.ENDED)
				 {
					for (var bb:b2Body = m_world.GetBodyList(); bb; bb = bb.GetNext())
					{
						if (bb.GetUserData() == e.currentTarget)
						{
							for (var j = 0; j < staticPoints.length; j++ )
							{
								if ( ((staticPoints[j].name == "" && bb.name == "") || (staticPoints[j].name == bb.name && bb.name!="")) &&
									MathHelper.GetLengthBetween(staticPoints[j].GetPosition().x, bb.GetPosition().x,  staticPoints[j].GetPosition().y, bb.GetPosition().y) < accuracyLength/30 )
								{
									bb.name = "sp" + j.toString();
									bb.SetActive(false);
									staticPoints[j].name = "sp" + j.toString();
									//поправка к положению
									var bb_x: Number = staticPoints[j].GetPosition().x * 30 + newBallRad + 3;
									bb.SetPosition(new b2Vec2(bb_x / 30.0, staticPoints[j].GetPosition().y));
									//!!
									CheckStaticPoints();
									//--
									return;
								}
								else if (staticPoints[j].name == bb.name && bb.name!="" &&
									MathHelper.GetLengthBetween(staticPoints[j].GetPosition().x, bb.GetPosition().x,  staticPoints[j].GetPosition().y, bb.GetPosition().y) >= accuracyLength/30 )
								{
									bb.name = "";
									staticPoints[j].name = "";
									bb.SetActive(true);
									bb.SetAwake(true);
									
									CheckStaticPoints();
									
									return;
								}
								else if (MathHelper.GetLengthBetween(staticPoints[j].GetPosition().x, bb.GetPosition().x,  staticPoints[j].GetPosition().y, bb.GetPosition().y) >= accuracyLength / 30 )
								{
									bb.SetActive(true);
									bb.SetAwake(true);
								}
							}
							
						}
					}
				 }
			 }
		}
		
		
		private function Update(e: Event): void
		{
			if (MyPanels.Paused)
			{
				addChild(MyPanels);
				//WaterPainter.stopRefresh = true;
				//waterFogParticle.pause();
				return;
			}
			/*(if (WaterPainter.stopRefresh)
			{
				WaterPainter.stopRefresh = false;
				waterFogParticle.start();
			}*/
			m_world.Step(m_timeStep, m_velocityIterations, m_positionIterations);
			m_world.ClearForces();
			for (var bb:b2Body = m_world.GetBodyList(); bb; bb = bb.GetNext())
			{
				if (bb.GetUserData() is ScenePainter)
				{
					
					var painterData:ScenePainter = bb.GetUserData() as ScenePainter;
					painterData.wall_x = bb.GetPosition().x * 30 - painterData.wall_width/2;
					painterData.wall_y = bb.GetPosition().y * 30 - painterData.wall_height/2;
					painterData.wall_rotation = bb.GetAngle();
				}
				else if (bb.GetUserData() is DisplayObject)
				{
					var sprite:DisplayObject = bb.GetUserData() as DisplayObject;
					sprite.x = bb.GetPosition().x * 30;
					sprite.y = bb.GetPosition().y * 30;
					sprite.rotation = bb.GetAngle();
				}
				
				//условия уничтожения bb объекта
				if (bb.GetPosition().y * 30 > stage.stageHeight)
				{
					removeChild(bb.GetUserData(), true);
					m_world.DestroyBody(bb);
				}
			}
			if (generatorEnabled)
				GenerateNewBall();
			addChild(WaterPainter);
			addChild(waterFogParticle);
			if (achievmentsPanel.alpha > 0)
				addChild(achievmentsPanel);
		}
		
	}
}