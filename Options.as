package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Options extends SimpleButton {
		
		var pauzeMenu:PauzeMenu;
		var verderSpelen:Continue;
		var menuBut:MenuBut;
		var world:World;
		var clicked:Boolean;
		
		public function Options(w:World) {
			world = w;
			
			pauzeMenu = new PauzeMenu();
			world.addChild(pauzeMenu);
			pauzeMenu.x = 20000;
			
			menuBut = new MenuBut(world);
			world.addChild(menuBut);
			menuBut.x = 20000;
			
			verderSpelen = new Continue(world);
			world.addChild(verderSpelen);
			verderSpelen.x = 20000;
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent): void {
			if (!clicked) {
				clicked = true;
				MovieClip(root).pauseGame = true;
			
				pauzeMenu.x = 512;
				pauzeMenu.y = 384;
				pauzeMenu.scaleX = 0.15;
				pauzeMenu.scaleY = 0.15;
				
				verderSpelen.x = 512;
				verderSpelen.y = 425;
				verderSpelen.scaleX = 0.15;
				verderSpelen.scaleY = 0.15;
				
				menuBut.x = 512;
				menuBut.y = 525;
				menuBut.scaleX = 0.15;
				menuBut.scaleY = 0.15;
				
				world.moveToTop(pauzeMenu);
				world.moveToTop(verderSpelen);
				world.moveToTop(menuBut);
			}
		}
		
	}
	
}
	

