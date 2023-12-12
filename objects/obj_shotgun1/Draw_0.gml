draw_self();
draw_text(x-20,y-80, "Bullets: "+ string(Clip) );
if (reloading) {
	draw_text(x - 20, y - 100, "Reloading...");
}