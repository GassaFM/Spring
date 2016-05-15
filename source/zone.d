module zone;
import io;

import allegro5.allegro;

class Zone : Io
{
	ALLEGRO_COLOR fillColor;

	this (Io parent_, int relX_, int relY_, int w_, int h_,
	    ALLEGRO_COLOR fillColor_)
	{
		super (parent_, relX_, relY_, w_, h_);
		fillColor = fillColor_;
	}

	override void drawThisPre ()
	{
		al_clear_to_color (fillColor);
	}
}
