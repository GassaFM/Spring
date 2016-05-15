module text_zone;
import io;
import zone;

import allegro5.allegro;

class TextZone : Zone
{
	ALLEGRO_COLOR textColor;
	ALLEGRO_USTR centerText;

	this (Io parent_, int relX_, int relY_, int w_, int h_,
	    ALLEGRO_COLOR fillColor_, ALLEGRO_COLOR textColor_,
	    ALLEGRO_USTR centerText_)
	{
		super (parent_, relX_, relY_, w_, h_, fillColor);
		textColor = textColor_;
		centerText = centerText_;
	}

	override void drawThisPre ()
	{
		super.drawThisPre ();
	}
}
