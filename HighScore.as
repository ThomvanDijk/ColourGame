package  {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	public class HighScore extends MovieClip {
		
		var world:World;
		var submitScore:SubmitScore;
		var submitButton:SubmitButton;
		var scoreText:TextField;
		var inputField:TextField;
		
		public function HighScore(w:World) {
			world = w;
			
			world.level1But.scaleX = 0.09;
			world.level1But.scaleY = 0.09;
			world.level1But.y = 150;
			
			world.level2But.scaleX = 0.09;
			world.level2But.scaleY = 0.09;
			world.level2But.y = 150;
			
			//make text
			scoreText = new TextField();
			addChild(scoreText);
			scoreText.background = false;
			scoreText.scaleX = 10;
			scoreText.scaleY = 10;
			scoreText.width = 150;
			scoreText.height = 100;
			scoreText.x = -300;
			scoreText.y = 300;
			
			//add submit score to enter your name...
			submitScore = new SubmitScore();
			submitScore.scaleX = 0.41;
			submitScore.scaleY = 0.515;
			submitScore.x = 25;
			submitScore.y = 515;
			addChild(submitScore);
			//world.moveToTop(submitScore);
			
			submitButton = new SubmitButton(world);
			submitButton.scaleX = 1;
			submitButton.scaleY = 1;
			submitButton.x = 25;
			submitButton.y = 700;
			addChild(submitButton);
			//world.moveToTop(submitButton);
			
			//input field
			inputField = new TextField();
			addChild(inputField);
			inputField.scaleX = 10;
			inputField.scaleY = 10;
			inputField.width = 100;
			inputField.height = 20;
			inputField.x = -480;
			inputField.y = 120;
			inputField.background = true;
			inputField.maxChars = 15;
			inputField.restrict = "A-Za-z";
			inputField.type = "input";
			//world.moveToTop(inputField);
		}
		
		public function highScoreText(score:Number):void {
			scoreText.text = "Unknown " + String(score);
		}
		
	}
	
}
