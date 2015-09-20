package  {
	
	import flash.display.MovieClip;
	import flash.filters.ColorMatrixFilter;
	
	public class Colors extends MovieClip {

		var matrixBW:Array;
		var matrixRGB:Array;
		var matrixGB:Array;
		var matrixB:Array;
		var matrixR:Array;
		var matrixG:Array;
		var matrixGR:Array;
		var matrixBR:Array;
		
		var colorFilterBW:ColorMatrixFilter;
		var colorFilterRGB:ColorMatrixFilter;
		var colorFilterGB:ColorMatrixFilter;
		var colorFilterB:ColorMatrixFilter;
		var colorFilterR:ColorMatrixFilter;
		var colorFilterG:ColorMatrixFilter;
		var colorFilterGR:ColorMatrixFilter;
		var colorFilterBR:ColorMatrixFilter;
		
		public function Colors() {
			matrixBW = new Array();
			matrixRGB = new Array();
			matrixGB = new Array();
			matrixB = new Array();
			matrixR = new Array();
			matrixG = new Array();
			matrixGR = new Array();
			matrixBR = new Array();
			
			filterBW();
			filterRGB();
			filterGB();
			filterB();
			filterR();
			filterG();
			filterGR();
			filterBR();
		}
		
		public function filterBW():void {
			matrixBW = matrixBW.concat([0.3, 0.3, 0.3, 0, 0]); // red
			matrixBW = matrixBW.concat([0.3, 0.3, 0.3, 0, 0]); // green
			matrixBW = matrixBW.concat([0.3, 0.3, 0.3, 0, 0]); // blue
			matrixBW = matrixBW.concat([0, 0, 0, 1, 0]); // alpha
			colorFilterBW = new ColorMatrixFilter(matrixBW);
		}

		public function filterRGB():void {
			matrixRGB = matrixRGB.concat([1, 0, 0, 0, 0]); // red
			matrixRGB = matrixRGB.concat([0, 1, 0, 0, 0]); // green
			matrixRGB = matrixRGB.concat([0, 0, 1, 0, 0]); // blue
			matrixRGB = matrixRGB.concat([0, 0, 0, 1, 0]); // alpha
			colorFilterRGB = new ColorMatrixFilter(matrixRGB);
			//return colorFilterRGB
		}
		
		public function filterGB():void {
			matrixGB = matrixGB.concat([0, 0, 0, 0, 0]); // red
			matrixGB = matrixGB.concat([0, 0.7, 0, 0, 0]); // green
			matrixGB = matrixGB.concat([0, 0, 1, 0, 0]); // blue
			matrixGB = matrixGB.concat([0, 0, 0, 1, 0]); // alpha
			colorFilterGB = new ColorMatrixFilter(matrixGB);
		}
		
		public function filterB():void {
			matrixB = matrixB.concat([0, 0, 0, 0, 0]); // red
			matrixB = matrixB.concat([0, 0, 0, 0, 0]); // green
			matrixB = matrixB.concat([0, 0, 1, 0, 0]); // blue
			matrixB = matrixB.concat([0, 0, 0, 1, 0]); // alpha
			colorFilterB = new ColorMatrixFilter(matrixB);
		}
		
		public function filterR():void {
			matrixR = matrixR.concat([1, 0, 0, 0, 0]); // red
			matrixR = matrixR.concat([0, 0, 0, 0, 0]); // green
			matrixR = matrixR.concat([0, 0, 0, 0, 0]); // blue
			matrixR = matrixR.concat([0, 0, 0, 1, 0]); // alpha
			colorFilterR = new ColorMatrixFilter(matrixR);
		}
		
		public function filterG():void {
			matrixG = matrixG.concat([0, 0, 0, 0, 0]); // red
			matrixG = matrixG.concat([0, 0.7, 0, 0, 0]); // green
			matrixG = matrixG.concat([0, 0, 0, 0, 0]); // blue
			matrixG = matrixG.concat([0, 0, 0, 1, 0]); // alpha
			colorFilterG = new ColorMatrixFilter(matrixG);
		}
		
		public function filterGR():void {
			matrixGR = matrixGR.concat([1, 0, 0, 0, 0]); // red
			matrixGR = matrixGR.concat([0, 0.7, 0, 0, 0]); // green
			matrixGR = matrixGR.concat([0, 0, 0, 0, 0]); // blue
			matrixGR = matrixGR.concat([0, 0, 0, 1, 0]); // alpha
			colorFilterGR = new ColorMatrixFilter(matrixGR);
		}
		
		public function filterBR():void {
			matrixBR = matrixBR.concat([1, 0, 0, 0, 0]); // red
			matrixBR = matrixBR.concat([0, 0, 0, 0, 0]); // green
			matrixBR = matrixBR.concat([0, 0, 1, 0, 0]); // blue
			matrixBR = matrixBR.concat([0, 0, 0, 1, 0]); // alpha
			colorFilterBR = new ColorMatrixFilter(matrixBR);
		}

	}
	
}

			
