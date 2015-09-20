package  {
	
	import flash.display.MovieClip;
	import fl.motion.Color;
	import flash.utils.getTimer;
	import flash.net.URLRequest;
	import flash.events.*;
	import flash.net.URLLoader;
	
	public class Player extends MovieClip {
		
		var radius:Number;
		var paintRadius:Number;
		var speed:Number;
		
		var redAmount:Number;
		var greenAmount:Number;
		var blueAmount:Number;
		var fallCounter:Number;
		
		var colors:Colors;
		var world:World;
		var bucket:Bucket;
		
		var falling:Boolean;
		var onGround:Boolean;
		var check:Boolean;
		var scoreLoader:URLLoader;
		var maptext:String;
		var rijen:Array;
		var scores:Array;
		var enemyStart:Vector2;
		
		public function Player(w:World) {
			world = w;
			
			fallCounter = 50;
			this.radius = 12;
			this.gotoAndStop(1);
			enemyStart = new Vector2();
			
			//RGB percentages.
			redAmount = 70;
			greenAmount = 70;
			blueAmount = 70;
			
			colors = new Colors();
			bucket = new Bucket();
			addChild(bucket);
			bucket.alpha = 0;
			onGround = true;
			check = false;
			
			//The radius of how far the player paints the environment.
			paintRadius = 70;
			
			scoreLoader = new URLLoader();
			scoreLoader.load(new URLRequest("highScore.txt"));
			scoreLoader.addEventListener(Event.COMPLETE, onLoaded);
		}
		
		public function onLoaded(e:Event):void {
			maptext = e.target.data;
			rijen = maptext.split("\r\n");
			scores = new Array(rijen.length);
			for(var i:int=0; i<rijen.length; i++){
				rijen[i] = rijen[i].split(","); 
				trace(i+":",rijen[i]);
				scores[i] = rijen[i];
			}
		}
		
		public function update():void {
			this.speed = 6;
			//this.speed = 2 * world.deltaTime;
			
			world.camera.scrollSpeed = 5;
			//world.camera.scrollSpeed = 1.5 * world.deltaTime;
			//world.camera.scrollDifference = 0.5 * world.deltaTime;
			
			if (onGround) {
				playerCollision();
			}
			if (falling) {
				fallCounter --;
				this.y += 20;
				onGround = false;
				if (fallCounter <= 0) {
					for (var i = world.levelLength - 1; i >= 0; i--) {
						world.removeInstance(world.tileList[i]);
						world.tileList.pop();
					}
					world.gameOver.x = 512;
					world.moveToTop(world.gameOver);
					world.levelsBack.x = 512;
					world.levelsBack.y = 510;
					world.moveToTop(world.levelsBack);
					world.completed = 0;
					world.player.alpha = 0;
					world.pauseGame = true;
					onGround = true;
					fallCounter = 50;
				}
			}
			if (!falling && world.completed >= world.tileList.length - ((world.tileList.length/100) * 10) && world.countDown <= 0) {
				world.highScore.x = 512;
				world.highScore.y = 384;
				world.highScore.scaleX = 0.15;
				world.highScore.scaleY = 0.15;
				world.moveToTop(world.highScore);
				world.highScore.submitScore.x = 25;
				world.highScore.submitButton.x = 25;
				world.highScore.inputField.x = -480;
				world.player.alpha = 0;
				world.pauseGame = true;
				
				if (world.currentLevel == 0) {
					world.level1But.x = 512;
					world.level1But.y = 580;
					world.level2But.x = 20000;
					world.time2 = getTimer();
					world.time1 = world.time2 - world.time1;
					trace("Time: " + world.time1);
				}
				if (world.currentLevel == 1) {
					world.level2But.x = 512;
					world.level2But.y = 580;
					world.level1But.x = 20000;
					world.time2 = getTimer();
					world.time1 = world.time2 - world.time1;
					trace("Time: " + world.time1);
				}
				if (world.currentLevel == 2) {
					world.options.menuBut.x = 512;
					world.options.menuBut.y = 580;
					world.options.menuBut.scaleX = 0.1;
					world.options.menuBut.scaleY = 0.1;
					world.level1But.x = 20000;
					world.level2But.x = 20000;
					world.time2 = getTimer();
					world.time1 = world.time2 - world.time1;
					trace("Time: " + world.time1);
				}
				world.completed = 0;
			}
			enoughPaint();
			bucket.y -= 2;
			bucket.alpha -= 0.02;
			falling = true;
		}
		
		public function submitScore():void {
			for (var j = scores[0].length - 1; j >= 0; j--) {
				if (scores[0][j] < world.time1 && !check) {
					scores[0][j] = String(world.highScore.inputField.text + " " + world.time1);
					check = true;
				}
				var maxValue:Number = Math.max.apply(null, scores[0]);
				if (scores[0][j] == maxValue) {
					world.highScore.highScoreText(maxValue);
				}
			}
			trace(scores[0]);
		}
		
		public function losingPaint():void {
			this.redAmount -= 0.1;
			this.greenAmount -= 0.1;
			this.blueAmount -= 0.1;
		}
		
		public function enoughPaint():void {
			if (redAmount <= 0) {
				redAmount = 0;
			}
			if (greenAmount <= 0) {
				greenAmount = 0;
			}
			if (blueAmount <= 0) {
				blueAmount = 0;
			}
		}
		
		public function playerCollision():void {
			for (var i = world.tileList.length - 1; i >= 0; i--) {
				if (world.tileList[i].currentFrame == 16 || world.tileList[i].currentFrame == 1) {
					world.tileList[i].update();
				}
				if (this.y + 30 < world.tileList[i].y) {
					world.setChildIndex(this, world.getChildIndex(world.tileList[i]));
				}
				var distance:Number = world.pythagoras(this.x, this.y, world.tileList[i].x, world.tileList[i].y);
				if (distance <= this.paintRadius && world.tileList[i].fullColor && redAmount > 0 && greenAmount > 0 && blueAmount > 0 && world.tileList[i].currentFrame < 16) {
					world.tileList[i].filters = [colors.colorFilterRGB];
					world.tileList[i].fullColor = false;
					world.completed ++;
					losingPaint();
				}
				if (distance <= this.paintRadius && world.tileList[i].tileColor && world.tileList[i].fullColor && world.tileList[i].currentFrame < 16) {
					//2
					if (redAmount <= 0 && greenAmount > 0 && blueAmount > 0) {
						world.tileList[i].filters = [colors.colorFilterGB];
						world.tileList[i].tileColor = false;
					}
					//3
					if (redAmount <= 0 && greenAmount <= 0 && blueAmount > 0) {
						world.tileList[i].filters = [colors.colorFilterB];
						world.tileList[i].tileColor = false;
					}
					//4
					if (redAmount > 0 && greenAmount <= 0 && blueAmount <= 0) {
						world.tileList[i].filters = [colors.colorFilterR];
						world.tileList[i].tileColor = false;
					}
					//5
					if (redAmount <= 0 && greenAmount > 0 && blueAmount <= 0) {
						world.tileList[i].filters = [colors.colorFilterG];
						world.tileList[i].tileColor = false;
					}
					//6
					if (redAmount > 0 && greenAmount > 0 && blueAmount <= 0) {
						world.tileList[i].filters = [colors.colorFilterGR];
						world.tileList[i].tileColor = false;
					}
					//7
					if (redAmount > 0 && greenAmount <= 0 && blueAmount > 0) {
						world.tileList[i].filters = [colors.colorFilterBR];
						world.tileList[i].tileColor = false;
					}
					losingPaint();
				}
				//collision with trees
				if (distance <= this.radius + world.tile.radius && world.tileList[i].currentFrame >= 4 && world.tileList[i].currentFrame <= 7) {
					var distanceX:Number = world.tileList[i].x - this.x;
					var distanceY:Number = world.tileList[i].y - this.y;

					var forceR:Number = distance - (this.radius + world.tile.radius);
					
					var forceX:Number = distanceX / distance;
					var forceY:Number = distanceY / distance;
					
					this.x += forceX * forceR; 
					this.y += forceY * forceR;
				}
				//Collision with factory.
				if (distance <= this.radius + world.tile.radius && world.tileList[i].currentFrame >= 16 && world.tileList[i].currentFrame <= 17) {
					var distanceXX:Number = world.tileList[i].x - this.x;
					var distanceYY:Number = world.tileList[i].y - this.y;

					var forceRR:Number = distance - (this.radius + world.tile.radius);
					
					var forceXX:Number = distanceXX / distance;
					var forceYY:Number = distanceYY / distance;
					
					this.x += forceXX * forceRR; 
					this.y += forceYY * forceRR;
				}
				if (world.tileList[i].currentFrame >= 16 && world.tileList[i].currentFrame <= 17) {
					enemyStart.x = world.tileList[i].x;
					enemyStart.y = world.tileList[i].y;
				}
				//collision with bush
				if (distance <= this.radius + world.tile.radius && world.tileList[i].currentFrame >= 14 && world.tileList[i].currentFrame <= 15) {
					this.speed = 3;
					world.camera.scrollSpeed = 3;
					
					if (Math.random() > 0.5 && !world.tileList[i].checked) {
						removeChild(bucket);
						this.bucket = new Bucket();
						addChild(bucket);
						this.bucket.gotoAndStop(1 + Math.floor(Math.random()*3));
						this.bucket.y = -35;
						
						if (bucket.currentFrame == 1 && this.redAmount <= 100) {
							this.redAmount += 10;
						}
						if (bucket.currentFrame == 2 && this.greenAmount <= 100) {
							this.greenAmount += 10;
						}
						if (bucket.currentFrame == 3 && this.blueAmount <= 100) {
							this.blueAmount += 10;
						}
					}
					world.tileList[i].checked = true;
				}
				if (world.tileList[i].currentFrame >= 14 && world.tileList[i].currentFrame <= 15 && Math.random() > 0.995){
					world.tileList[i].checked = false;
				}
				if (distance <= world.tile.radius && world.tileList[i].currentFrame >= 1) {
					falling = false;
				}
				if (world.factoryColored && world.tileList[i].currentFrame >= 16 && world.tileList[i].currentFrame <= 17) {
					world.tileList[i].filters = [this.colors.colorFilterRGB];
					world.tileList[i].fullColor = false;
					world.tileList[i].tileColor = false;
				}
				for (var k = world.bulletList.length - 1; k >= 0; k--) {
					var distance3:Number = world.pythagoras(world.bulletList[k].x, world.bulletList[k].y, world.tileList[i].x, world.tileList[i].y);
					if (distance3 <= world.tile.radius && world.tileList[i].currentFrame >= 16 && world.tileList[i].currentFrame <= 17) {
						world.tileList[i].filters = [this.colors.colorFilterRGB];
						world.tileList[i].fullColor = false;
						world.tileList[i].tileColor = false;
						world.factoryColored = true;
					}
				}
				//enemy collision
				for (var j = world.enemyList.length - 1; j >= 0; j--) {
					if (world.enemyList[j].location.y + 30 < world.tileList[i].y) {
						world.setChildIndex(world.enemyList[j], world.getChildIndex(world.tileList[i]));
					}
					var distance2:Number = world.pythagoras(world.enemyList[j].location.x, world.enemyList[j].location.y, world.tileList[i].x, world.tileList[i].y);
					if (distance2 <= this.paintRadius) {
						world.tileList[i].filters = [this.colors.colorFilterBW];
						world.tileList[i].fullColor = true;
						world.tileList[i].tileColor = true;
					}
				}
			}
		}
		
		public function left():void {
			this.x -= this.speed;
			this.gotoAndStop(2);
		}
		
		public function right():void {
			this.x += this.speed;
			this.gotoAndStop(2);
		}
		
		public function up():void {
			this.y -= this.speed;
			this.gotoAndStop(2);
		}
		
		public function down():void {
			this.y += this.speed;
			this.gotoAndStop(1);
		}
	}
	
}
