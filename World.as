package  {
	
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.ui.Keyboard;
	import flash.events.*;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.BlurFilter;
	import fl.motion.Color;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.ui.GameInput;
	import flash.utils.getTimer;
	
	public class World extends MovieClip {
		
		var enter:Boolean;
		var space:Boolean;
		var left:Boolean;
		var right:Boolean;
		var up:Boolean;
		var down:Boolean;
		
		var dirUp:Boolean;
		var dirUpRight:Boolean;
		var dirRight:Boolean;
		var dirDownRight:Boolean;
		var dirDown:Boolean;
		var dirDownLeft:Boolean;
		var dirLeft:Boolean;
		var dirUpLeft:Boolean;
		var sounds:Boolean;
		
		var tutorialStep0:Boolean;
		var tutorialStep1:Boolean;
		var tutorialStep2:Boolean;
		var tutorialStep3:Boolean;
		var tutorialStep4:Boolean;
		var tutorialStep5:Boolean;
		var tutorialStep6:Boolean;
		var tutorialStep7:Boolean;
		var tutorialStep8:Boolean;
		var tutorialStep9:Boolean;
		
		var tutorialBoolean:Boolean;
		var factoryColored:Boolean;
		var introBoolean:Boolean;
		var pauseGame:Boolean;
		
		var matrix:Array;
		var tileList:Array;
		var bulletList:Array;
		var enemyList:Array;
		
		var rijen0:Array;
		var rijen1:Array;
		var rijen2:Array;
		
		var level0:Array;
		var level1:Array;
		var level2:Array;

		var time1:Number;
		var time2:Number;
		var tutorialTimer:Number;
		var currentLevel:Number;
		var worldX:Number;
		var worldY:Number;
		var completed:Number;
		var maxBullets:Number;
		var countDown:Number;
		var enemyCountdown:Number;
		var enemyAmount:Number;
		var levelLength:Number;
		
		var hoofdMenu:Menu;
		var options:Options;
		var camera:Camera;
		var inter:Interface;
		
		var mapLoader0:URLLoader;
		var mapLoader1:URLLoader;
		var mapLoader2:URLLoader;
		
		var maptext0:String;
		var maptext1:String;
		var maptext2:String;
		
		var text1:Text1;
		var text2:Text2;
		var text3:Text3;
		var text4:Text4;
		var text5:Text5;
		var text6:Text6;
		var text7:Text7;
		
		var colors:Colors;
		var player:Player;
		var enemy:Enemy;
		var level1But:Level1;
		var level2But:Level2;
		var tile:Tile;
		var bullet:Bullet;
		var levelsBack:LevelsBack;
		var levelsMenu:LevelsMenu;
		var splashScreen:SplashScreen;
		var highScore:HighScore;
		var gameOver:GameOver;
		var creditsMenu:CreditsMenu;
		
		var transAlp:TransAlp = new TransAlp();
		var click:Click = new Click();

		var soundChannel:SoundChannel = transAlp.play();
		var clickChannel:SoundChannel = click.play();
		
		public function World() {
			//set the timer for the tutorial
			tutorialTimer = 2;
			
			//tutorial text files
			text1 = new Text1();
			addChild(text1);
			text1.x = 20000;
			text1.scaleX = 0.1;
			text1.scaleY = 0.1;
			
			text2 = new Text2();
			addChild(text2);
			text2.x = 20000;
			text2.scaleX = 0.1;
			text2.scaleY = 0.1;
			
			text3 = new Text3();
			addChild(text3);
			text3.x = 20000;
			text3.scaleX = 0.1;
			text3.scaleY = 0.1;
			
			text4 = new Text4();
			addChild(text4);
			text4.x = 20000;
			text4.scaleX = 0.1;
			text4.scaleY = 0.1;
			
			text5 = new Text5();
			addChild(text5);
			text5.x = 20000;
			text5.scaleX = 0.1;
			text5.scaleY = 0.1;
			
			text6 = new Text6();
			addChild(text6);
			text6.x = 20000;
			text6.scaleX = 0.1;
			text6.scaleY = 0.1;
			
			text7 = new Text7();
			addChild(text7);
			text7.x = 20000;
			text7.scaleX = 0.1;
			text7.scaleY = 0.1;
			
			//add player
			player = new Player(this);
			addChild(player);
			
			//add credits menu
			creditsMenu = new CreditsMenu();
			addChild(creditsMenu);
			creditsMenu.x = 20000;
			creditsMenu.scaleX = 0.24;
			creditsMenu.scaleY = 0.24;
			
			//add Game Over Screen
			gameOver = new GameOver();
			addChild(gameOver);
			gameOver.x = 20000;
			gameOver.y = 384;
			gameOver.scaleX = 0.18;
			gameOver.scaleY = 0.18;
			
			//addlevels menu
			levelsMenu = new LevelsMenu();
			addChild(levelsMenu);
			levelsMenu.x = 20000;
			levelsMenu.scaleX = 0.18;
			levelsMenu.scaleY = 0.18;
			
			//addlevel1 button
			level1But = new Level1(this);
			addChild(level1But);
			level1But.x = 20000;
			
			//addLevel2 button
			level2But = new Level2(this);
			addChild(level2But);
			level2But.x = 20000;
			
			//add back button
			levelsBack = new LevelsBack(this);
			addChild(levelsBack);
			levelsBack.x = 20000;
			levelsBack.scaleX = 0.15;
			levelsBack.scaleY = 0.15;

			//add interface
			inter = new Interface(this);
			addChild(inter);
			inter.x = 20000;
			
			//add options button
			options = new Options(this);
			addChild(options);
			options.x = 20000;
			options.scaleX = 0.15;
			options.scaleY = 0.15;
			
			//add hoofd menu
			hoofdMenu = new Menu(this);
			addChild(hoofdMenu);
				
			//add high score
			highScore = new HighScore(this);
			addChild(highScore);
			highScore.x = 20000;
			
			//add splash screen
			splashScreen = new SplashScreen();
			addChild(splashScreen);
			splashScreen.scaleX = 1.04;
			splashScreen.scaleY = 1.04;
			splashScreen.x = -20;
			splashScreen.y = -20;

			pauseGame = true;
			introBoolean = false;
			dirDown = true;
			pauseGame = true;
			completed = 0;
			maxBullets = 25;
			countDown = 15;
			enemyCountdown = 15;
			enemyAmount = 0;
			currentLevel = 0;
			
			tile = new Tile();
			bullet = new Bullet();

			bulletList = new Array();
			tileList = new Array();
			enemyList = new Array();
			
			colors = new Colors();
			camera = new Camera(this);
			
			level0 = new Array();
			level1 = new Array();
			level2 = new Array();
			
			mapLoader0 = new URLLoader();
			mapLoader1 = new URLLoader();
			mapLoader2 = new URLLoader();
			
			mapLoader0.load(new URLRequest("levels/level_0.txt"));
			mapLoader1.load(new URLRequest("levels/level_1.txt"));
			mapLoader2.load(new URLRequest("levels/level_2.txt"));
			
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			
			mapLoader0.addEventListener(Event.COMPLETE, onLoaded0);
			mapLoader1.addEventListener(Event.COMPLETE, onLoaded1);
			mapLoader2.addEventListener(Event.COMPLETE, onLoaded2);
		}
		
		public function update(event:Event):void {
			//always update the camera and the interface ;)
			camera.update();
			inter.update();
			
			//if level one is the case than update tutorial
			if (tutorialBoolean) {
				tutorial();
			}
			
			//139 frames
			if (splashScreen.currentFrame == 1) {
				this.setChildIndex(splashScreen, 0);
				splashScreen.gotoAndStop(1);
				splashScreen.x = 20000
				splashScreen.alpha = 0;
			}

			if (introBoolean) {
				soundChannel = transAlp.play(0, int.MAX_VALUE);
				introBoolean = false;
			}
			
			if (!pauseGame) {
				if (sounds) {
					soundChannel = transAlp.play(0, int.MAX_VALUE);
					sounds = false;
				}
				if (left) {
					player.left();
					dirLeft = true;
					
					dirUp = false;
					dirUpRight = false;
					dirRight = false;
					dirDownRight = false;
					dirDown = false;
					dirDownLeft = false;
					dirUpLeft = false;
				}
				if (right) {
					player.right();
					dirRight = true;
					
					dirUp = false;
					dirUpRight = false;
					dirDownRight = false;
					dirDown = false;
					dirDownLeft = false;
					dirLeft = false;
					dirUpLeft = false;
				}
				if (up) {
					player.up();
					dirUp = true;
					
					dirUpRight = false;
					dirRight = false;
					dirDownRight = false;
					dirDown = false;
					dirDownLeft = false;
					dirLeft = false;
					dirUpLeft = false;
				}
				if (down) {
					player.down();
					dirDown = true;
					
					dirUp = false;
					dirUpRight = false;
					dirRight = false;
					dirDownRight = false;
					dirDownLeft = false;
					dirLeft = false;
					dirUpLeft = false;
				}
				
				if (right && down) {
					player.gotoAndStop(4);
					dirDownRight = true;
					
					dirUp = false;
					dirUpRight = false;
					dirRight = false;
					dirDown = false;
					dirDownLeft = false;
					dirLeft = false;
					dirUpLeft = false;
				}
				if (left && down) {
					player.gotoAndStop(3);
					dirDownLeft = true;
					
					dirUp = false;
					dirUpRight = false;
					dirRight = false;
					dirDownRight = false;
					dirDown = false;
					dirLeft = false;
					dirUpLeft = false;
				}
				if (right && up) {
					player.gotoAndStop(5);
					dirUpRight = true;
					
					dirUp = false;
					dirRight = false;
					dirDownRight = false;
					dirDown = false;
					dirDownLeft = false;
					dirLeft = false;
					dirUpLeft = false;
				}
				if (left && up) {
					player.gotoAndStop(5);
					dirUpLeft = true;
					
					dirUp = false;
					dirUpRight = false;
					dirRight = false;
					dirDownRight = false;
					dirDown = false;
					dirDownLeft = false;
					dirLeft = false;
				}
				
				if (space && countDown <= 0 && player.blueAmount + player.greenAmount + player.redAmount > 0) {
					bullet = new Bullet();
					addChild(bullet);
					bullet.x = player.x;
					bullet.y = player.y - 5;
					bulletList.push(bullet);
					countDown = 15;
					space = false;
					if (bullet.currentFrame == 1) {
						player.redAmount -= 2;
					}
					if (bullet.currentFrame == 2) {
						player.greenAmount -= 2;
					}
					if (bullet.currentFrame == 3) {
						player.blueAmount -= 2;
					}
					if (dirUp) {
						bullet.y -= 25;
						bullet.speedY = -20;
					}
					if (dirUpRight) {
						bullet.speedY = -11.6;
						bullet.speedX = 20;
					}
					if (dirRight) {
						bullet.speedX = 20;
					}
					if (dirDownRight) {
						bullet.speedY = 11.6;
						bullet.speedX = 20;
					}
					if (dirDown) {
						bullet.speedY = 20;
					}
					if (dirDownLeft) {
						bullet.speedY = 11.6;
						bullet.speedX = -20;
					}
					if (dirLeft) {
						bullet.speedX = -20;
					}
					if (dirUpLeft) {
						bullet.speedY = -11.6;
						bullet.speedX = -20;
					}
				}
				
				player.update();
				createEnemy();
				
				if (bulletList.length > maxBullets) {
					removeChild(bulletList.shift());
				}
				for (var i=0; i<bulletList.length; i++) {
					bulletList[i].update();
				}
				for (var j=0; j<enemyList.length; j++) {
					enemyList[j].update();
				}
				if (enemyList.length > 0 && bulletList.length > 0) {
					enemyCollision();
				}
				countDown -= 3;
				enemyCountdown -= 1;
				tutorialTimer -=1;
			}
		}
		
		public function tutorial():void {
			if (tutorialStep0 && tutorialTimer <= 0) {
				tutorialStep0 = false;
				this.moveToTop(text1);
				text1.x = 20;
				text1.y = 748;
				pauseGame = true;
				tutorialStep1 = true;
			}
			if (tutorialStep1 && up) {
				tutorialStep1 = false;
				text1.x = 20000;
				tutorialTimer = 100;
				pauseGame = false;
				tutorialStep2 = true;
			}
			if (tutorialStep2 && tutorialTimer <= 0) {
				tutorialStep2 = false;
				this.moveToTop(text2);
				text2.x = 20;
				text2.y = 738;
				pauseGame = true;
				tutorialStep3 = true;
			}
			if (tutorialStep3 && space) {
				tutorialStep3 = false;
				text2.x = 20000;
				tutorialTimer = 100;
				pauseGame = false;
				tutorialStep4 = true;
			}
			if (tutorialStep4 && tutorialTimer <=0) {
				tutorialStep4 = false;
				this.moveToTop(text3);
				text3.x = 20;
				text3.y = 748;
				pauseGame = true;
				tutorialStep5 = true;
			}
			if (tutorialStep5 && enter) {
				text3.x = 20000;
				tutorialStep5 = false;
				this.moveToTop(text4);
				text4.x = 20;
				text4.y = 748;
				enter = false;
				tutorialStep6 = true;
			}
			if (tutorialStep6 && enter) {
				text4.x = 20000;
				tutorialStep6 = false;
				this.moveToTop(text5);
				text5.x = 20;
				text5.y = 748;
				enter = false;
				tutorialStep7 = true;
			}
			if (tutorialStep7 && enter) {
				text5.x = 20000;
				tutorialStep7 = false;
				this.moveToTop(text6);
				text6.x = 20;
				text6.y = 748;
				enter = false;
				tutorialStep8 = true;
			}
			if (tutorialStep8 && enter) {
				text6.x = 20000;
				tutorialStep8 = false;
				this.moveToTop(text7);
				text7.x = 20;
				text7.y = 748;
				enter = false;
				tutorialStep9 = true;
			}
			if (tutorialStep9 && enter) {
				tutorialStep9 = false;
				pauseGame = false;
				text7.x = 20000;
				tutorialBoolean = false;
			}
		}
		
		public function addPlayer():void {
			this.setChildIndex(player, levelLength)
			player.x = 500;
			player.y = 300;
		}
		
		public function createEnemy():void {
			if (enemyAmount < 1 && enemyCountdown <= 0 && !factoryColored) {
				enemy = new Enemy(this);
				addChild(enemy);
				enemy.location.x = player.enemyStart.x;
				enemy.location.y = player.enemyStart.y;
				enemyList.push(enemy);
				enemyAmount += 1;
				enemyCountdown = 100;
			}
		}
		
		public function enemyCollision():void {
			var e:Enemy = null;
			var b:Bullet = null;
			var c = 0;
			for (var j = enemyList.length - 1; j >= 0; j--) {
				for (var i = bulletList.length - 1; i >= 0; i--) {
					var distance:Number = pythagoras(enemyList[j].x, enemyList[j].y, bulletList[i].x, bulletList[i].y);
					if (distance < enemyList[j].radius) {
						e = enemyList[j];
						b = bulletList[i];
						var jj:int = j;
						var ii:int = i;
						enemyAmount -= 1;
					}
				}
			}
			
			if (e != null) {
				removeInstance(e);
				enemyList.splice(jj, 1);
			}
			if (b != null) {
				removeInstance(enemyList[j]);
				enemyList.splice(ii, 1);
			}
			
		}
		
		public function moveToTop(child:DisplayObject):void {
			(child.parent != null) ? child.parent.setChildIndex(child, child.parent.numChildren-1) : null;
		}
		
		public function removeInstance(someChild:DisplayObject):void {
			for (var i:int = 0; i < this.numChildren; i++) {
				if (this.getChildAt(i) === someChild) {
					this.removeChild(someChild);
				}
			}
		}
		
		public function pythagoras(pos1X, pos1Y, pos2X, pos2Y):Number {
			var getal:Number = ((pos1X - pos2X) * (pos1X - pos2X)) + ((pos1Y - pos2Y) * (pos1Y - pos2Y));
			var distance:Number = Math.sqrt(getal);
			return distance;
		}
		
		public function stopSounds():void {
			soundChannel.stop();
		}
		
		private function keyDownHandler(event:KeyboardEvent):void {
			switch(event.keyCode) {
				case Keyboard.ENTER :
					enter = true;
					break;
				case Keyboard.SPACE :
					space = true;
					break;
				case Keyboard.LEFT :
					left = true;
					break;
				case Keyboard.RIGHT :
					right = true;
					break;
				case Keyboard.UP :
					up = true;
					break;
				case Keyboard.DOWN :
					down = true;
					break;
				default:
				break;
			}
		}
		
		private function keyUpHandler(event:KeyboardEvent):void {
			switch(event.keyCode) {
				case Keyboard.ENTER :
					enter = false;
					break;
				case Keyboard.SPACE :
					space = false;
					break;
				case Keyboard.LEFT :
					left = false;
					break;
				case Keyboard.RIGHT :
					right = false;
					break;
				case Keyboard.UP :
					up = false;
					break;
				case Keyboard.DOWN :
					down = false;
					break;
				default:
				break;
			}
		}
		
		public function onLoaded0(e:Event):void {
			maptext0 = e.target.data;
			rijen0 = maptext0.split("\r\n");
			level0 = new Array(rijen0.length);
			for(var i:int=0; i<rijen0.length; i++){
				rijen0[i] = rijen0[i].split(","); 
				//trace(i+":",rijen0[i]);
				level0[i] = rijen0[i];
			}
		}
		
		public function onLoaded1(e:Event):void {
			maptext1 = e.target.data;
			rijen1 = maptext1.split("\r\n");
			level1 = new Array(rijen1.length);
			for(var i:int=0; i<rijen1.length; i++){
				rijen1[i] = rijen1[i].split(","); 
				//trace(i+":",rijen1[i]);
				level1[i] = rijen1[i];
			}
		}
		
		public function onLoaded2(e:Event):void {
			maptext2 = e.target.data;
			rijen2 = maptext2.split("\r\n");
			level2 = new Array(rijen2.length);
			for(var i:int=0; i<rijen2.length; i++){
				rijen2[i] = rijen2[i].split(","); 
				//trace(i+":",rijen2[i]);
				level2[i] = rijen2[i];
			}
		}
		
		public function addGrid0():void {
			for(var x=0; x<rijen0.length; x++) {
				for(var y=0; y<rijen0[0].length; y++) {
					if (level0[x][y] != 0) {
						tile = new Tile();
						addChild(tile);
						tile.filters = [colors.colorFilterBW];
						tile.gotoAndStop(level0[x][y]);
						tile.tileColor = true;
						tile.fullColor = true;
						if (rijen0.length - 1 == x) {
							tile.alpha = 0;
						}
						if (x % 2 != 0) {
							tile.x = (y * 63) + 31.5;
							tile.y = x * 18;
							tileList.push(tile);
						}
						else {
							tile.x = y * 63;
							tile.y = x * 18;
							tileList.push(tile);
						}
					}
				}
			}
			levelLength = tileList.length;
			time1 = getTimer();
		}
		
		public function addGrid1():void {
			for(var x=0; x<rijen1.length; x++) {
				for(var y=0; y<rijen1[0].length; y++) {
					if (level1[x][y] != 0) {
						tile = new Tile();
						addChild(tile);
						tile.filters = [colors.colorFilterBW];
						tile.gotoAndStop(level1[x][y]);
						tile.tileColor = true;
						tile.fullColor = true;
						if (rijen1.length - 1 == x) {
							tile.alpha = 0;
						}
						if (x % 2 != 0) {
							tile.x = (y * 63) + 31.5;
							tile.y = x * 18;
							tileList.push(tile);
						}
						else {
							tile.x = y * 63;
							tile.y = x * 18;
							tileList.push(tile);
						}
					}
				}
			}
			levelLength = tileList.length;
			time1 = getTimer();
		}

		public function addGrid2():void {
			for(var x=0; x<rijen2.length; x++) {
				for(var y=0; y<rijen2[0].length; y++) {
					if (level2[x][y] != 0) {
						tile = new Tile();
						addChild(tile);
						tile.filters = [colors.colorFilterBW];
						tile.gotoAndStop(level2[x][y]);
						tile.tileColor = true;
						tile.fullColor = true;
						if (rijen2.length - 1 == x) {
							tile.alpha = 0;
						}
						if (x % 2 != 0) {
							tile.x = (y * 63) + 31.5;
							tile.y = x * 18;
							tileList.push(tile);
						}
						else {
							tile.x = y * 63;
							tile.y = x * 18;
							tileList.push(tile);
						}
					}
				}
			}
			levelLength = tileList.length;
			time1 = getTimer();
		}
		
	}
	
}
