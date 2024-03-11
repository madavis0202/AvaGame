is_dragging = false;
ds_list_add(global.gui_items, self.id);

drag_offset_x = 0;
drag_offset_y = 0;

x = display_get_gui_width() - 300;
y = display_get_gui_height() - 80;

initial_size = 64;
final_size = 16;

last_x_in_box = x;
last_y_in_box = y;

morpher_left = 0;
morpher_top = display_get_gui_height() /// 2 + 60;
morpher_right = display_get_gui_width();
morpher_bottom = display_get_gui_height()// / 2 + 90;


area_left = 0;
area_top = display_get_gui_height() / 2 + 90;
area_right = display_get_gui_width();
area_bottom = display_get_gui_height();

x_vel = 0
y_vel = 0
function check_rect(x1, y1, w1, h1, x2, y2, w2, h2) {
    var rect1_left = x1;
    var rect1_right = x1 + w1;
    var rect1_top = y1;
    var rect1_bottom = y1 + h1;

    var rect2_left = x2;
    var rect2_right = x2 + w2;
    var rect2_top = y2;
    var rect2_bottom = y2 + h2;

    // Check for intersection
    if (rect1_left < rect2_right && rect1_right > rect2_left && rect1_top < rect2_bottom && rect1_bottom > rect2_top) {
        // Rectangles intersect
        return true;
    } else {
        // Rectangles do not intersect
        return false;
    }
}





