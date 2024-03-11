var _camera = view_camera[0];
var cx = camera_get_view_x(_camera);
var cy = camera_get_view_y(_camera);
var cw = camera_get_view_width(_camera);
var ch = camera_get_view_height(_camera);
 
var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

x_vel = mouseX - x + drag_offset_x * image_xscale;
y_vel = mouseY - y + drag_offset_y * image_yscale;

if (!is_dragging) {
    if (point_in_rectangle(mouseX, mouseY, x, y, x + sprite_width, y + sprite_height)) {
        if (mouse_check_button_pressed(mb_left)) {
            is_dragging = true;
			drag_offset_x = x - mouseX;
            drag_offset_y = y - mouseY;
			last_x_in_box = x;
			last_y_in_box = y;
        }
    }
}
else {
// Drag the object based on the mouse movement
    dx = x_vel + x;
    dy = y_vel + y;

    for (var i = 0; i < ds_list_size(global.gui_items); i++){
        var item = ds_list_find_value(global.gui_items, i);
        if (item == self.id) {
            continue;
        }
        if (
			check_rect(
            item.x,
            item.y,
            item.sprite_width,
            item.sprite_height,
            x_vel > 0 ? x + sprite_width : x,
            y,
            x_vel, // > 0 ? x_vel + sprite_width: x_vel,
            sprite_height
			)
			&& x_vel != 0
			)
			{
                dx = x_vel > 0 ? item.x - sprite_width : item.x + item.sprite_width;			
				show_debug_message(string(x_vel) + ", x_vel")
        }
        if (check_rect(
            item.x,
            item.y,
            item.sprite_width,
            item.sprite_height,
            x,
            y_vel > 0 ? y + sprite_height : y,
            sprite_width,
            y_vel > 0 ? y_vel + sprite_height : y_vel
            )){
                dy = y_vel > 0 ? item.y : item.y + item.sprite_height;
				show_debug_message(string(y_vel) + ", y_vel")

        }
    }
    x = dx;
    y = dy;

    if (mouse_check_button_released(mb_left)) {
        is_dragging = false;
		
		 if (!point_in_rectangle(x, y, area_left, area_top, area_right, area_bottom)) {
			 x = last_x_in_box;
			 y = last_y_in_box;
    } 
    }
}

// Calculate the shrinking factor based on the object's vertical position relative to the rectangle
var vertical_position = y - morpher_top;
var total_vertical_range = morpher_bottom - morpher_top;
var shrink_factor = 1 - (vertical_position / total_vertical_range);
shrink_factor = clamp(shrink_factor, 0, 1);

// Apply the shrinking effect
var current_size = lerp(initial_size, final_size, shrink_factor);

image_xscale = current_size / initial_size;
image_yscale = current_size / initial_size;