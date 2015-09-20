package  {
	
	import flash.display.MovieClip;
	
	public class Tile extends MovieClip {
		
		var tileNumber:Number;
		var radius:Number;
		var tileColor:Boolean;
		var fullColor:Boolean;
		var checked:Boolean;
		var particle:Particle;
		var particles:Array;
		var lifespan:Number;
		var maxParts:Number;
		var random:Number;

		public function Tile() {
			particles = new Array();
			lifespan = 0;
			maxParts = 100;
			tileNumber = 0;
			radius = 32;
		}
		
		public function update():void {
			random = Math.random();
			//smoke
			if (lifespan <= 0 && random > 0.5 && this.currentFrame == 16) {
				particle = new Particle(this);
				addChild(particle);
				particle.location.x = 6.8;
				particle.location.y = -155;
				particle.filters = [MovieClip(root).colors.colorFilterBW];
				particles.push(particle);
				lifespan = 1;
			}
			if (lifespan <= 0 && random < 0.5 && this.currentFrame == 16) {
				particle = new Particle(this);
				addChild(particle);
				particle.location.x = 25.8;
				particle.location.y = -168;
				particle.filters = [MovieClip(root).colors.colorFilterBW];
				particles.push(particle);
				lifespan = 1;
			}
			//waterfall
			if (lifespan <= 0 && random < 0.5 && this.currentFrame == 1) {
				particle = new Particle(this);
				addChild(particle);
				particle.location.x = 18;
				particle.location.y = 3;
				particle.velocity.x = 1;
				particle.velocity.y = 0;
				particle.force.x = 0.1;
				particle.force.y = (Math.random()+0.1)*2;
				particles.push(particle);
				lifespan = 1;
			}
			if (lifespan <= 0 && random > 0.5 && this.currentFrame == 1) {
				particle = new Particle(this);
				addChild(particle);
				particle.location.x = 10;
				particle.location.y = 5;
				particle.velocity.x = 1;
				particle.velocity.y = 0;
				particle.force.x = 0.1;
				particle.force.y = (Math.random()+0.1)*2;
				particles.push(particle);
				lifespan = 1;
			}
			if (particles.length > maxParts) {
				removeChild(particles.shift());
			}
			for (var i = 0; i < particles.length; i++) {
				particles[i].update();
			}
			lifespan -= 0.5;
		}
		
	}
	
}
