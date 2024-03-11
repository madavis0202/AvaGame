var _camera = view_camera[0];
var cx = camera_get_view_x(_camera);
var cy = camera_get_view_y(_camera);
var cw = camera_get_view_width(_camera);
var ch = camera_get_view_height(_camera);
 
var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);
var x_vel = mouseX - x;
var y_vel = mouseY - y;


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
	
	x = x_vel + x + drag_offset_x * image_xscale;
    y = y_vel + y + drag_offset_y * image_yscale;



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