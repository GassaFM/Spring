module io;

import allegro5.allegro;

/// Interface Object
class Io
{
	Io parent;
	Io [] child;
	int relX;
	int relY;
	int w;
	int h;

	final void draw (ALLEGRO_BITMAP * buffer)
	{
		ALLEGRO_BITMAP * curBuffer =
		    al_create_sub_bitmap (buffer, relX, relY, w, h);
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

	final bool coordPostOrder (alias fun) (int posX, int posY)
	{
		posX -= relX;
		posY -= relY;
		if (posX < 0 || w <= posX || posY < 0 || h <= posY)
		{
			return false;
		}
		foreach (c; child)
		{
			if (c.coordPostOrder !(fun) (posX, posY))
			{
				return true;
			}
		}
		return fun (posX, posY);
	}

	final bool click (int posX, int posY)
	{
		return coordPostOrder !(clickThis) (posX, posY);
	}

	bool clickThis (int posX, int posY)
	{
		return false;
	}

	final bool unclick (int posX, int posY)
	{
		return coordPostOrder !(unclickThis) (posX, posY);
	}

	bool unclickThis (int posX, int posY)
	{
		return false;
	}
}
