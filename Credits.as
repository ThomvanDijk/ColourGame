package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Credits extends SimpleButton {
		
		var world:World;
		
		public function Credits(w:World) {
			world = w;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent):void {
			world.moveToTop(world.creditsMenu);
			world.creditsMenu.x = 512;
			world.creditsMenu.y = 384;
			
			world.moveToTop(world.levelsBack);
			world.levelsBack.x = 533;
			world.levelsBack.y = 705;
			world.levelsBack.scaleX = 0.15;
			world.levelsBack.scaleY = 0.15;
		}
	}
	
}
