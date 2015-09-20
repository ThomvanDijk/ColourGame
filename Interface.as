package  {
	
	import flash.display.MovieClip;
	
	
	public class Interface extends MovieClip {
		
		var redbar:Red_Bar;
		var greenbar:Green_Bar;
		var bluebar:Blue_Bar;
		var world:World;
		var clock1:Number;
		var clock2:Number;
		var clock3:Number;
		var clock11:Number;
		var clock22:Number;
		var clock33:Number;
		
		public function Interface(w:World) {
			world = w;
			clock1 = 10;
			clock2 = 10;
			clock3 = 10;
			clock11 = 0;
			clock22 = 0;
			clock33 = 0;
			
			redbar = new Red_Bar();
			addChild(redbar);
			redbar.x = 50;
			redbar.y = 150;
			redbar.scaleX = 0.1;
			redbar.scaleY = 0.1;
			
			greenbar = new Green_Bar();
			addChild(greenbar);
			greenbar.x = 100;
			greenbar.y = 150;
			greenbar.scaleX = 0.1;
			greenbar.scaleY = 0.1;
			
			bluebar = new Blue_Bar();
			addChild(bluebar);
			bluebar.x = 150;
			bluebar.y = 150;
			bluebar.scaleX = 0.1;
			bluebar.scaleY = 0.1;
		}
		
		public function update():void {
			//trace(((world.completed/world.tileList.length) * 100) + " %");
			
			clock1 -= .5;
			clock2 -= .5;
			clock3 -= .5;
			clock11 -= .5;
			clock22 -= .5;
			clock33 -= .5;
			
			if (world.player.redAmount > 20 || redbar.currentFrame > 2) {
				redbar.gotoAndStop(Math.floor(world.player.redAmount/5));
			}
				
			if (world.player.greenAmount > 20 || greenbar.currentFrame > 2) {
				greenbar.gotoAndStop(Math.floor(world.player.greenAmount/5));
			}
				
			if (world.player.blueAmount > 20 || bluebar.currentFrame > 2) {
				bluebar.gotoAndStop(Math.floor(world.player.blueAmount/5));
			}
			
			if (world.player.redAmount <= 20 && clock1 < 0) {
				redbar.gotoAndStop(1);
				clock1 = 10;
			}
			if (world.player.greenAmount <= 20 && clock2 < 0) {
				greenbar.gotoAndStop(1);
				clock2 = 10;
			}
			if (world.player.blueAmount <= 20 && clock3 < 0) {
				bluebar.gotoAndStop(1);
				clock3 = 10;
			}
			
			if (world.player.redAmount <= 20 && clock11 < 0) {
				redbar.gotoAndStop(2);
				clock11 = 20;
			}
			if (world.player.greenAmount <= 20 && clock22 < 0) {
				greenbar.gotoAndStop(2);
				clock22 = 20;
			}
			if (world.player.blueAmount <= 20 && clock33 < 0) {
				bluebar.gotoAndStop(2);
				clock33 = 20;
			}
		}
	}
	
}
