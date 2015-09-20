package  {
	
	import flash.display.MovieClip;
	
	
	public class Menu extends MovieClip {
		
		var start:Start;
		var levels:Levels;
		var credits:Credits;
		var world:World;
		
		public function Menu(w:World) {
			world = w;
			
			start = new Start(world);
			addChild(start);
			start.x = 512;
			start.y = 300;
			start.scaleX = 0.2;
			start.scaleY = 0.2;
			
			levels = new Levels(world);
			addChild(levels);
			levels.x = 512;
			levels.y = 400;
			levels.scaleX = 0.2;
			levels.scaleY = 0.2;
			
			credits = new Credits(world);
			addChild(credits);
			credits.x = 512;
			credits.y = 500;
			credits.scaleX = 0.2;
			credits.scaleY = 0.2;
		}
	}
	
}
