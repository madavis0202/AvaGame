if(global.briefcase_open == true){
	draw_sprite_ext(spr_briefcase, 0, 0, display_get_gui_height() / 2 + 40, 2.9, 2.5, 0, c_white, 1)
	closer_left = 0;
	closer_top = display_get_gui_height() / 2 + 60;
	closer_right = display_get_gui_width();
	closer_bottom = display_get_gui_height() / 2 + 90;
}

else {
	draw_sprite_ext(spr_briefcase_closed, 0, 0, display_get_gui_height() / 2 + 150, 2.9, 2.5, 0, c_white, 1)
	closer_left = 0;
	closer_top = display_get_gui_height() / 2 + 208;
	closer_right = display_get_gui_width();
	closer_bottom = display_get_gui_height();
}


