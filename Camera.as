package  {
	
	import flash.display.MovieClip;
	
	public class Camera extends MovieClip {
		
		var spacingX:Number;
		var spacingY:Number;
		var spacingX2:Number;
		var spacingY2:Number;
		var scrollSpeed:Number;
		var scrollDifference:Number;
		var world:World;
		
		public function Camera(w:World) {
			world = w;
			spacingX = 512;
			spacingY = 384;
			spacingX2 = 400;
			spacingY2 = 300;
			scrollSpeed = 5;
			scrollDifference = 1;
		}
		
		public function update():void {
			//horizontal left
			if (world.player.x < spacingX && world.player.x >= spacingX2) {
				world.player.x += scrollSpeed;
				for (var i = world.tileList.length - 1; i >= 0; i--) {
					world.tileList[i].x += scrollSpeed;
				}
				for (var iz = world.bulletList.length - 1; iz >= 0; iz--) {
					world.bulletList[iz].x += scrollSpeed;
				}
				for (var izz = world.enemyList.length - 1; izz >= 0; izz--) {
					world.enemyList[izz].location.x += scrollSpeed;
				}
			}
			if (world.player.x < spacingX2) {
				world.player.x += scrollSpeed + scrollDifference;
				for (var ii = world.tileList.length - 1; ii >= 0; ii--) {
					world.tileList[ii].x += scrollSpeed + scrollDifference;
				}
				for (var iiz = world.bulletList.length - 1; iiz >= 0; iiz--) {
					world.bulletList[iiz].x += scrollSpeed + scrollDifference;
				}		
				for (var iizz = world.enemyList.length - 1; iizz >= 0; iizz--) {
					world.enemyList[iizz].location.x += scrollSpeed + scrollDifference;
				}
			}
			//horizontal right
			if (world.player.x > 1024 - spacingX && world.player.x <= 1024 - spacingX2) {
				world.player.x -= scrollSpeed;
				for (var j = world.tileList.length - 1; j >= 0; j--) {
					world.tileList[j].x -= scrollSpeed;
				}
				for (var jz = world.bulletList.length - 1; jz >= 0; jz--) {
					world.bulletList[jz].x -= scrollSpeed;
				}
				for (var jzz = world.enemyList.length - 1; jzz >= 0; jzz--) {
					world.enemyList[jzz].location.x -= scrollSpeed;
				}
			}
			if (world.player.x > 1024 - spacingX2) {
				world.player.x -= scrollSpeed + scrollDifference;
				for (var jj = world.tileList.length - 1; jj >= 0; jj--) {
					world.tileList[jj].x -= scrollSpeed + scrollDifference;
				}
				for (var jjz = world.bulletList.length - 1; jjz >= 0; jjz--) {
					world.bulletList[jjz].x -= scrollSpeed + scrollDifference;
				}
				for (var jjzz = world.enemyList.length - 1; jjzz >= 0; jjzz--) {
					world.enemyList[jjzz].location.x -= scrollSpeed + scrollDifference;
				}
			}
			//vertical down
			if (world.player.y > 768 - spacingY && world.player.y <= 768 - spacingY2) {
				world.player.y -= scrollSpeed;
				for (var k = world.tileList.length - 1; k >= 0; k--) {
					world.tileList[k].y -= scrollSpeed;
				}
				for (var kz = world.bulletList.length - 1; kz >= 0; kz--) {
					world.bulletList[kz].y -= scrollSpeed;
				}
				for (var kzz = world.enemyList.length - 1; kzz >= 0; kzz--) {
					world.enemyList[kzz].location.y -= scrollSpeed;
				}
			}
			if (world.player.y > 768 - spacingY2) {
				world.player.y -= scrollSpeed + scrollDifference;
				for (var kk = world.tileList.length - 1; kk >= 0; kk--) {
					world.tileList[kk].y -= scrollSpeed + scrollDifference;					
				}
				for (var kkz = world.bulletList.length - 1; kkz >= 0; kkz--) {
					world.bulletList[kkz].y -= scrollSpeed + scrollDifference;					
				}
				for (var kkzz = world.enemyList.length - 1; kkzz >= 0; kkzz--) {
					world.enemyList[kkzz].location.y -= scrollSpeed + scrollDifference;					
				}
			}
			//vertical up
			if (world.player.y < spacingY && world.player.y >= spacingY2) {
				world.player.y += scrollSpeed;
				for (var l = world.tileList.length - 1; l >= 0; l--) {
					world.tileList[l].y += scrollSpeed;
				}
				for (var lz = world.bulletList.length - 1; lz >= 0; lz--) {
					world.bulletList[lz].y += scrollSpeed;
				}
				for (var lzz = world.enemyList.length - 1; lzz >= 0; lzz--) {
					world.enemyList[lzz].location.y += scrollSpeed;
				}
			}
			if (world.player.y < spacingY2) {
				world.player.y += scrollSpeed + scrollDifference;
				for (var ll = world.tileList.length - 1; ll >= 0; ll--) {
					world.tileList[ll].y += scrollSpeed + scrollDifference;
				}
				for (var llz = world.bulletList.length - 1; llz >= 0; llz--) {
					world.bulletList[llz].y += scrollSpeed + scrollDifference;
				}
				for (var llzz = world.enemyList.length - 1; llzz >= 0; llzz--) {
					world.enemyList[llzz].location.y += scrollSpeed + scrollDifference;
				}
			}

		}

	}
	
}
