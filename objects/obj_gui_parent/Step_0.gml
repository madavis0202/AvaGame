
var _camera = view_camera[0];
var cx = camera_get_view_x(_camera);
var cy = camera_get_view_y(_camera);
var cw = camera_get_view_width(_camera);
var ch = camera_get_view_height(_camera);
 
var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);
		

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
    x = mouseX + drag_offset_x * image_xscale;
    y = mouseY + drag_offset_y * image_yscale;


    // Check if the left mouse button is released
    if (mouse_check_button_released(mb_left)) {
		//should you have to click to release?
		//if the object is within a certain area drop it and store that position. 
		//else (outside that area) return to the last stored position.
        // Stop dragging
		for(var i = 0; i < ds_list_size(global.guys); i++){
			var guy = ds_list_find_value(global.guys, i);
			show_debug_message(string(guy.x < sprite_width + x) + ", " + string(guy.x + guy.sprite_width > x))
			show_debug_message(string(guy.y < y + sprite_height) + ", " + string(guy.y + guy.sprite_height > y))
			if (guy.x < sprite_width + x - display_get_gui_width() / 2 && guy.x + guy.sprite_width > x - display_get_gui_width() / 2 && guy.y < y - display_get_gui_height() / 2 + sprite_height && guy.y + guy.sprite_height > y - display_get_gui_height() / 2) {
				show_debug_message("get that damn fish outta my face")
			}
			
		}
        is_dragging = false;
		
	 if (!point_in_rectangle(x, y, area_left, area_top, area_right, area_bottom)) {
        // Restore to the last valid position
        x = last_x_in_box;
        y = last_y_in_box;
     } 
    }
}

// Calculate the shrinking factor based on the object's vertical position relative to the rectangle
var vertical_position = y + (sprite_height / 2) - morpher_top;
var total_vertical_range = morpher_bottom - morpher_top;
var shrink_factor = 1 - (vertical_position / total_vertical_range);
shrink_factor = clamp(shrink_factor, 0, 1);

// Apply the shrinking effect
var current_size = lerp(initial_size, final_size, shrink_factor);

image_xscale = current_size / initial_size;
image_yscale = current_size / initial_size;

var target_x, target_y;

if (global.briefcase_open) {
    // Center the camera on the top half of the screen
    target_x = obj_main_character.x;
    target_y = obj_main_character.y - (view_hview[0] / 4);
} 

else {
    // Center the camera on the player
    target_x = obj_main_character.x;
    target_y = obj_main_character.y;
}

view_xview[0] = lerp(view_xview[0], target_x - view_wview[0] / 2, 0.1);
view_yview[0] = lerp(view_yview[0], target_y - view_hview[0] / 2, 0.1);

/* Things that might not work with parent system: last x in box