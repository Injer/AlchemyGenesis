package
{
import Box2D.Collision.Shapes.b2MassData;
import flash.display.Bitmap;
import flash.display.Stage;
import starling.animation.Juggler;
import starling.core.Starling;
import starling.display.Button;
import starling.display.DisplayObject;
import starling.display.MovieClip;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.deg2rad;

import Box2D.Collision.Shapes.b2CircleShape;
import Box2D.Collision.Shapes.b2PolygonShape;
import Box2D.Common.Math.b2Vec2;
import Box2D.Dynamics.b2Body;
import Box2D.Dynamics.b2BodyDef;
import Box2D.Dynamics.b2FixtureDef;
import Box2D.Dynamics.b2World;



	public class Game2 extends Sprite
	{
		 private var bodyDef:b2BodyDef;
		 public var m_world:b2World;
		 public var m_velocityIterations:int = 10;
		 public var m_positionIterations:int = 10;
		 public var m_timeStep:Number = 1.0 / 30.0;
		var frames:Vector.<Texture>;
		
		
		private var sausagesVector:Vector.<CustomImage> = new Vector.<CustomImage>(NUM_SAUSAGES, true);
		private const NUM_SAUSAGES:uint = 400;
		[Embed(source="../res/logo.png")]
		private static const Sausage:Class;
 
		[Embed(source = "../res/Greebo.png")]
		private const SpriteSheet: Class;
 
		[Embed(source="../res/Greebo.xml", mimeType="application/octet-stream")]
		public const spriteSheetXML:Class;
		
		[Embed(source = "../res/Logo.png")]
		private const Logo: Class;
		
		
 
		
	 public function Game2()
	 {
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	 }
	 
	 
 
	 private function onAdded(e:Event):void
	 {
		var logoBitmap: Bitmap = new Logo();
		var logoTex: Texture = Texture.fromBitmap(logoBitmap);
		
		var myBitmap: Bitmap = new SpriteSheet();
		var texture: Texture = Texture.fromBitmap(myBitmap);
		
		var xml:XML = XML(new spriteSheetXML());
		var sTextureAtlas: TextureAtlas = new TextureAtlas(texture, xml); 
		frames = sTextureAtlas.getTextures("greebo-");
		var movie = new MovieClip(frames, 60);
		addChild(movie);
		movie.y = 60;
		Starling.juggler.add(movie);
		movie.play();
		
		movie.addEventListener(TouchEvent.TOUCH, onTouch);
		
		
		var gravity:b2Vec2 = new b2Vec2(0.0, 10.0);
		var doSleep:Boolean = true;
		m_world = new b2World(gravity, doSleep);
		addEventListener(Event.ENTER_FRAME, Update);
		
		var quad: Quad = new Quad(100, 100, 0xffffff);
		quad.pivotX = quad.width / 2.0;
		quad.pivotY = quad.height / 2.0;
		var boxShape: b2PolygonShape = new b2PolygonShape();
		var fixtureDef:b2FixtureDef = new b2FixtureDef();
		var body: b2Body;
		bodyDef = new b2BodyDef();
		bodyDef.type = b2Body.b2_staticBody;
		bodyDef.position.x = 0;
		bodyDef.position.y = stage.stageHeight / 30 - 1;
		boxShape.SetAsBox(stage.stageWidth / 30, 2);
		fixtureDef.shape = boxShape;
		fixtureDef.density = 0.0;
		fixtureDef.friction = 0.5;
		fixtureDef.restitution = 0.2;
		bodyDef.userData = quad;
		bodyDef.userData.width = 30*2*stage.stageWidth / 30;
		bodyDef.userData.height = 30*2*2;
		body = m_world.CreateBody(bodyDef);
	
		body.CreateFixture(fixtureDef);
		addChild(bodyDef.userData);
		
		
		//var myButton: Button = new Button(logoTex, "Test Button");
		//myButton.x = 800 / 2 - myButton.width / 2;
		//myButton.y = 600 / 2 - myButton.height / 2;
		//addChild(myButton);
		
		var demo: Demo = new Demo();
		demo.name = "part";
		addChild(demo);
		

	  stage.addEventListener(Event.ENTER_FRAME, onFrame);
	 }
	 
	 private function AddCircles (count: int)
	 {
		var quad: Quad;
		var boxShape: b2PolygonShape;
		var circleShape: b2CircleShape;
		var fixtureDef:b2FixtureDef = new b2FixtureDef();
		var body: b2Body;
		for (var i:int = 0; i < count; i++)
		{
			bodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.position.x = Math.random() * 15 + 5;
			bodyDef.position.y = Math.random() * 10;
			var rX:Number = Math.random() + 0.5;
			var rY:Number = Math.random() + 0.5;
			var rad: Number = 1;
			circleShape = new b2CircleShape(rad);
			fixtureDef.shape = circleShape;
			fixtureDef.density = 10;
			
			fixtureDef.friction = 0.5;
			fixtureDef.restitution = 0.2;
			var movie = new MovieClip(frames, 60);
			movie.pivotX = movie.width / 2;
			movie.pivotY = movie.height / 2;
			addChild(movie);
			movie.addEventListener(TouchEvent.TOUCH, onTouch);
			Starling.juggler.add(movie);
			bodyDef.userData = movie;
			bodyDef.userData.width = rad *2* 30;
			bodyDef.userData.height = rad *2* 30;
			body = m_world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			//Set static
			body.setCustomGravity(new b2Vec2(0, 0));
			body.SetAngularDamping(100);
			body.SetLinearDamping(100);
			body.GetFixtureList().SetDensity(100);
			body.ResetMassData();
			//
			addChild(bodyDef.userData);
		}
	 }
	 
	 private function Update(e: Event): void
	 {
		 m_world.Step(m_timeStep, m_velocityIterations, m_positionIterations);
		 m_world.ClearForces();
		 for (var bb:b2Body = m_world.GetBodyList(); bb; bb = bb.GetNext())
		 {
		   if (bb.GetUserData() is DisplayObject)
		   {
				var sprite:DisplayObject = bb.GetUserData() as DisplayObject;
				sprite.x = bb.GetPosition().x * 30;
				sprite.y = bb.GetPosition().y * 30;
				sprite.rotation = bb.GetAngle();
		   }
			if (bb.GetPosition().y * 30 > stage.stageHeight)
			{
				m_world.DestroyBody(bb);
				Starling.juggler.remove(bb.GetUserData());
				removeChild(bb.GetUserData());
			}
		 }
	 }
 
 private function onTouch(e: TouchEvent)
 {
	 var touches: Vector.<Touch> = e.getTouches(e.currentTarget as MovieClip);
	 if (touches.length == 1)
	 {
		 if (touches[0].phase == TouchPhase.ENDED)
		 {
			AddCircles(1);
			for (var bb:b2Body = m_world.GetBodyList(); bb; bb = bb.GetNext())
			{
				if (bb.GetUserData() == e.currentTarget)
				{
					bb.SetAngularDamping(0);
					bb.SetLinearDamping(0);
					bb.GetFixtureList().SetDensity(10);
					bb.ResetMassData();
					bb.clearCustomGravity();
					bb.ApplyForce(new b2Vec2(0, 5), new b2Vec2(0, 0));
				}
			}
			
			if ((e.currentTarget as MovieClip).isPlaying)
				(e.currentTarget as MovieClip).pause();
			else 
				(e.currentTarget as MovieClip).play();
		 }
	 }
	 
 }
 
 private function onFrame(e:Event):void
 {
	//if (getChildByName("part").x >= 800)
	//	getChildByName("part").x = 0;
  }
 
}
}