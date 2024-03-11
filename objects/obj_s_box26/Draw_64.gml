display_set_gui_maximise()

for (var i = 0; i < ds_list_size(global.gui_items); i++) {
    var item = ds_list_find_value(global.gui_items, i);
    if (item == self.id) {
        continue;
	}
	draw_set_color(c_red);
	draw_rectangle(item.x, item.y, item.x + item.sprite_width, item.y + item.sprite_height, 1);
}

draw_set_color(c_blue);
draw_rectangle(
				x_vel > 0 ? x + sprite_width : x,
				y,
				x_vel + x, // > 0 ? x_vel + sprite_width + x: x_vel + x,
				y + sprite_height,
				1);
draw_set_color(c_green);
draw_rectangle(x, y_vel > 0 ? y + sprite_height : y, x + sprite_width, y_vel > 0 ? y_vel + sprite_height + y: y_vel + y, 1);


if(global.briefcase_open == true){
	draw_self();
}






