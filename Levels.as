package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Levels extends SimpleButton {
		
		var world:World;
		
		public function Levels(w:World) {
			world = w;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		function onClick(event:MouseEvent): void {
			world.moveToTop(world.levelsMenu);
			world.moveToTop(world.level1But);
			world.moveToTop(world.level2But);
			world.moveToTop(world.levelsBack);
			
			world.levelsMenu.x = 512;
			world.levelsMenu.y = 384;
			
			world.level1But.x = 512;
			world.level1But.y = 330;
			world.level1But.scaleX = 0.15;
			world.level1But.scaleY = 0.15;
			
			world.level2But.x = 512;
			world.level2But.y = 450;
			world.level2But.scaleX = 0.15;
			world.level2But.scaleY = 0.15;
			
			world.levelsBack.x = 512;
			world.levelsBack.y = 570;
		}
	}
	
}
