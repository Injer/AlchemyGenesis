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
		/*[Embed(source = "/../res/beasts/test/test.png")]
		const TestBall: Class;
		
		[Embed(source = "/../res/beasts/Alien/test.png")]
		const Alien: Class;
		
		[Embed(source = "/../res/beasts/Armageddon/test.png")]
		const Armageddon: Class;
		
		[Embed(source = "/../res/beasts/Ash/test.png")]
		const Ash: Class;
		
		[Embed(source = "/../res/beasts/Bird/test.png")]
		const Bird: Class;
		
		[Embed(source = "/../res/beasts/Brain/test.png")]
		const Brain: Class;
		
		[Embed(source = "/../res/beasts/Darkness/test.png")]
		const Darkness: Class;
		
		[Embed(source = "/../res/beasts/Light/test.png")]
		const Light: Class;
		[Embed(source = "/../res/beasts/Life/test.png")]
		const Life: Class;
		
		[Embed(source = "/../res/beasts/Death/test.png")]
		const Death: Class;
		
		[Embed(source = "/../res/beasts/Clows/test.png")]
		const Clows: Class;
		
		[Embed(source = "/../res/beasts/Chitin/test.png")]
		const Chitin: Class;
		
		[Embed(source = "/../res/beasts/Fire/test.png")]
		const Fire: Class;
		
		[Embed(source = "/../res/beasts/Hairs/test.png")]
		const Hairs: Class;
		
		[Embed(source = "/../res/beasts/Hands/test.png")]
		const Hands: Class;
		
		[Embed(source = "/../res/beasts/Legs/test.png")]
		const Legs: Class;
		
		[Embed(source = "/../res/beasts/Plankton/test.png")]
		const Plankton: Class;
		
		[Embed(source = "/../res/beasts/Scale/test.png")]
		const Scale: Class;
		
		[Embed(source = "/../res/beasts/Tail/test.png")]
		const Tail: Class;
		
		[Embed(source = "/../res/beasts/Teeth/test.png")]
		const Teeth: Class;
		
		[Embed(source = "/../res/beasts/Wings/test.png")]
		const Wings: Class;
		
		[Embed(source = "/../res/beasts/Devil/test.png")]
		const Devil: Class;
		
		[Embed(source = "/../res/beasts/Demon/test.png")]
		const Demon: Class;
		
		[Embed(source = "/../res/beasts/Spirit/test.png")]
		const Spirit: Class;
		
		[Embed(source = "/../res/beasts/LichKing/test.png")]
		const LichKing: Class;
		
		[Embed(source = "/../res/beasts/Ghost/test.png")]
		const Ghost: Class;
		
		[Embed(source = "/../res/beasts/DavyJones/test.png")]
		const DavyJones: Class;
		
		[Embed(source = "/../res/beasts/Cthulhu/test.png")]
		const Cthulhu: Class;
		
		[Embed(source = "/../res/beasts/Boogeyman/test.png")]
		const Boogeyman: Class;
		
		[Embed(source = "/../res/beasts/Telepaty/test.png")]
		const Telepaty: Class;
		
		[Embed(source = "/../res/beasts/Scuid/test.png")]
		const Scuid: Class;
		
		[Embed(source = "/../res/beasts/EvilGenius/test.png")]
		const EvilGenius: Class;
		
		[Embed(source = "/../res/beasts/Shrimp/test.png")]
		const Shrimp: Class;
		
		[Embed(source = "/../res/beasts/Crab/test.png")]
		const Crab: Class;
		
		[Embed(source = "/../res/beasts/Kraken/test.png")]
		const Kraken: Class;
		
		[Embed(source = "/../res/beasts/Octopus/test.png")]
		const Octopus: Class;
		
		[Embed(source = "/../res/beasts/Poseidon/test.png")]
		const Poseidon: Class;
		
		[Embed(source = "/../res/beasts/Mermaid/test.png")]
		const Mermaid: Class;
		
		[Embed(source = "/../res/beasts/SnowTroll/test.png")]
		const SnowTroll: Class;
		
		[Embed(source = "/../res/beasts/Yetti/test.png")]
		const Yetti: Class;
		
		[Embed(source = "/../res/beasts/UFOMen/test.png")]
		const UFOMen: Class;
		
		[Embed(source = "/../res/beasts/FlyingFish/test.png")]
		const FlyingFish: Class;
		
		[Embed(source = "/../res/beasts/Mutant/test.png")]
		const Mutant: Class;
		
		[Embed(source = "/../res/beasts/Fenix/test.png")]
		const Fenix: Class;
		
		[Embed(source = "/../res/beasts/Grifon/test.png")]
		const Grifon: Class;
		
		[Embed(source = "/../res/beasts/Pterodak/test.png")]
		const Pterodak: Class;
		
		[Embed(source = "/../res/beasts/FireLizard/test.png")]
		const FireLizard: Class;
		
		[Embed(source = "/../res/beasts/Dragon/test.png")]
		const Dragon: Class;
		
		[Embed(source = "/../res/beasts/Tyrex/test.png")]
		const Tyrex: Class;
		
		[Embed(source = "/../res/beasts/Crocodile/test.png")]
		const Crocodile: Class;

		[Embed(source = "/../res/beasts/Evil/test.png")]
		const Evil: Class;

		[Embed(source = "/../res/beasts/Torch/test.png")]
		const Torch: Class;

		[Embed(source = "/../res/beasts/Vampire/test.png")]
		const Vampire: Class;

		[Embed(source = "/../res/beasts/Zombie/test.png")]
		const Zombie: Class;

		[Embed(source = "/../res/beasts/Corp/test.png")]
		const Corp: Class;

		[Embed(source = "/../res/beasts/Fish/test.png")]
		const Fish: Class;

		[Embed(source = "/../res/beasts/Void/test.png")]
		const Void: Class;

		[Embed(source = "/../res/beasts/Monster/test.png")]
		const Monster: Class;

		[Embed(source = "/../res/beasts/Speech/test.png")]
		const Speech: Class;*/
		
		//Вспомогательные текстуры
		
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
		
		[Embed(source = "/../res/sliderButton.png")]
		private const sliderButton: Class;
		
		[Embed(source = "/../res/scrollArea.png")]
		private const scrollArea: Class;
		
		[Embed(source = "/../res/scrollBlock.png")]
		private const scrollBlock: Class;
		
		[Embed(source = "/../res/achivBG.png")]
		private const achivBG: Class;
		
		// particle designer configurations
        
        [Embed(source="/../media/drugs.pex", mimeType="application/octet-stream")]
        private static const CreationConfig:Class;
        
        [Embed(source="/../media/fire.pex", mimeType="application/octet-stream")]
        private static const TraceConfig:Class;
        
        [Embed(source="/../media/sun.pex", mimeType="application/octet-stream")]
        private static const CombineConfig:Class;
        
        [Embed(source="/../media/jellyfish.pex", mimeType="application/octet-stream")]
        private static const WaterFogConfig:Class;
		
		[Embed(source="/../media/mainScreen.pex", mimeType="application/octet-stream")]
        private static const mainScreenXML:Class;
		
		[Embed(source="/../media/fire2.pex", mimeType="application/octet-stream")]
        private static const createBtnXML:Class;
        
        // particle textures
        
        [Embed(source = "/../media/drugs_particle.png")]
        private static const CreationParticle:Class;
        
        [Embed(source = "/../media/fire_particle.png")]
        private static const TraceParticle:Class;
        
        [Embed(source = "/../media/sun_particle.png")]
        private static const CombineParticle:Class;
        
        [Embed(source = "/../media/jellyfish_particle.png")]
        private static const WaterFogParticle:Class;
		
		[Embed(source = "/../media/mainScreen.png")]
        private static const mainScreenTex:Class;
		
		[Embed(source = "/../media/fire2_particle.png")]
        private static const createBtnPart:Class;
		
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
		
		//achievements
		[Embed(source = "/../res/achievements/start.png")]
        private static const achivStart:Class;
		
		[Embed(source = "/../res/achievements/five.png")]
        private static const achivFive:Class;
		
		[Embed(source = "/../res/achievements/ten.png")]
        private static const achivTen:Class;
		//---------------------------------------------
		
		private var Names: Vector.<String> = new Vector.<String>;
		private var Textures: Vector.<Texture> = new Vector.<Texture>;
		
		public var WrapperTexture :Texture;
		public var CreateButtonTexture: Texture;
		public var MainBGTex: Texture;
		public var ShopBGTex: Texture;
		public var DictBGTex: Texture;
		public var MenuBGTex: Texture;
		public var StaticAreaTex: Texture;
		public var SliderButton: Texture;
		public var ScrollArea: Texture;
		public var ScrollBlock: Texture;
		public var AchievementBackground: Texture;
		
		//Текстуры ачивок
		public var AchievementStart: Texture;
		public var AchievementFive: Texture;
		public var AchievementTen: Texture;
		
		//Данные для партиклов
		public var CreationTexture : Texture;
		public var TraceTexture : Texture;
		public var CombineTexture : Texture;
		public var WaterFogTexture : Texture;
		public var MainScreenTexture: Texture;
		public var CreateButtonParticleTexture: Texture;
		
		public var CreationXML : XML;
		public var TraceXML : XML;
		public var CombineXML : XML;
		public var WaterFogXML : XML;
		public var MainScreenXML: XML;
		public var CreateButtonParticleXML: XML;
		//-------------------------
		public function TextureContainer(NamesList: Vector.<String>): void 
		{
			Names = NamesList;
			for (var i = 0; i < Names.length; i++ )
				Textures.push(null);
			//Инициализируем вспомогательные текстуры	
			CreateButtonTexture = Texture.fromBitmap(new createButton());
			MainBGTex = Texture.fromBitmap(new mainBg());
			ShopBGTex = Texture.fromBitmap(new shopBg());
			DictBGTex = Texture.fromBitmap(new dictBg());
			MenuBGTex = Texture.fromBitmap(new menuBg());
			StaticAreaTex = Texture.fromBitmap(new staticArea());
			SliderButton = Texture.fromBitmap(new sliderButton());
			ScrollArea = Texture.fromBitmap(new scrollArea());
			ScrollBlock = Texture.fromBitmap(new scrollBlock());
			AchievementBackground = Texture.fromBitmap(new achivBG());
			
			//Инициализируем ачивки
			AchievementStart = Texture.fromBitmap(new achivStart());
			AchievementFive = Texture.fromBitmap(new achivFive());
			AchievementTen = Texture.fromBitmap(new achivTen());
			
			//Партиклы: 
			CreationTexture = Texture.fromBitmap(new CreationParticle());
			TraceTexture = Texture.fromBitmap(new TraceParticle());
			CombineTexture = Texture.fromBitmap(new CombineParticle());
			WaterFogTexture = Texture.fromBitmap(new WaterFogParticle());
			MainScreenTexture = Texture.fromBitmap(new mainScreenTex());
			CreateButtonParticleTexture = Texture.fromBitmap(new createBtnPart());
			
			CreationXML =  XML( new CreationConfig());
			TraceXML =  XML( new TraceConfig());
			CombineXML =  XML( new CombineConfig());
			WaterFogXML =  XML( new WaterFogConfig());
			MainScreenXML = XML(new mainScreenXML());
			CreateButtonParticleXML = XML(new createBtnXML());
			//--------
		}
		
		//Если элементы заданы MovieClip
		private function CreateAtlas (name: String, inputIndex: int): void
		{
			/*switch (name)
			{
				case "test": { Textures[inputIndex] = Texture.fromBitmap(new TestBall()); break; } 
				case "Brain": { Textures[inputIndex] = Texture.fromBitmap(new Brain()); break; } 
				case "Darkness": { Textures[inputIndex] = Texture.fromBitmap(new Darkness()); break; } 
				case "Light": { Textures[inputIndex] = Texture.fromBitmap(new Light()); break; } 
				case "Life": { Textures[inputIndex] = Texture.fromBitmap(new Life()); break; } 
				case "Death": { Textures[inputIndex] = Texture.fromBitmap(new Death()); break; } 
				case "Clows": { Textures[inputIndex] = Texture.fromBitmap(new Clows()); break; } 
				case "Chitin": { Textures[inputIndex] = Texture.fromBitmap(new Chitin()); break; } 
				case "Fire": { Textures[inputIndex] = Texture.fromBitmap(new Fire()); break; } 
				case "Hairs": { Textures[inputIndex] = Texture.fromBitmap(new Hairs()); break; } 
				case "Hands": { Textures[inputIndex] = Texture.fromBitmap(new Hands()); break; } 
				case "Legs": { Textures[inputIndex] = Texture.fromBitmap(new Legs()); break; } 
				case "Plankton": { Textures[inputIndex] = Texture.fromBitmap(new Plankton()); break; } 
				case "Scale": { Textures[inputIndex] = Texture.fromBitmap(new Scale()); break; } 
				case "Tail": { Textures[inputIndex] = Texture.fromBitmap(new Tail()); break; } 
				case "Teeth": { Textures[inputIndex] = Texture.fromBitmap(new Teeth()); break; } 
				case "Wings": { Textures[inputIndex] = Texture.fromBitmap(new Wings()); break; } 
				case "Devil": { Textures[inputIndex] = Texture.fromBitmap(new Devil()); break; } 
				case "Demon": { Textures[inputIndex] = Texture.fromBitmap(new Demon()); break; } 
				case "Spirit": { Textures[inputIndex] = Texture.fromBitmap(new Spirit()); break; } 
				case "LichKing": { Textures[inputIndex] = Texture.fromBitmap(new LichKing()); break; } 
				case "Ghost": { Textures[inputIndex] = Texture.fromBitmap(new Ghost()); break; } 
				case "DavyJones": { Textures[inputIndex] = Texture.fromBitmap(new DavyJones()); break; } 
				case "Armageddon": { Textures[inputIndex] = Texture.fromBitmap(new Armageddon()); break; } 
				case "Cthulhu": { Textures[inputIndex] = Texture.fromBitmap(new Cthulhu()); break; } 
				case "Boogeyman": { Textures[inputIndex] = Texture.fromBitmap(new Boogeyman()); break; } 
				case "Telepaty": { Textures[inputIndex] = Texture.fromBitmap(new Telepaty()); break; } 
				case "Scuid": { Textures[inputIndex] = Texture.fromBitmap(new Scuid()); break; } 
				case "EvilGenius": { Textures[inputIndex] = Texture.fromBitmap(new EvilGenius()); break; } 
				case "Shrimp": { Textures[inputIndex] = Texture.fromBitmap(new Shrimp()); break; } 
				case "Crab": { Textures[inputIndex] = Texture.fromBitmap(new Crab()); break; } 
				case "Kraken": { Textures[inputIndex] = Texture.fromBitmap(new Kraken()); break; } 
				case "Octopus": { Textures[inputIndex] = Texture.fromBitmap(new Octopus()); break; } 
				case "Poseidon": { Textures[inputIndex] = Texture.fromBitmap(new Poseidon()); break; } 
				case "Mermaid": { Textures[inputIndex] = Texture.fromBitmap(new Mermaid()); break; } 
				case "SnowTroll": { Textures[inputIndex] = Texture.fromBitmap(new SnowTroll()); break; } 
				case "Yetti": { Textures[inputIndex] = Texture.fromBitmap(new Yetti()); break; } 
				case "Alien": { Textures[inputIndex] = Texture.fromBitmap(new Alien()); break; } 
				case "UFOMen": { Textures[inputIndex] = Texture.fromBitmap(new UFOMen()); break; } 
				case "FlyingFish": { Textures[inputIndex] = Texture.fromBitmap(new FlyingFish()); break; } 
				case "Mutant": { Textures[inputIndex] = Texture.fromBitmap(new Mutant()); break; } 
				case "Fenix": { Textures[inputIndex] = Texture.fromBitmap(new Fenix()); break; } 
				case "Grifon": { Textures[inputIndex] = Texture.fromBitmap(new Grifon()); break; } 
				case "Bird": { Textures[inputIndex] = Texture.fromBitmap(new Bird()); break; } 
				case "Pterodak": { Textures[inputIndex] = Texture.fromBitmap(new Pterodak()); break; } 
				case "FireLizard": { Textures[inputIndex] = Texture.fromBitmap(new FireLizard()); break; } 
				case "Dragon": { Textures[inputIndex] = Texture.fromBitmap(new Dragon()); break; } 
				case "Tyrex": { Textures[inputIndex] = Texture.fromBitmap(new Tyrex()); break; } 
				case "Crocodile": { Textures[inputIndex] = Texture.fromBitmap(new Crocodile()); break; } 
				case "Evil": { Textures[inputIndex] = Texture.fromBitmap(new Evil()); break; } 
				case "Torch": { Textures[inputIndex] = Texture.fromBitmap(new Torch()); break; } 
				case "Vampire": { Textures[inputIndex] = Texture.fromBitmap(new Vampire()); break; } 
				case "Zombie": { Textures[inputIndex] = Texture.fromBitmap(new Zombie()); break; } 
				case "Corp": { Textures[inputIndex] = Texture.fromBitmap(new Corp()); break; } 
				case "Fish": { Textures[inputIndex] = Texture.fromBitmap(new Fish()); break; } 
				case "Ash": { Textures[inputIndex] = Texture.fromBitmap(new Ash()); break; } 
				case "Void": { Textures[inputIndex] = Texture.fromBitmap(new Void()); break; } 
				case "Monster": { Textures[inputIndex] = Texture.fromBitmap(new Monster()); break; } 
				case "Speech": { Textures[inputIndex] = Texture.fromBitmap(new Speech()); break; } 
			}*/
		}
		
		
		
		public function GetTexture (name: String): Texture
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