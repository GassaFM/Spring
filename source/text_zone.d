module text_zone;
import io;
import zone;

import allegro5.allegro;
import allegro5.allegro_font;

class TextZone : Zone
{
	ALLEGRO_COLOR textColor;
	ALLEGRO_FONT * textFont;
	const (ALLEGRO_USTR) * centerText;

	this (Io parent_, int relX_, int relY_, int w_, int h_,
	    ALLEGRO_COLOR fillColor_, ALLEGRO_COLOR textColor_,
	    ALLEGRO_FONT * textFont_, const (ALLEGRO_USTR) * centerText_)
	{
		super (parent_, relX_, relY_, w_, h_, fillColor_);
		textColor = textColor_;
		textFont = textFont_;
		centerText = centerText_;
	}

	override void drawThisPre ()
	{
		super.drawThisPre ();
		al_draw_ustr (textFont, textColor,
		    w * 0.5, (h - al_get_font_line_height (textFont)) * 0.5,
		    ALLEGRO_ALIGN_CENTER, centerText);
	}
}
