package {
	
	public class Vector2 {
		// ####################################################
		// properties
		// ####################################################
		public var x:Number;
		public var y:Number;
		
		// ####################################################
		// constructor
		// ####################################################
		public function Vector2(xx:Number = 0, yy:Number = 0) {
			this.x = xx;
			this.y = yy;
		}
		
		// ####################################################
		// methods
		// ####################################################
		// creators (setters)
		public function setTo(xx:Number, yy:Number):Vector2 {
			// TODO implement
			return null;
		}
		
		public function create(begin:Vector2, end:Vector2):Vector2 {
			// TODO implement
			return null;
		}
		
		public function fromAngle(angle:Number):Vector2 {
			angle *= (Math.PI/180);
			this.x = Math.cos(angle);
			this.y = Math.sin(angle);
			return this
		}
		
		public function copy():Vector2 {
			return new Vector2(this.x, this.y);
		}
		
		// info (getters)
		public function mag():Number {
			var getal:Number = (x*x) + (y*y);
			var pos:Number = Math.sqrt(getal);
			return pos;
		}
		
		public function magSq():Number {
			// TODO implement
			return 0;
		}
		
		public function dist(other:Vector2):Number {
			// TODO implement
			return 0;
		}
		
		public function getNormalized():Vector2 {
			var t:Vector2 = new Vector2(this.x, this.y);
			t.normalize();
			return t;
		}
		
		public function normalize():Vector2 {
			var m:Number = this.mag();
			this.x = this.x / m;
			this.y = this.y / m;
			return this;
		}
		
		public function limit(max:Number):Vector2 {
			if (this.mag() > max) {
				this.normalize();
				this.multS(max);
			}
			return this;
		}
		
		public function setMag(magnitude:Number):Vector2 {
			// TODO implement
			return null;
		}
		
		public function getAngle():Number {
			var angle = Math.atan2(y, x);
			return angle * (180/Math.PI);
		}
		
		public function getAngleToVector(other:Vector2):Number {
			// TODO implement
			return 0;
		}
		
		public function dot(other:Vector2):Number {
			// TODO implement
			return 0;
		}
		
		// manipulators
		public function rotate(angle:Number):Vector2 {
			// TODO implement
			return null;
		}
		
		public function add(other:Vector2):Vector2 {
			this.x += other.x;
			this.y += other.y;
			return this;
		}
		
		public function sub(other:Vector2):Vector2 {
			this.x -= other.x;
			this.y -= other.y;
			return this;
		}
		
		public function mult(other:Vector2):Vector2 {
			this.x *= other.x;
			this.y *= other.y;
			return this;
		}
		
		public function multS(scalar:Number):Vector2 {
			this.x *= scalar;
			this.y *= scalar;
			return this;
		}
		
		public function div(other:Vector2):Vector2 {
			this.x /= other.x;
			this.y /= other.y;
			return this;
		}
		
		public function divS(scalar:Number):Vector2 {
			this.x /= scalar;
			this.y /= scalar;
			return this;
		}
		
		public static function rad2deg(a:Number):Number {
			return a * (180/Math.PI);
		}
		
		public static function deg2rad(a:Number):Number {
			return a * (Math.PI/180);
		}
		
		public function toString():String {
			return new String("["+this.x+", "+this.y+"]");
		}
		
	}
}