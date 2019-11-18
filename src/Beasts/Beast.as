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
	public class Beast extends Cell
	{	
		public function Beast(texContainer: TextureContainer, type: String, rad: int) 
		{
			this.width = rad * 2;
			this.height = rad * 2;
			var textAtlas: TextureAtlas = texContainer.GetAtlas(type);
			if (textAtlas == null)
			{
				trace("error");
				return;
			}
			var frames: Vector.<Texture> = textAtlas.getTextures("greebo-");
			mainClip = new MovieClip(frames, 60);
			mainClip.width = rad * 2;
			mainClip.height = rad * 2;
			mainClip.pivotX = mainClip.width;// / 2;
			mainClip.pivotY = mainClip.height;// / 2;
			Starling.juggler.add(mainClip);
			addChild(mainClip);
			var text: TextField = new TextField(rad*2, rad*2, type,"Verdana",12,Color.argb(100,0,255,0));
			text.x = -rad;
			text.y = -rad;
			addChild(text);
			this.type = type;
		}
	}

}