package 
{
	import fl.motion.BezierSegment;
	import flash.geom.Point;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.utils.Color;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ScenePainter extends Sprite
	{
		private:
			
			var myStage: Sprite;
			
			
		
		public:
			//флаг - вкл выкл отрисовки компонентов сцены
			var stopRefresh: Boolean = false;
			//флаг - рисовать ли воду
			var drawWater: Boolean = false;
			var drawWall: Boolean = false;
			//Задержка кадра в FPS
			var AnimationDelay = 0;
			
			//----------------------------
			
			
			
		public function ScenePainter() 
		{
			//myStage = parent;
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e: Event)
		{
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		
		//**ОТРИСОВКА ПЕРЕЛИВАЮЩЕЙСЯ ЖИДКОСТИ (включая переменные)
		//Переменные касательно воды
			public var water_length: Number = 200;
			public var water_x: Number = 0;
			public var water_y: Number = 0;
			public var water_amplitude: Number = 10;
			public var water_speed: Number = 1;
			public var water_quality: Number = 100;
			public var water_height = 150;
			//мощность градиента на жидкость
			public var water_gradient_step: Number = 0;
			//---------------------------------
			//Переменные касательно воды
			private var water_max1: Number = 0;
			private var water_max2: Number = 0;
			private var quadVector: Vector.<Quad> = new Vector.<Quad>();
			//шаг колебания волн (отклонение точек кривой безье)
			private var step: int = -1;
			//--------------------------
			
			var bezierSegment: BezierSegment = null;
		
		public function InitBezier (bezier: BezierSegment): BezierSegment
		{
			water_max1 = water_y + 	water_amplitude * Math.random() * -1 ;
			water_max2 = water_y + 	water_amplitude * Math.random();
			return  new BezierSegment(new Point(water_x, water_y), new Point(water_x +  Math.random() * (water_length / 100 * 33), water_y ), 
				new Point(water_x +  Math.random() * (water_length / 100 * 33) + water_length / 100 * 33, water_y), new Point(water_x + water_length, water_y));
			
			
		}
		
		
		private function BezierDraw(curve: BezierSegment): void
		{
			while (quadVector.length > 0)
			{
				quadVector[quadVector.length - 1].removeFromParent();
				quadVector.pop();
			}
			
			for (var i = 0; i < water_quality; i++ )
			{
				
				var qBuf: Quad = new Quad(6, water_height , Color.rgb(4, 130, 213));
				qBuf.setVertexColor(2, Color.argb(50,0,0,0));
				qBuf.setVertexColor(3, Color.argb(50,0,0,0));
				qBuf.x  = curve.getValue(i / water_quality).x-3;
				qBuf.y  = curve.getValue(i / water_quality).y;
				quadVector.push(qBuf);
				this.addChild(quadVector[quadVector.length - 1]);
			}
		}
		
		public function DrawWater(): void
		{
			if (bezierSegment == null)
				bezierSegment = InitBezier(bezierSegment);
			BezierDraw(bezierSegment);
			if (bezierSegment.b.y > water_max1 && water_max1 < water_y)
				bezierSegment.b.y -= water_speed;
			else if (bezierSegment.b.y < water_max1 && water_max1 > water_y)
				bezierSegment.b.y += water_speed;
			else 
				{
					if (water_max1 <= water_y) water_max1 = water_y + 	water_amplitude * Math.random();
					else water_max1 = water_y + 	water_amplitude * Math.random() * -1 ;
				}
			if (bezierSegment.c.y > water_max2 && water_max2 < water_y)
				bezierSegment.c.y -= water_speed;
			else if (bezierSegment.c.y < water_max2 && water_max2 > water_y)
				bezierSegment.c.y += water_speed;
			else 
				{
					if (water_max2 <= water_y) water_max2 = water_y + 	water_amplitude * Math.random();
					else water_max2 = water_y + 	water_amplitude * Math.random() * -1 ;
				}
		}
		
		
		// ОТРИСОВКА ЖИДКОСТИ--------------------------------------------------------------------------------
		
		//Отрисовка стен:
		
		public var wall_firstColor: uint;
		public var wall_secondColor: uint;
		public var wall_x = 0;
		public var wall_y = 0;
		public var wall_width = 0;
		public var wall_height = 0;
		public var wall_orientation = 1;
		public var wall_rotation = 0;
		
		var wallQuad: Quad;
		private function DrawWall()
		{
			if (wallQuad != null)
				wallQuad.removeFromParent(true);
			wallQuad = new Quad(wall_width, wall_height);
			wallQuad.x = wall_x;
			wallQuad.y = wall_y;
			wallQuad.rotation = wall_rotation;
			//orientation: 0 left 1 right 2 down 3 up
			switch (wall_orientation) 
			{
				case 0: { wallQuad.setVertexColor(2, wall_firstColor); wallQuad.setVertexColor(0, wall_firstColor); wallQuad.setVertexColor(1, wall_secondColor); wallQuad.setVertexColor(3, wall_secondColor); break; }
				case 1: { wallQuad.setVertexColor(1, wall_firstColor); wallQuad.setVertexColor(3, wall_firstColor); wallQuad.setVertexColor(2, wall_secondColor); wallQuad.setVertexColor(0, wall_secondColor); break; }
				case 2: { wallQuad.setVertexColor(0, wall_firstColor); wallQuad.setVertexColor(1, wall_firstColor); wallQuad.setVertexColor(2, wall_secondColor); wallQuad.setVertexColor(3, wall_secondColor); break; }
				case 3: { wallQuad.setVertexColor(3, wall_firstColor); wallQuad.setVertexColor(2, wall_firstColor); wallQuad.setVertexColor(1, wall_secondColor); wallQuad.setVertexColor(0, wall_secondColor); break; }
			}
			//myStage
			this.addChild(wallQuad);
		}
		
		//-----------------------------------------------------------------------
		
		var delayBuf = 0;
		private function update(e: Event): void
		{
			if (stopRefresh)
				return;
			if (delayBuf < AnimationDelay)
			{
				delayBuf++;
				return;
			}
			else 
				delayBuf = 0;
				
			if (drawWater)
				DrawWater();
			if (drawWall)
				DrawWall();
		}
		
		
		
	}

}