package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class LevelsBack extends SimpleButton {
		
		var world:World;
		
		public function LevelsBack(w:World) {
			world = w;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		function onClick(event:MouseEvent): void {
			world.clickChannel = world.click.play();
			world.level1But.x = 20000;
			world.level2But.x = 20000;
			world.levelsBack.x = 20000;
			world.levelsMenu.x = 20000;
			world.creditsMenu.x = 20000;
			world.gameOver.x = 20000;
			world.moveToTop(world.hoofdMenu);
			world.hoofdMenu.x = 0;
		}
	}
	
}
