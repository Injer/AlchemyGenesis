package  
{
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Injer
	 */
	/*	//Существа
	import Beasts.Brain;
	import Beasts.Darkness;
	import Beasts.Light;
	import Beasts.Life;
	import Beasts.Death;
	import Beasts.Clows;
	import Beasts.Chitin;
	import Beasts.Fire;
	import Beasts.Hairs;
	import Beasts.Hands;
	import Beasts.Legs;
	import Beasts.Plankton;
	import Beasts.Scale;
	import Beasts.Tail;
	import Beasts.Teeth;
	import Beasts.Wings;
	import Beasts.Devil;
	import Beasts.Demon;
	import Beasts.Spirit;
	import Beasts.LichKing;
	import Beasts.Ghost;
	import Beasts.DavyJones;
	import Beasts.Armageddon;
	import Beasts.Cthulhu;
	import Beasts.Boogeyman;
	import Beasts.Telepaty;
	import Beasts.Scuid;
	import Beasts.EvilGenius;
	import Beasts.Shrimp;
	import Beasts.Crab;
	import Beasts.Kraken;
	import Beasts.Octopus;
	import Beasts.Poseidon;
	import Beasts.Mermaid;
	import Beasts.SnowTroll;
	import Beasts.Yetti;
	import Beasts.Alien;
	import Beasts.UFOMen;
	import Beasts.FlyingFish;
	import Beasts.Mutant;
	import Beasts.Fenix;
	import Beasts.Grifon;
	import Beasts.Bird;
	import Beasts.Pterodak;
	import Beasts.FireLizard;
	import Beasts.Dragon;
	import Beasts.Tyrex;
	import Beasts.Crocodile;
	import Beasts.Evil;
	import Beasts.Torch;
	import Beasts.Vampire;
	import Beasts.Zombie;
	import Beasts.Corp;
	import Beasts.Fish;
	import Beasts.Ash;
	import Beasts.Void;
	import Beasts.Monster;
	import Beasts.Speech;
	//-----------------------*/
	 
	 
	 
	public class TextureContainer 
	{
		/*текстуры для инициализации мув клипа всех существ */
		[Embed(source = "/../res/beasts/test/test.png")]
		const TestBall: Class;
		[Embed(source="/../res/beasts/test/test.xml", mimeType="application/octet-stream")]
		const TestBallXML:Class;
		
		[Embed(source = "/../res/beasts/Alien/test.png")]
		const Alien: Class;
		[Embed(source="/../res/beasts/Alien/test.xml", mimeType="application/octet-stream")]
		const AlienXML:Class;
		
		[Embed(source = "/../res/beasts/Armageddon/test.png")]
		const Armageddon: Class;
		[Embed(source="/../res/beasts/Armageddon/test.xml", mimeType="application/octet-stream")]
		const ArmageddonXML:Class;
		
		[Embed(source = "/../res/beasts/Ash/test.png")]
		const Ash: Class;
		[Embed(source="/../res/beasts/Ash/test.xml", mimeType="application/octet-stream")]
		const AshXML:Class;
		
		[Embed(source = "/../res/beasts/Bird/test.png")]
		const Bird: Class;
		[Embed(source="/../res/beasts/Bird/test.xml", mimeType="application/octet-stream")]
		const BirdXML:Class;
		
		[Embed(source = "/../res/beasts/Brain/test.png")]
		const Brain: Class;
		[Embed(source="/../res/beasts/Brain/test.xml", mimeType="application/octet-stream")]
		const BrainXML:Class;
		
		[Embed(source = "/../res/beasts/Darkness/test.png")]
		const Darkness: Class;
		[Embed(source="/../res/beasts/Darkness/test.xml", mimeType="application/octet-stream")]
		const DarknessXML:Class;
		
		[Embed(source = "/../res/beasts/Light/test.png")]
		const Light: Class;
		[Embed(source="/../res/beasts/Light/test.xml", mimeType="application/octet-stream")]
		const LightXML:Class;
		
		[Embed(source = "/../res/beasts/Life/test.png")]
		const Life: Class;
		[Embed(source="/../res/beasts/Life/test.xml", mimeType="application/octet-stream")]
		const LifeXML:Class;
		
		[Embed(source = "/../res/beasts/Death/test.png")]
		const Death: Class;
		[Embed(source="/../res/beasts/Death/test.xml", mimeType="application/octet-stream")]
		const DeathXML:Class;
		
		[Embed(source = "/../res/beasts/Clows/test.png")]
		const Clows: Class;
		[Embed(source="/../res/beasts/Clows/test.xml", mimeType="application/octet-stream")]
		const ClowsXML:Class;
		
		[Embed(source = "/../res/beasts/Chitin/test.png")]
		const Chitin: Class;
		[Embed(source="/../res/beasts/Chitin/test.xml", mimeType="application/octet-stream")]
		const ChitinXML:Class;
		
		[Embed(source = "/../res/beasts/Fire/test.png")]
		const Fire: Class;
		[Embed(source="/../res/beasts/Fire/test.xml", mimeType="application/octet-stream")]
		const FireXML:Class;
		
		[Embed(source = "/../res/beasts/Hairs/test.png")]
		const Hairs: Class;
		[Embed(source="/../res/beasts/Hairs/test.xml", mimeType="application/octet-stream")]
		const HairsXML:Class;
		
		[Embed(source = "/../res/beasts/Hands/test.png")]
		const Hands: Class;
		[Embed(source="/../res/beasts/Hands/test.xml", mimeType="application/octet-stream")]
		const HandsXML:Class;
		
		[Embed(source = "/../res/beasts/Legs/test.png")]
		const Legs: Class;
		[Embed(source="/../res/beasts/Legs/test.xml", mimeType="application/octet-stream")]
		const LegsXML:Class;
		
		[Embed(source = "/../res/beasts/Plankton/test.png")]
		const Plankton: Class;
		[Embed(source="/../res/beasts/Plankton/test.xml", mimeType="application/octet-stream")]
		const PlanktonXML:Class;
		
		[Embed(source = "/../res/beasts/Scale/test.png")]
		const Scale: Class;
		[Embed(source="/../res/beasts/Scale/test.xml", mimeType="application/octet-stream")]
		const ScaleXML:Class;
		
		[Embed(source = "/../res/beasts/Tail/test.png")]
		const Tail: Class;
		[Embed(source="/../res/beasts/Tail/test.xml", mimeType="application/octet-stream")]
		const TailXML:Class;
		
		[Embed(source = "/../res/beasts/Teeth/test.png")]
		const Teeth: Class;
		[Embed(source="/../res/beasts/Teeth/test.xml", mimeType="application/octet-stream")]
		const TeethXML:Class;
		
		[Embed(source = "/../res/beasts/Wings/test.png")]
		const Wings: Class;
		[Embed(source="/../res/beasts/Wings/test.xml", mimeType="application/octet-stream")]
		const WingsXML:Class;
		
		[Embed(source = "/../res/beasts/Devil/test.png")]
		const Devil: Class;
		[Embed(source="/../res/beasts/Devil/test.xml", mimeType="application/octet-stream")]
		const DevilXML:Class;
		
		[Embed(source = "/../res/beasts/Demon/test.png")]
		const Demon: Class;
		[Embed(source="/../res/beasts/Demon/test.xml", mimeType="application/octet-stream")]
		const DemonXML:Class;
		
		[Embed(source = "/../res/beasts/Spirit/test.png")]
		const Spirit: Class;
		[Embed(source="/../res/beasts/Spirit/test.xml", mimeType="application/octet-stream")]
		const SpiritXML:Class;
		
		[Embed(source = "/../res/beasts/LichKing/test.png")]
		const LichKing: Class;
		[Embed(source="/../res/beasts/LichKing/test.xml", mimeType="application/octet-stream")]
		const LichKingXML:Class;
		
		[Embed(source = "/../res/beasts/Ghost/test.png")]
		const Ghost: Class;
		[Embed(source="/../res/beasts/Ghost/test.xml", mimeType="application/octet-stream")]
		const GhostXML:Class;
		
		[Embed(source = "/../res/beasts/DavyJones/test.png")]
		const DavyJones: Class;
		[Embed(source="/../res/beasts/DavyJones/test.xml", mimeType="application/octet-stream")]
		const DavyJonesXML:Class;
		
		[Embed(source = "/../res/beasts/Cthulhu/test.png")]
		const Cthulhu: Class;
		[Embed(source="/../res/beasts/Cthulhu/test.xml", mimeType="application/octet-stream")]
		const CthulhuXML:Class;
		
		[Embed(source = "/../res/beasts/Boogeyman/test.png")]
		const Boogeyman: Class;
		[Embed(source="/../res/beasts/Boogeyman/test.xml", mimeType="application/octet-stream")]
		const BoogeymanXML:Class;
		
		[Embed(source = "/../res/beasts/Telepaty/test.png")]
		const Telepaty: Class;
		[Embed(source="/../res/beasts/Telepaty/test.xml", mimeType="application/octet-stream")]
		const TelepatyXML:Class;
		
		[Embed(source = "/../res/beasts/Scuid/test.png")]
		const Scuid: Class;
		[Embed(source="/../res/beasts/Scuid/test.xml", mimeType="application/octet-stream")]
		const ScuidXML:Class;
		
		[Embed(source = "/../res/beasts/EvilGenius/test.png")]
		const EvilGenius: Class;
		[Embed(source="/../res/beasts/EvilGenius/test.xml", mimeType="application/octet-stream")]
		const EvilGeniusXML:Class;
		
		[Embed(source = "/../res/beasts/Shrimp/test.png")]
		const Shrimp: Class;
		[Embed(source="/../res/beasts/Shrimp/test.xml", mimeType="application/octet-stream")]
		const ShrimpXML:Class;
		
		[Embed(source = "/../res/beasts/Crab/test.png")]
		const Crab: Class;
		[Embed(source="/../res/beasts/Crab/test.xml", mimeType="application/octet-stream")]
		const CrabXML:Class;
		
		[Embed(source = "/../res/beasts/Kraken/test.png")]
		const Kraken: Class;
		[Embed(source="/../res/beasts/Kraken/test.xml", mimeType="application/octet-stream")]
		const KrakenXML:Class;
		
		[Embed(source = "/../res/beasts/Octopus/test.png")]
		const Octopus: Class;
		[Embed(source="/../res/beasts/Octopus/test.xml", mimeType="application/octet-stream")]
		const OctopusXML:Class;
		
		[Embed(source = "/../res/beasts/Poseidon/test.png")]
		const Poseidon: Class;
		[Embed(source="/../res/beasts/Poseidon/test.xml", mimeType="application/octet-stream")]
		const PoseidonXML:Class;
		
		[Embed(source = "/../res/beasts/Mermaid/test.png")]
		const Mermaid: Class;
		[Embed(source="/../res/beasts/Mermaid/test.xml", mimeType="application/octet-stream")]
		const MermaidXML:Class;
		
		[Embed(source = "/../res/beasts/SnowTroll/test.png")]
		const SnowTroll: Class;
		[Embed(source="/../res/beasts/SnowTroll/test.xml", mimeType="application/octet-stream")]
		const SnowTrollXML:Class;
		
		[Embed(source = "/../res/beasts/Yetti/test.png")]
		const Yetti: Class;
		[Embed(source="/../res/beasts/Yetti/test.xml", mimeType="application/octet-stream")]
		const YettiXML:Class;
		
		[Embed(source = "/../res/beasts/UFOMen/test.png")]
		const UFOMen: Class;
		[Embed(source="/../res/beasts/UFOMen/test.xml", mimeType="application/octet-stream")]
		const UFOMenXML:Class;
		
		[Embed(source = "/../res/beasts/FlyingFish/test.png")]
		const FlyingFish: Class;
		[Embed(source="/../res/beasts/FlyingFish/test.xml", mimeType="application/octet-stream")]
		const FlyingFishXML:Class;
		
		[Embed(source = "/../res/beasts/Mutant/test.png")]
		const Mutant: Class;
		[Embed(source="/../res/beasts/Mutant/test.xml", mimeType="application/octet-stream")]
		const MutantXML:Class;
		
		[Embed(source = "/../res/beasts/Fenix/test.png")]
		const Fenix: Class;
		[Embed(source="/../res/beasts/Fenix/test.xml", mimeType="application/octet-stream")]
		const FenixXML:Class;
		
		[Embed(source = "/../res/beasts/Grifon/test.png")]
		const Grifon: Class;
		[Embed(source="/../res/beasts/Grifon/test.xml", mimeType="application/octet-stream")]
		const GrifonXML:Class;
		
		[Embed(source = "/../res/beasts/Pterodak/test.png")]
		const Pterodak: Class;
		[Embed(source="/../res/beasts/Pterodak/test.xml", mimeType="application/octet-stream")]
		const PterodakXML:Class;
		
		[Embed(source = "/../res/beasts/FireLizard/test.png")]
		const FireLizard: Class;
		[Embed(source="/../res/beasts/FireLizard/test.xml", mimeType="application/octet-stream")]
		const FireLizardXML:Class;
		
		[Embed(source = "/../res/beasts/Dragon/test.png")]
		const Dragon: Class;
		[Embed(source="/../res/beasts/Dragon/test.xml", mimeType="application/octet-stream")]
		const DragonXML:Class;
		
		[Embed(source = "/../res/beasts/Tyrex/test.png")]
		const Tyrex: Class;
		[Embed(source="/../res/beasts/Tyrex/test.xml", mimeType="application/octet-stream")]
		const TyrexXML:Class;
		
		[Embed(source = "/../res/beasts/Crocodile/test.png")]
		const Crocodile: Class;
		[Embed(source="/../res/beasts/Crocodile/test.xml", mimeType="application/octet-stream")]
		const CrocodileXML:Class;

		[Embed(source = "/../res/beasts/Evil/test.png")]
		const Evil: Class;
		[Embed(source="/../res/beasts/Evil/test.xml", mimeType="application/octet-stream")]
		const EvilXML:Class;

		[Embed(source = "/../res/beasts/Torch/test.png")]
		const Torch: Class;
		[Embed(source="/../res/beasts/Torch/test.xml", mimeType="application/octet-stream")]
		const TorchXML:Class;

		[Embed(source = "/../res/beasts/Vampire/test.png")]
		const Vampire: Class;
		[Embed(source="/../res/beasts/Vampire/test.xml", mimeType="application/octet-stream")]
		const VampireXML:Class;

		[Embed(source = "/../res/beasts/Zombie/test.png")]
		const Zombie: Class;
		[Embed(source="/../res/beasts/Zombie/test.xml", mimeType="application/octet-stream")]
		const ZombieXML:Class;

		[Embed(source = "/../res/beasts/Corp/test.png")]
		const Corp: Class;
		[Embed(source="/../res/beasts/Corp/test.xml", mimeType="application/octet-stream")]
		const CorpXML:Class;

		[Embed(source = "/../res/beasts/Fish/test.png")]
		const Fish: Class;
		[Embed(source="/../res/beasts/Fish/test.xml", mimeType="application/octet-stream")]
		const FishXML:Class;

		[Embed(source = "/../res/beasts/Void/test.png")]
		const Void: Class;
		[Embed(source="/../res/beasts/Void/test.xml", mimeType="application/octet-stream")]
		const VoidXML:Class;

		[Embed(source = "/../res/beasts/Monster/test.png")]
		const Monster: Class;
		[Embed(source="/../res/beasts/Monster/test.xml", mimeType="application/octet-stream")]
		const MonsterXML:Class;

		[Embed(source = "/../res/beasts/Speech/test.png")]
		const Speech: Class;
		[Embed(source="/../res/beasts/Speech/test.xml", mimeType="application/octet-stream")]
		const SpeechXML:Class;
		
		//Вспомогательные текстуры
		[Embed(source = "/../res/wrapper.png")]
		private const Wrapper: Class;
		
		[Embed(source = "/../res/createButton.png")]
		private const createButton: Class;
		
		[Embed(source = "/../res/mainBg.png")]
		private const mainBg: Class;
		
		[Embed(source = "/../res/panels/dictionary/background.png")]
		private const dictBg: Class;
		
		[Embed(source = "/../res/panels/shop/background.png")]
		private const shopBg: Class;
		
		[Embed(source = "/../res/panels/menu/background.png")]
		private const menuBg: Class;
		
		[Embed(source = "/../res/StaticArea.png")]
		private const staticArea: Class;
		
		// particle designer configurations
        
        [Embed(source="/../media/drugs.pex", mimeType="application/octet-stream")]
        private static const CreationConfig:Class;
        
        [Embed(source="/../media/fire.pex", mimeType="application/octet-stream")]
        private static const TraceConfig:Class;
        
        [Embed(source="/../media/sun.pex", mimeType="application/octet-stream")]
        private static const CombineConfig:Class;
        
        [Embed(source="/../media/jellyfish.pex", mimeType="application/octet-stream")]
        private static const WaterFogConfig:Class;
        
        // particle textures
        
        [Embed(source = "/../media/drugs_particle.png")]
        private static const CreationParticle:Class;
        
        [Embed(source = "/../media/fire_particle.png")]
        private static const TraceParticle:Class;
        
        [Embed(source = "/../media/sun_particle.png")]
        private static const CombineParticle:Class;
        
        [Embed(source = "/../media/jellyfish_particle.png")]
        private static const WaterFogParticle:Class;
		
		//---------------------------------------------

		//fonts
		[Embed(source="../res/fonts/Sabomaster.ttf", embedAsCFF="false", fontFamily="Sabomaster")]        
        private static const Sabomaster:Class;
		[Embed(source="../res/fonts/Donaldina-Normal.ttf", embedAsCFF="false", fontFamily="Donaldina")]        
        private static const Donaldina:Class;
		[Embed(source="../res/fonts/NewZelek.ttf", embedAsCFF="false", fontFamily="NewZelek")]        
        private static const NewZelek:Class;
		[Embed(source="../res/fonts/Ogilvie-Cyr.ttf", embedAsCFF="false", fontFamily="Ogilvie")]        
        private static const Ogilvie:Class;
		//---------------------------------------------
		
		private var Names: Vector.<String> = new Vector.<String>;
		private var Textures: Vector.<TextureAtlas> = new Vector.<TextureAtlas>;
		
		public var WrapperTexture :Texture;
		public var CreateButtonTexture: Texture;
		public var MainBGTex: Texture;
		public var ShopBGTex: Texture;
		public var DictBGTex: Texture;
		public var MenuBGTex: Texture;
		public var StaticAreaTex: Texture;
		
		//Данные для партиклов
		public var CreationTexture : Texture;
		public var TraceTexture : Texture;
		public var CombineTexture : Texture;
		public var WaterFogTexture : Texture;
		
		public var CreationXML : XML;
		public var TraceXML : XML;
		public var CombineXML : XML;
		public var WaterFogXML : XML;
		//-------------------------
		public function TextureContainer(NamesList: Vector.<String>): void 
		{
			Names = NamesList;
			for (var i = 0; i < Names.length; i++ )
				Textures.push(null);
			//Инициализируем вспомогательные текстуры	
			WrapperTexture = Texture.fromBitmap(new Wrapper());
			CreateButtonTexture = Texture.fromBitmap(new createButton());
			MainBGTex = Texture.fromBitmap(new mainBg());
			ShopBGTex = Texture.fromBitmap(new shopBg());
			DictBGTex = Texture.fromBitmap(new dictBg());
			MenuBGTex = Texture.fromBitmap(new menuBg());
			StaticAreaTex = Texture.fromBitmap(new staticArea());
			
			//Партиклы: 
			CreationTexture = Texture.fromBitmap(new CreationParticle());
			TraceTexture = Texture.fromBitmap(new TraceParticle());
			CombineTexture = Texture.fromBitmap(new CombineParticle());
			WaterFogTexture = Texture.fromBitmap(new WaterFogParticle());
			
			CreationXML =  XML( new CreationConfig());
			TraceXML =  XML( new TraceConfig());
			CombineXML =  XML( new CombineConfig());
			WaterFogXML =  XML( new WaterFogConfig());
			//--------
		}
		
		//Если элементы заданы MovieClip
		private function CreateAtlas (name: String, inputIndex: int): void
		{
			switch (name)
			{
				case "test": { var tex = Texture.fromBitmap(new TestBall()); var xml: XML = XML(new TestBallXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Brain": { var tex = Texture.fromBitmap(new Brain()); var xml: XML = XML(new BrainXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Darkness": { var tex = Texture.fromBitmap(new Darkness()); var xml: XML = XML(new DarknessXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Light": { var tex = Texture.fromBitmap(new Light()); var xml: XML = XML(new LightXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Life": { var tex = Texture.fromBitmap(new Life()); var xml: XML = XML(new LifeXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Death": { var tex = Texture.fromBitmap(new Death()); var xml: XML = XML(new DeathXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Clows": { var tex = Texture.fromBitmap(new Clows()); var xml: XML = XML(new ClowsXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Chitin": { var tex = Texture.fromBitmap(new Chitin()); var xml: XML = XML(new ChitinXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Fire": { var tex = Texture.fromBitmap(new Fire()); var xml: XML = XML(new FireXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Hairs": { var tex = Texture.fromBitmap(new Hairs()); var xml: XML = XML(new HairsXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Hands": { var tex = Texture.fromBitmap(new Hands()); var xml: XML = XML(new HandsXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Legs": { var tex = Texture.fromBitmap(new Legs()); var xml: XML = XML(new LegsXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Plankton": { var tex = Texture.fromBitmap(new Plankton()); var xml: XML = XML(new PlanktonXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Scale": { var tex = Texture.fromBitmap(new Scale()); var xml: XML = XML(new ScaleXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Tail": { var tex = Texture.fromBitmap(new Tail()); var xml: XML = XML(new TailXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Teeth": { var tex = Texture.fromBitmap(new Teeth()); var xml: XML = XML(new TeethXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Wings": { var tex = Texture.fromBitmap(new Wings()); var xml: XML = XML(new WingsXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Devil": { var tex = Texture.fromBitmap(new Devil()); var xml: XML = XML(new DevilXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Demon": { var tex = Texture.fromBitmap(new Demon()); var xml: XML = XML(new DemonXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Spirit": { var tex = Texture.fromBitmap(new Spirit()); var xml: XML = XML(new SpiritXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "LichKing": { var tex = Texture.fromBitmap(new LichKing()); var xml: XML = XML(new LichKingXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Ghost": { var tex = Texture.fromBitmap(new Ghost()); var xml: XML = XML(new GhostXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "DavyJones": { var tex = Texture.fromBitmap(new DavyJones()); var xml: XML = XML(new DavyJonesXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Armageddon": { var tex = Texture.fromBitmap(new Armageddon()); var xml: XML = XML(new ArmageddonXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Cthulhu": { var tex = Texture.fromBitmap(new Cthulhu()); var xml: XML = XML(new CthulhuXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Boogeyman": { var tex = Texture.fromBitmap(new Boogeyman()); var xml: XML = XML(new BoogeymanXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Telepaty": { var tex = Texture.fromBitmap(new Telepaty()); var xml: XML = XML(new TelepatyXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Scuid": { var tex = Texture.fromBitmap(new Scuid()); var xml: XML = XML(new ScuidXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "EvilGenius": { var tex = Texture.fromBitmap(new EvilGenius()); var xml: XML = XML(new EvilGeniusXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Shrimp": { var tex = Texture.fromBitmap(new Shrimp()); var xml: XML = XML(new ShrimpXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Crab": { var tex = Texture.fromBitmap(new Crab()); var xml: XML = XML(new CrabXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Kraken": { var tex = Texture.fromBitmap(new Kraken()); var xml: XML = XML(new KrakenXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Octopus": { var tex = Texture.fromBitmap(new Octopus()); var xml: XML = XML(new OctopusXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Poseidon": { var tex = Texture.fromBitmap(new Poseidon()); var xml: XML = XML(new PoseidonXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Mermaid": { var tex = Texture.fromBitmap(new Mermaid()); var xml: XML = XML(new MermaidXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "SnowTroll": { var tex = Texture.fromBitmap(new SnowTroll()); var xml: XML = XML(new SnowTrollXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Yetti": { var tex = Texture.fromBitmap(new Yetti()); var xml: XML = XML(new YettiXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Alien": { var tex = Texture.fromBitmap(new Alien()); var xml: XML = XML(new AlienXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "UFOMen": { var tex = Texture.fromBitmap(new UFOMen()); var xml: XML = XML(new UFOMenXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "FlyingFish": { var tex = Texture.fromBitmap(new FlyingFish()); var xml: XML = XML(new FlyingFishXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Mutant": { var tex = Texture.fromBitmap(new Mutant()); var xml: XML = XML(new MutantXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Fenix": { var tex = Texture.fromBitmap(new Fenix()); var xml: XML = XML(new FenixXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Grifon": { var tex = Texture.fromBitmap(new Grifon()); var xml: XML = XML(new GrifonXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Bird": { var tex = Texture.fromBitmap(new Bird()); var xml: XML = XML(new BirdXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Pterodak": { var tex = Texture.fromBitmap(new Pterodak()); var xml: XML = XML(new PterodakXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "FireLizard": { var tex = Texture.fromBitmap(new FireLizard()); var xml: XML = XML(new FireLizardXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Dragon": { var tex = Texture.fromBitmap(new Dragon()); var xml: XML = XML(new DragonXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Tyrex": { var tex = Texture.fromBitmap(new Tyrex()); var xml: XML = XML(new TyrexXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Crocodile": { var tex = Texture.fromBitmap(new Crocodile()); var xml: XML = XML(new CrocodileXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Evil": { var tex = Texture.fromBitmap(new Evil()); var xml: XML = XML(new EvilXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Torch": { var tex = Texture.fromBitmap(new Torch()); var xml: XML = XML(new TorchXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Vampire": { var tex = Texture.fromBitmap(new Vampire()); var xml: XML = XML(new VampireXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Zombie": { var tex = Texture.fromBitmap(new Zombie()); var xml: XML = XML(new ZombieXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Corp": { var tex = Texture.fromBitmap(new Corp()); var xml: XML = XML(new CorpXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Fish": { var tex = Texture.fromBitmap(new Fish()); var xml: XML = XML(new FishXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Ash": { var tex = Texture.fromBitmap(new Ash()); var xml: XML = XML(new AshXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Void": { var tex = Texture.fromBitmap(new Void()); var xml: XML = XML(new VoidXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Monster": { var tex = Texture.fromBitmap(new Monster()); var xml: XML = XML(new MonsterXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
				case "Speech": { var tex = Texture.fromBitmap(new Speech()); var xml: XML = XML(new SpeechXML()); Textures[inputIndex] = new TextureAtlas(tex, xml); break; } 
			}
		}
		
		
		
		public function GetAtlas (name: String): TextureAtlas
		{
			for (var i = 0; i < Names.length; i++ )
			{
				if (Names[i] == name)
				{
					if (Textures[i]!=null)
						return Textures[i];
					else 
					{
						CreateAtlas(name, i);
						return Textures[i];
					}
				}
			}
			return null;
		}
		
	}

}