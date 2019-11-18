package Beasts 
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.Color;
	import PDParticleSystem;
    import ParticleSystem;
	/**
	 * ...
	 * @author injer
	 */
	public class Beast extends Sprite
	{	
		public var mainClip: MovieClip;
		public var type: String;
		
		private var traceParticle: PDParticleSystem;
		
		public function HideParticle()
		{
			traceParticle.stop();
			traceParticle.visible = false;
		}
		
		public function ShowParticle()
		{
			traceParticle.start();
			traceParticle.visible = true;
		}
		
		public function Beast(texContainer: TextureContainer, type: String, rad: int) 
		{
			this.width = rad * 2;
			this.height = rad * 2;
			var textAtlas: TextureAtlas = texContainer.GetAtlas(type);
			if (textAtlas == null)
			{
				trace("empty texture atlas");
				return;
			}
			traceParticle = new PDParticleSystem(texContainer.TraceXML, texContainer.TraceTexture);
			traceParticle.emitterX = this.width/2;
			traceParticle.emitterY = 0;
			traceParticle.scaleX = 0.5;
			traceParticle.scaleY = 0.3;
			traceParticle.start();
			
			addChild(traceParticle);
			Starling.juggler.add(traceParticle);
			
			var frames: Vector.<Texture> = textAtlas.getTextures("greebo-");
			mainClip = new MovieClip(frames, 60);
			mainClip.width = rad * 2;
			mainClip.height = rad * 2;
			mainClip.pivotX = mainClip.width;
			mainClip.pivotY = mainClip.height;
			Starling.juggler.add(mainClip);
			addChild(mainClip);
			var text: TextField = new TextField(rad*2, rad*2, type,"Verdana",12,Color.argb(100,0,255,0));
			text.x = -rad;
			text.y = -rad;
			addChild(text);
			this.type = type;
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		public function onRemovedFromStage(e: Event):void
        {
            Starling.juggler.remove(traceParticle);
			traceParticle.removeFromParent(true);
			Starling.juggler.remove(mainClip);
			mainClip.removeFromParent(true);
        }
	}

}