is_dragging = false;

drag_offset_x = 0;
drag_offset_y = 0;

x = display_get_gui_width() - 500;
y = display_get_gui_height() - 120;

initial_size = 64;
final_size = 16;

last_x_in_box = x;
last_y_in_box = y;

morpher_left = 0;
morpher_top = display_get_gui_height() / 2 + 60;
morpher_right = display_get_gui_width();
morpher_bottom = display_get_gui_height() / 2 + 90;


area_left = 0;
area_top = display_get_gui_height() / 2 + 90;
area_right = display_get_gui_width();
area_bottom = display_get_gui_height();