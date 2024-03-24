// sounds when you step on the grounds
var collision = instance_place(x, y, obj_floor_parent);
if (collision != noone) {
  if (event_data[? "event_type"] == "sprite event") {
    var message = event_data[? "message"];
    if (message == "lstep_1" || message == "lstep_1" ||
		message == "rstep_1" || message == "rstep_2" ||
		message == "ustep_1" || message == "ustep_1" ||
		message == "dstep_1" || message == "dstep_1") {
      switch (collision.object_index) {
        case obj_water_tile:
          show_debug_message("Broadcasting, Broadcasting. Over!");
        break;
      }
    }
  }
}
