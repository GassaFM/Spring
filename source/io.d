module io;

import allegro5.allegro;

/// Interface Object
class Io
{
	Io parent;
	Io [] child;
	int x;
	int y;
	int w;
	int h;

	final void draw (ALLEGRO_BITMAP * buffer)
	{
		ALLEGRO_BITMAP * curBuffer =
		    al_create_sub_bitmap (buffer, x, y, w, h);
		drawThisPre (curBuffer);
		foreach (c; child)
		{
			c.draw (curBuffer);
		}
		drawThisPost (curBuffer);
		al_destroy_bitmap (curBuffer);
	}

	void drawThisPre (ALLEGRO_BITMAP * buffer)
	{
	}

	void drawThisPost (ALLEGRO_BITMAP * buffer)
	{
	}
}
