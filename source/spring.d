module main;

import core.stdc.stdlib;
import std.exception;
import std.stdio;
import std.string;

pragma (lib, "dallegro5");
pragma (lib, "allegro");
pragma (lib, "allegro_font");
pragma (lib, "allegro_image");
pragma (lib, "allegro_primitives");
pragma (lib, "allegro_ttf");

import allegro5.allegro;
import allegro5.allegro_font;
import allegro5.allegro_image;
import allegro5.allegro_primitives;
import allegro5.allegro_ttf;

immutable int MAX_X = 800;
immutable int MAX_Y = 600;

ALLEGRO_DISPLAY * display;
ALLEGRO_EVENT_QUEUE * eventQueue;
ALLEGRO_TIMER * drawTimer;

void init ()
{
	enforce (al_init ());
	enforce (al_init_font_addon ());
	enforce (al_init_image_addon ());
	enforce (al_init_primitives_addon ());
	enforce (al_init_ttf_addon ());
	enforce (al_install_keyboard ());
	enforce (al_install_mouse ());

	display = al_create_display (MAX_X, MAX_Y);
	enforce (display);

	drawTimer = al_create_timer (1.0 / 2.0);

	eventQueue = al_create_event_queue ();
	enforce (eventQueue);

	al_register_event_source (eventQueue, al_get_keyboard_event_source ());
	al_register_event_source (eventQueue, al_get_mouse_event_source ());
	al_register_event_source (eventQueue, al_get_timer_event_source (drawTimer));
	al_register_event_source (eventQueue, al_get_display_event_source (display));
}

void draw ()
{
	al_clear_to_color (al_map_rgb_f (0.5, 0.4, 0.3));
	writeln ("?");
	al_flip_display ();
}

void mainLoop ()
{
	draw ();

	bool isFinished = false;
	while (!isFinished)
	{
		ALLEGRO_EVENT currentEvent;
		al_wait_for_event (eventQueue, &currentEvent);

		switch (currentEvent.type)
		{
			case ALLEGRO_EVENT_DISPLAY_CLOSE:
				isFinished = true;
				break;

			case ALLEGRO_EVENT_MOUSE_BUTTON_UP:
				auto x = currentEvent.mouse.x;
				auto y = currentEvent.mouse.y;
				break;

			case ALLEGRO_EVENT_TIMER:
				draw ();
				break;

			default:
				break;
		}
	}
}

void happyEnd ()
{
	al_destroy_display (display);
	al_destroy_timer (drawTimer);
	al_destroy_event_queue (eventQueue);

	al_shutdown_font_addon ();
	al_shutdown_image_addon ();
	al_shutdown_primitives_addon ();
	al_shutdown_ttf_addon ();

	exit (EXIT_SUCCESS);
}

int main (string [] args)
{
	return al_run_allegro (
	{
		init ();
		mainLoop ();
		happyEnd ();
		return 0;
	});
}
