package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Start extends SimpleButton {
		
		var world:World;
		
		public function Start(w:World) {
			world = w;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		function onClick(event:MouseEvent): void {
			world.clickChannel = world.click.play();
			world.addGrid0();
			world.addPlayer();
			
			world.player.redAmount = 40;
			world.player.greenAmount = 40;
			world.player.blueAmount = 40;
			world.completed = 0;
			
			world.player.x = 300;
			world.player.y = 150;
			
			world.pauseGame = false;
			world.sounds = true;
			world.stopSounds();
			
			world.options.x = 1024;
			world.setChildIndex(world.options, world.levelLength);
			world.inter.x = 0;
			world.setChildIndex(world.inter, world.levelLength);
			world.hoofdMenu.x = 20000;
			
			world.levelsMenu.x = 20000;
			world.level1But.y = 20000;
			world.level2But.y = 20000;
			
			world.player.alpha = 1;
			world.player.check = false;
			world.currentLevel = 0;
			
			//set this to true to play tutorial
			world.tutorialBoolean = true;
			world.tutorialStep0 = true;
			world.tutorialStep1 = false;
			world.tutorialStep2 = false;
			world.tutorialStep3 = false;
			world.tutorialStep4 = false;
			world.tutorialStep5 = false;
			world.tutorialStep6 = false;
			world.tutorialStep7 = false;
			world.tutorialStep8 = false;
			world.tutorialStep9 = false;
			world.factoryColored = false;
		}
	}
	
}
