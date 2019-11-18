package  
{
	import starling.display.Image;
	import starling.textures.Texture;
	import Utils.AchievementsPanel;
	/**
	 * ...
	 * @author ...
	 * Class contains any math methods like GetLengthBetween or other 
	 */
	public class MathHelper 
	{
		public static function GetLengthBetween (x1: Number, x2: Number, y1: Number, y2: Number): Number
		{
			return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
		}
		
		public function MathHelper() 
		{
			
		}
		
		public static function GetOpenedAsBitString (OpenList:Vector.<Boolean>): String
		{
			var str: String = "";
			for (var i = 0; i < OpenList.length; i++ )
			{
				if (OpenList[i])
					str += "1";
				else 
					str += "0";
			}
			return str;
		}
		
		public static function GetOpenedCount (OpenList:Vector.<Boolean>) : int
		{
			var count: int = 0; 
			for (var i = 0; i < OpenList.length; i++ )
				if (OpenList[i])
					count++;
			return count;
		}
		
		public static function GetOpenedByIndex (index: int, OpenList:Vector.<Boolean>): int
		{
			var element: int = 0;
			for (var i = 0; i < OpenList.length; i++ )
			{
				if (OpenList[i])
				{
					if (element == index)
					return i;
					element++;
				}
			}
			return -1;
		}
		
		public static function LoadAchievements(texContainer: TextureContainer, achiv: AchievementsPanel)
		{
			var titles: Vector.<String> = new Vector.<String>;
			var texts: Vector.<String> = new Vector.<String>;
			var images: Vector.<Texture> = new Vector.<Texture>;
			
			titles.push("First");
			titles.push("Five");
			titles.push("Ten");
			
			texts.push("Your first element!");
			texts.push("Open five elements!");
			texts.push("Open ten elements!");
			
			images.push(texContainer.AchievementStart);
			images.push(texContainer.AchievementFive);
			images.push(texContainer.AchievementTen);
			
			//собсно грузим в объект ачивок
			achiv.LoadAchievements(images, texts, titles);
		}
		
		public static function GetPureOpenedCount (FormulsList :Vector.<Vector.<String>>, OpenList:Vector.<Boolean>): int
		{
			var count = 0;
			for (var i = 0; i < OpenList.length; i++ )
				if (OpenList[i] && (FormulsList[i] as Vector.<String>).length > 1)
					count++;
			return count;
		}
		
		public static function SetFormulas (FormulsList :Vector.<Vector.<String>>, OpenList:Vector.<Boolean>,  CostList: Vector.<Number>, NamesList: Vector.<String>)
		{
			var buf: Vector.<String> = new Vector.<String>;
			//buf.push("test");
			//NamesList.push("test"); FormulsList.push(buf); CostList.push(100);
			//buf = new Vector.<String>;
			buf.push("Light");
			NamesList.push("Light"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Darkness");
			NamesList.push("Darkness"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Life");
			NamesList.push("Life"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Death");
			NamesList.push("Death"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Brain");
			NamesList.push("Brain"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Chitin");
			NamesList.push("Chitin"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Clows");
			NamesList.push("Clows"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Fire");
			NamesList.push("Fire"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Hands");
			NamesList.push("Hands"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Hairs");
			NamesList.push("Hairs"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Legs");
			NamesList.push("Legs"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Plankton");
			NamesList.push("Plankton"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Scale");
			NamesList.push("Scale"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Tail");
			NamesList.push("Tail"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Teeth");
			NamesList.push("Teeth"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Wings");
			NamesList.push("Wings"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			buf.push("Telepaty");
			NamesList.push("Telepaty"); FormulsList.push(buf); CostList.push(100);
			buf = new Vector.<String>;
			
			buf.push("Brain"); buf.push("Teeth");
			NamesList.push("Speech"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			
			buf.push("Life"); buf.push("Death");
			NamesList.push("Void"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			
			buf.push("Plankton"); buf.push("Fire");
			NamesList.push("Ash"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Ash"); buf.push("Life");
			NamesList.push("Spirit"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Spirit"); buf.push("Evil");
			NamesList.push("Demon"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Demon"); buf.push("Telepaty"); buf.push("Speech"); buf.push("Fire");
			NamesList.push("Devil"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Plankton"); buf.push("Tail");
			NamesList.push("Fish"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Fish"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Corp"); buf.push("Life");
			NamesList.push("Zombie"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Zombie"); buf.push("Brain");
			NamesList.push("Vampire"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Vampire"); buf.push("Fire");
			NamesList.push("Ash"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Vampire"); buf.push("Death");
			NamesList.push("Ghost"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Ghost"); buf.push("Speech"); buf.push("Evil");
			NamesList.push("LichKing"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Zombie"); buf.push("Fire"); 
			NamesList.push("Torch"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Zombie"); buf.push("Darkness"); 
			NamesList.push("Evil"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Fish"); buf.push("Legs"); buf.push("Clows");
			NamesList.push("Crocodile"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Crocodile"); buf.push("Death"); 
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Crocodile"); buf.push("Hands"); buf.push("Teeth");
			NamesList.push("Tyrex"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Tyrex"); buf.push("Death"); 
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Tyrex"); buf.push("Wings"); buf.push("Brain");
			NamesList.push("Dragon"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Dragon"); buf.push("Death"); 
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Dragon"); buf.push("Fire"); 
			NamesList.push("FireLizard"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("FireLizard"); buf.push("Death"); 
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Crocodile"); buf.push("Wings"); 
			NamesList.push("Pterodak"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Pterodak"); buf.push("Death"); 
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Pterodak"); buf.push("Hairs"); 
			NamesList.push("Bird"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Bird"); buf.push("Death"); 
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Bird"); buf.push("Clows"); buf.push("Brain"); 
			NamesList.push("Grifon"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Grifon"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Bird"); buf.push("Fire");
			NamesList.push("Fenix"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Fenix"); buf.push("Death");
			NamesList.push("Life"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Crocodile"); buf.push("Hairs");
			NamesList.push("Mutant"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Fish"); buf.push("Wings");
			NamesList.push("FlyingFish"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("FlyingFish"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Fish"); buf.push("Hairs");
			NamesList.push("Mutant"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Mutant"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Mutant"); buf.push("Telepathy");
			NamesList.push("UFOMen"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("UFOMen"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("UFOMen"); buf.push("Evil");
			NamesList.push("Alien"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Mutant"); buf.push("Teeth"); buf.push("Brain"); buf.push("Hairs");
			NamesList.push("Yetti"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Yetti"); buf.push("Evil");
			NamesList.push("SnowTroll"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Yetti"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Fish"); buf.push("Speech"); buf.push("Hands"); buf.push("Telepaty");
			NamesList.push("Poseidon"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Poseidon"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Plankton"); buf.push("Hands");
			NamesList.push("Octopus"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Octopus"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Octopus"); buf.push("Teeth"); buf.push("Clows");
			NamesList.push("Kraken"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Kraken"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Octopus"); buf.push("Legs"); buf.push("Chitin");
			NamesList.push("Crab"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Crab"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Crab"); buf.push("Wings");
			NamesList.push("Monster"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Monster"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Octopus"); buf.push("Chitin");
			NamesList.push("Shrimp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Shrimp"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Shrimp"); buf.push("Wings");
			NamesList.push("Monster"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Monster"); buf.push("Brain"); buf.push("Legs"); buf.push("Evil");
			NamesList.push("EvilGenius"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("EvilGenius"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Octopus"); buf.push("Brain");
			NamesList.push("Scuid"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Scuid"); buf.push("Death");
			NamesList.push("Corp"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Scuid"); buf.push("Hands"); buf.push("Evil");
			NamesList.push("Boogeyman"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Scuid"); buf.push("Wings"); buf.push("Speech"); buf.push("Evil");
			NamesList.push("Cthulhu"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Cthulhu"); buf.push("Life");
			NamesList.push("Armageddon"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			buf.push("Octopus"); buf.push("Legs"); buf.push("Speech"); buf.push("Brain");
			NamesList.push("DavyJones"); FormulsList.push(buf); CostList.push(1000);
			buf = new Vector.<String>;
			
			for (var i = 0; i < FormulsList.length; i++ )
			{
				if (FormulsList[i].length == 1)
					OpenList.push(true);
				else 
					OpenList.push(false);
			}
		}
		
	}
	
	

}