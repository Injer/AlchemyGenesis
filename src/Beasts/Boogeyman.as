package Beasts 
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.Color;
	/**
	 * ...
	 * @author injer
	 */
	public class Boogeyman extends Cell
	{
		[Embed(source = "/../res/beasts/Boogeyman/test.png")]
		const TestBall: Class;
		[Embed(source="/../res/beasts/Boogeyman/test.xml", mimeType="application/octet-stream")]
		const TestBallXML:Class;
		
		public function Boogeyman(rad: int) 
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
			mainClip.pivotX = mainClip.width;// / 2;
			mainClip.pivotY = mainClip.height;// / 2;
			Starling.juggler.add(mainClip);
			addChild(mainClip);
			var text: TextField = new TextField(rad*2, rad*2, "Boogeyman","Verdana",12,Color.argb(100,0,255,0));
			text.x = -rad;
			text.y = -rad;
			addChild(text);
			type = "Boogeyman";
		}
		
	}

}