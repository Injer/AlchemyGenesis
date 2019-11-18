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
	public class Darkness extends Cell
	{
		[Embed(source = "/../res/beasts/darkness/darkness.png")]
		const Ball: Class;
		[Embed(source="/../res/beasts/darkness/darkness.xml", mimeType="application/octet-stream")]
		const BallXML:Class;
		
		public function Darkness(rad: int) 
		{
			this.width = rad * 2;
			this.height = rad * 2;
			var tex = Texture.fromBitmap(new Ball());
			var xml: XML = XML(new BallXML());
			var textAtlas: TextureAtlas = new TextureAtlas(tex, xml);
			var frames: Vector.<Texture> = textAtlas.getTextures("darkness-");
			mainClip = new MovieClip(frames, 60);
			mainClip.width = rad * 2;
			mainClip.height = rad * 2;
			mainClip.pivotX = mainClip.width;
			mainClip.pivotY = mainClip.height;
			Starling.juggler.add(mainClip);
			addChild(mainClip);
			var text: TextField = new TextField(rad * 2, rad * 2, "Darkness", "Verdana", 12, Color.argb(100, 0, 255, 0));
			text.x = -rad;
			text.y = -rad;
			addChild(text);
			type = "darkness";
		}
		
	}

}