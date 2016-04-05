package;

import flash.geom.Point;
import flash.geom.Rectangle;
import openfl.Assets;
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

	public function new() 
	{
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		ts = new Tilesheet(Assets.getBitmapData("img/tilesheet-test.gif"));
		ts.addTileRect(new Rectangle(0, 0, 16, 16), new Point(8,8));
		ts.addTileRect(new Rectangle(16, 0, 16, 16), new Point(8,8));
		ts.addTileRect(new Rectangle(32, 0, 16, 16), new Point(8, 8));
		
		addEventListener(Event.ENTER_FRAME, step);
		
		sprite = new Sprite();
		sprite.scaleX = 2;
		sprite.scaleY = 2;
		addChild(sprite);
		
		
		
	}
	
	private function step(e:Event):Void 
	{
		//graphics.clear();
		for (i in 0...100)
		{
			ts.drawTiles(sprite.graphics, [Random.float(0, Lib.current.stage.stageWidth/2), Random.float(0, Lib.current.stage.stageHeight/2), Random.int(0, 2)]);
		}
	}

}
