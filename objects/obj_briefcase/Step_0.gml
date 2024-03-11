var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

if (point_in_rectangle(mouseX, mouseY, closer_left, closer_top, closer_right, closer_bottom)){
	if (mouse_check_button_pressed(mb_left)) {
	    global.briefcase_open = !global.briefcase_open;
	}
}

if (point_in_rectangle(mouseX, mouseY, closer_left, closer_top, closer_right, closer_bottom)){
	if (clicked && mouse_check_button_released(mb_left)) {
		global.briefcase_open = false;
	    clicked = false;
	}
}