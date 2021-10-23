package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Boyfriend extends Character
{
	public var stunned:Bool = false;

	public function new(x:Float, y:Float, ?char:String = 'bf')
	{
		super(x, y, char, true);
	}

	override function update(elapsed:Float)
	{
		if (!debugMode)
		{
			if (this.curCharacter != 'bf')
			{
				if (animation.curAnim.name.startsWith('sing'))
					{
						holdTimer += elapsed;
					}
		
					var dadVar:Float = 4;
		
					if (curCharacter == 'dad')
						dadVar = 6.1;
					if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
					{
						trace('dance');
						dance();
						holdTimer = 0;
					}
			}
			else
			{
				if (animation.curAnim.name.startsWith('sing'))
					{
						holdTimer += elapsed;
					}
					else
						holdTimer = 0;
		
					if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished && !debugMode)
					{
						playAnim('idle', true, false, 10);
					}
		
					if (animation.curAnim.name == 'firstDeath' && animation.curAnim.finished)
					{
						playAnim('deathLoop');
					}
			}
		}

		super.update(elapsed);
	}
}
