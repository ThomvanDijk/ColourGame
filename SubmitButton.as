package  {
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class SubmitButton extends SimpleButton {
		
		var world:World;
		
		public function SubmitButton(w:World) {
			world = w;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent):void {
			this.x = 20000;
			world.highScore.submitScore.x = 20000;
			world.highScore.inputField.x = 20000;
			world.moveToTop(world.level1But);
			world.moveToTop(world.level2But);
			world.moveToTop(world.options.menuBut);
			world.moveToTop(world.highScore.scoreText);
			world.player.submitScore();
		}
		
	}
	
}
