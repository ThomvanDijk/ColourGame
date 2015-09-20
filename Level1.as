package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Level1 extends SimpleButton {
		
		var world:World;
		
		public function Level1(w:World) {
			world = w;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		function onClick(event:MouseEvent): void {
			for (var i = world.levelLength - 1; i >= 0; i--) {
				world.removeInstance(world.tileList[i]);
				world.tileList.pop();
			}
			world.addGrid1();
			world.addPlayer();
			
			world.player.redAmount = 40;
			world.player.greenAmount = 40;
			world.player.blueAmount = 40;
			world.completed = 0;
			
			world.player.x = 200;
			world.player.y = 120;
			
			world.pauseGame = false;
			world.currentLevel = 1;
			world.factoryColored = false;
			
			world.highScore.x = 20000;
			world.player.alpha = 1;
			world.player.check = false;
			this.x = 20000;
			
			world.options.x = 1024;
			world.setChildIndex(world.options, world.levelLength);
			world.inter.x = 0;
			world.setChildIndex(world.inter, world.levelLength);
			world.hoofdMenu.x = 20000;
			
			world.levelsMenu.x = 20000;
			world.level1But.x = 20000;
			world.level2But.x = 20000;
			world.levelsBack.x = 20000;
			
			world.text7.x = 20000;
			world.tutorialBoolean = false;
		}
	}
	
}
