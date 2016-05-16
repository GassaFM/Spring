module draggable;
import io;
import spring;
import text_zone;

import std.algorithm;

import allegro5.allegro;
import allegro5.allegro_font;

class Draggable : TextZone
{
	this (Io parent_, int relX_, int relY_, int w_, int h_, int radius_,
	    ALLEGRO_COLOR fillColor_, ALLEGRO_COLOR textColor_,
	    ALLEGRO_FONT * textFont_, const (ALLEGRO_USTR) * centerText_)
	{
		super (parent_, relX_, relY_, w_, h_, radius_, fillColor_,
		textColor_, textFont_, centerText_);
	}

	override bool clickThis (int posX, int posY)
	{
		parent.child = parent.child.remove
		    (parent.child.countUntil (this));
		cursorRoot = this;
		return true;
	}
}
