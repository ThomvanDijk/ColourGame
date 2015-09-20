package  {
	
	import flash.display.MovieClip;
	
	public class Particle extends MovieClip {
		
		var location:Vector2;
		var velocity:Vector2;
		var acceleration:Vector2;
		var force:Vector2;
		var topspeed:Number;
		var tile:Tile;
		
		public function Particle(t:Tile) {
			tile = t;
			location = new Vector2(0, 0);
			velocity = new Vector2(0, -1);
			acceleration = new Vector2(0, 0);
			force = new Vector2(((Math.random()*2)/100), -0.01);
			topspeed = 2;
		}
		
		public function update():void {
			acceleration.add(force);
			velocity.add(acceleration);
			this.rotation += Math.random()*2; 
			velocity.limit(topspeed);
			location.add(velocity);
			this.alpha -= 0.003;

			x = location.x;
			y = location.y;
		}
		
	}
	
}
