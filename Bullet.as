package  {
	
	import flash.display.MovieClip;
	
	
	public class Bullet extends MovieClip {
		
		var speedX:Number;
		var speedY:Number;
		
		public function Bullet() {
			this.gotoAndStop(Math.floor(Math.random()*3)+1);
			
			this.speedX = 0;
			this.speedY = 0;
		}
		
		public function update():void {
			this.x += speedX;
			this.y += speedY;
		}
		
	}
	
}
