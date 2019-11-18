package  
{
	import _fla.MainTimeline;
	import Box2D.Collision.Shapes.b2MassData;
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.sampler.NewObjectSample;
	import starling.animation.Juggler;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
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
	
	import ScenePainter;
	import Beasts.Beast;
	
	public class ObjectConstructor 
	{
		
		public static function SetStatic (body: b2Body): void
		{
			body.setCustomGravity(new b2Vec2(0, 0));
			body.SetAngularDamping(100);
			body.SetLinearDamping(100);
			body.GetFixtureList().SetDensity(100);
			body.ResetMassData();
		}
		
		public static function SetDynamic (body: b2Body): void
		{
			body.clearCustomGravity();
			body.SetAngularDamping(0);
			body.SetLinearDamping(0);
			body.GetFixtureList().SetDensity(10);
			body.GetFixtureList().SetRestitution(0.2);
			body.ResetMassData();
			body.ApplyForce(new b2Vec2(0, 5), new b2Vec2(0, 0));
		}
		
		//Создает Static Point
		public static function CreateStaticPoint (parent: Sprite, m_world: b2World, rad: Number, startPosX: Number, startPosY: Number): b2Body
		{
			//[Embed(source = "../res/staticPoint.png")]
			//const StaticPointCover: Class;
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			var body: b2Body;
			var bodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_staticBody;
			bodyDef.position.x = startPosX / 30;
			bodyDef.position.y = startPosY / 30;
			var circleShape = new b2CircleShape(rad/30);
			fixtureDef.shape = circleShape;
			fixtureDef.filter.categoryBits = 0x0001;
			fixtureDef.filter.maskBits =  0x0002;
			//var bitmap = new StaticPointCover();
			//var tex = Texture.fromBitmap(bitmap);
			//var userdata: Image = new Image(tex) ;
			//userdata.width = rad * 2;
			//userdata.height = rad * 2;
			
			//userdata.pivotX = rad*2+10;
			//userdata.pivotY = rad*2+10;
			
			//bodyDef.userData = userdata;
			body = m_world.CreateBody(bodyDef);
			body.name = "";
			body.CreateFixture(fixtureDef);
			//parent.addChild(bodyDef.userData);
			return body;
		}
		
		public static function CreateBeast(type: String, texContainer: TextureContainer, rad: Number, CurrX: int, CurrY: int): Beast
		{
			var beast = new Beast(texContainer, type, rad + 5);
			beast.x = CurrX;
			beast.y = CurrY;
			return beast;
		}
		
		//Создает ячейку
		public static function CreateBall (parent: Sprite, m_world: b2World, texContainer: TextureContainer, type: String, rad: Number, startPosX: Number, startPosY: Number): b2Body
		{
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			var bodyCell: b2Body;
			var bodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.position.x = startPosX / 30;
			bodyDef.position.y = startPosY / 30;
			var circleShape = new b2CircleShape(rad/30);
			fixtureDef.shape = circleShape;
			fixtureDef.density = 5;
			fixtureDef.friction = 0.5;
			fixtureDef.restitution = 0.2;
			fixtureDef.filter.groupIndex = 1;
			//Инициалиализируем маску
			fixtureDef.filter.categoryBits = 0x0003;
			fixtureDef.filter.maskBits =  0x0002;
			//Создаем существо с некоторым типом
			var beast = new Beast(texContainer, type, rad);
			beast.visible = false;
			bodyDef.userData = beast;
			beast.x = startPosX;
			beast.y = startPosY;
			bodyCell = m_world.CreateBody(bodyDef);
			bodyCell.name = "";
			bodyCell.CreateFixture(fixtureDef);
			bodyCell.SetBullet(true);
			parent.addChild(bodyDef.userData as Sprite);

			return bodyCell;
		}
		
		//Orientation: 0 - left wall, 1 - right wall
		public static function CreateWall (parent: Sprite, mWorld: b2World, wallWidth: Number, wallHeight: Number, 
		wall_x: Number, wall_y: Number, orientation: Number, firstColor: uint, secondColor: uint): void
		{
			//[Embed(source = "../res/wall.png")]
			//const WallImage: Class;
			
			//var wallBitmap = new WallImage();
			//var wallTexture: Texture = Texture.fromBitmap(wallBitmap);
			//var image: Image = new Image(wallTexture);
			var boxShape: b2PolygonShape = new b2PolygonShape();
			var fixtureDef: b2FixtureDef = new b2FixtureDef();
			var body: b2Body;
			var bodyDef: b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_staticBody;
			bodyDef.position.x = (wall_x+wallWidth/2) / 30;
			bodyDef.position.y = (wall_y+wallHeight/2) / 30;
			
			boxShape.SetAsBox(wallWidth/2 / 30, wallHeight/2 / 30);
			fixtureDef.shape = boxShape;
			fixtureDef.density = 0.0;
			fixtureDef.friction = 0.5;
			fixtureDef.restitution = 0.0;
			fixtureDef.filter.categoryBits = 0x0002;
			fixtureDef.filter.maskBits =  0x0003 ;
			
			
			var myPainter: ScenePainter = new ScenePainter();
			myPainter.AnimationDelay = 1;
			
				myPainter.wall_height = wallHeight;
				myPainter.wall_width = wallWidth;
				myPainter.wall_x = wall_x;
				myPainter.wall_y = wall_y;
				myPainter.wall_rotation = bodyDef.angle;
				myPainter.wall_firstColor = firstColor; 
				myPainter.wall_secondColor = secondColor;
				myPainter.wall_orientation = orientation;
				myPainter.drawWall = true;
			
			bodyDef.userData = myPainter;
			bodyDef.userData.width = wallWidth;
			bodyDef.userData.height = parent.height;
			body = mWorld.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			parent.addChild(bodyDef.userData);
		}
		
		public function ObjectConstructor() 
		{
			
		}
		
	}

}