module button;
import io;
import text_zone;

import allegro5.allegro;
import allegro5.allegro_font;

class Button : TextZone
{
	void delegate (int, int) onUnclick;

	this (Io parent_, int relX_, int relY_, int w_, int h_,
	    ALLEGRO_COLOR fillColor_, ALLEGRO_COLOR textColor_,
	    ALLEGRO_FONT * textFont_, const (ALLEGRO_USTR) * centerText_,
	    void delegate (int, int) onUnclick_)
	{
		super (parent_, relX_, relY_, w_, h_,
		    fillColor_, textColor_, textFont_, centerText_);
		onUnclick = onUnclick_;
	}

	override void drawThisPre ()
	{
		super.drawThisPre ();
	}

	override bool unclickThis (int posX, int posY)
	{
		onUnclick (posX, posY);
		return true;
	}
}
