package Beasts 
{
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.text.BitmapChar;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.Color;
	/**
	 * ...
	 * @author injer
	 */
	public class Light extends Cell
	{
		[Embed(source = "/../res/beasts/light/light.png")]
		const TestBall: Class;
		[Embed(source="/../res/beasts/light/light.xml", mimeType="application/octet-stream")]
		const TestBallXML:Class;
		
		public function Light(rad: int) 
		{
			this.width = rad * 2;
			this.height = rad * 2;
			var tex = Texture.fromBitmap(new TestBall());
			var xml: XML = XML(new TestBallXML());
			var textAtlas: TextureAtlas = new TextureAtlas(tex, xml);
			var frames: Vector.<Texture> = textAtlas.getTextures("greebo-");
			mainClip = new MovieClip(frames, 60);
			mainClip.width = rad * 2;
			mainClip.height = rad * 2;
			mainClip.pivotX = mainClip.width;
			mainClip.pivotY = mainClip.height;
			Starling.juggler.add(mainClip);
			addChild(mainClip);
			type = "Light";
			var text: TextField = new TextField(rad * 2, rad * 2, "Light", "Verdana", 12, Color.argb(100, 0, 255, 0));
			text.x = -rad;
			text.y = -rad;
			addChild(text);
		}
		
	}

}