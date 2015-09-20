package  {
	
	import flash.display.MovieClip;	
	
	
	public class Enemy extends MovieClip {
		
		var location:Vector2;
		var velocity:Vector2;
		var direction:Vector2;
		var playerLocation:Vector2;
		var world:World;
		var radius:Number;
		
		public function Enemy(w:World) {
			world = w;
			//this.alpha = 0.6;
			radius = 30;
			location = new Vector2(1200, 1000);
			velocity = new Vector2(1, 1);
			direction = new Vector2;
		}
		
		public function update():void {
			playerLocation = new Vector2(world.player.x, world.player.y);
			direction = playerLocation.sub(location);
			
			if (direction.x < -200 || direction.x > 200) {
				direction.normalize();
				direction.multS(1.5);
				velocity = direction;
				location.add(velocity);
			}
			if (currentFrame == 40) {
				this.gotoAndPlay(1);
			}
			
			this.x = location.x;
			this.y = location.y;
		}
		
	}
	
}
