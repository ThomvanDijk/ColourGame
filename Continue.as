package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Continue extends SimpleButton {
		
		var world:World;
		
		public function Continue(w:World) {
			world = w;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent): void {
			world.pauseGame = false;
			world.options.clicked = false;
			world.options.pauzeMenu.x = 20000;
			world.options.verderSpelen.x = 20000;
			world.options.menuBut.x = 20000;
		}
	}
	
}
