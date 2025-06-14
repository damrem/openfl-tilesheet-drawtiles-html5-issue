package;

import flash.geom.Point;
import flash.geom.Rectangle;
import openfl.Assets;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.display.Tilesheet;
import openfl.events.Event;
import openfl.Lib;

/**
 * ...
 * @author damrem
 */
class Main extends Sprite 
{
	var ts:openfl.display.Tilesheet;
	var sprite:openfl.display.Sprite;
	var pixelSize:Int = 1;
	var center:flash.geom.Point;

	public function new() 
	{
		trace("super()");
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		trace("ts");
		ts = new Tilesheet(Assets.getBitmapData("assets/img/tilesheet-test.gif"));
		trace("center");
		center = new Point(0, 0);
		trace("addTileRect");
		ts.addTileRect(new Rectangle(0, 0, 16, 16), center);
		ts.addTileRect(new Rectangle(16, 0, 16, 16), center);
		ts.addTileRect(new Rectangle(32, 0, 16, 16), center);
		
		//addEventListener(Event.ENTER_FRAME, step);
		trace("sprite");
		sprite = new Sprite();
		trace("scale");
		sprite.scaleX = sprite.scaleY = pixelSize;
		trace("addChild");
		addChild(sprite);
		
		trace("fps");
		addChild(new FPS(10, 10, 0x00ff00));
		trace("calling step");
		step();
	}
	
	private function step(e:Event=null):Void 
	{
		trace("step");
		trace("clear");
		sprite.graphics.clear();
		trace("wh");
		var w = Std.int(Lib.current.stage.stageWidth/16/pixelSize);
		var h = Std.int(Lib.current.stage.stageHeight / 16 / pixelSize);
		/*
		for (u in 0...w)
		{
			for (v in 0...h)
			{
				if (u == 0 || u == w-1 || v == 0 || v == h-1 || (u%2==0&&v%2==0))
				{
					
					//ts.drawTiles(sprite.graphics, [u*16+center.x, v*16+center.y, 0]);
					ts.drawTiles(sprite.graphics, [u*16+center.x, v*16+center.y, 2], false, Tilesheet.TILE_SCALE);
				}
				
			}
		}
		*/
		
		ts.drawTiles(sprite.graphics, [0, 0, 0]);//ok
		
		ts.drawTiles(sprite.graphics, [32, 0, 0, 0, 16, 16], false, Tilesheet.TILE_RECT);//ok*/

		ts.drawTiles(sprite.graphics, [64, 0, 0, 0.5], false, Tilesheet.TILE_ALPHA);//buggy, no alpha applied
		ts.drawTiles(sprite.graphics, [96, 0, 0, -0.5, 1, 0], false, Tilesheet.TILE_RGB);//buggy, no color tranform applied
		
		//ts.drawTiles(sprite.graphics, [48, 0, 0, 1], false, Tilesheet.TILE_SCALE);//buggy
		//ts.drawTiles(sprite.graphics, [72, 0, 0, 1,0,0,1], false, Tilesheet.TILE_TRANS_2x2);//buggy
		//ts.drawTiles(sprite.graphics, [144, 0, 0, 144 + 8, 0 + 8], false, Tilesheet.TILE_ORIGIN);//draw twice!
		//ts.drawTiles(sprite.graphics, [192, 0, 0, Math.PI / 4], false, Tilesheet.TILE_ROTATION);//buggy
		
		
		trace(sprite.getBounds(this));
	}

}
