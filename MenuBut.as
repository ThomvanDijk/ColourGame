package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class MenuBut extends SimpleButton {
		
		var world:World;
		
		public function MenuBut(w:World) {
			world = w;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent):void {
			world.hoofdMenu.x = 0;
			world.setChildIndex(world.hoofdMenu, world.levelLength);
			for (var i = world.levelLength - 1; i >= 0; i--) {
				world.removeInstance(world.tileList[i]);
				world.tileList.pop();
			}
			world.options.x = 20000;
			world.options.pauzeMenu.x = 20000;
			world.options.menuBut.x = 20000;
			world.levelsMenu.x = 20000;
			world.highScore.x = 20000;
			world.level1But.x = 20000;
			world.level2But.x = 20000;
			world.text7.x = 20000;
			world.player.alpha = 0;
			world.options.verderSpelen.x = 20000;
			world.options.clicked = false;
			world.introBoolean = true;
			world.stopSounds();
			
			world.text1.x = 20000;
			world.text2.x = 20000;
			world.text3.x = 20000;
			world.text4.x = 20000;
			world.text5.x = 20000;
			world.text6.x = 20000;
			world.text7.x = 20000;
		}
	}
	
}
