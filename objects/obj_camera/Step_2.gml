#macro view view_camera[0]
camera_set_view_size(view, view_width, view_height);
var cam_target;

if(global.briefcase_open == true){
	cam_target = obj_camera_magnet;
}

else{
	cam_target = obj_main_character;
}

if(instance_exists(cam_target)){
	var cam_x = clamp(cam_target.x - view_width / 2, 0, room_width - view_width);
	var cam_y = clamp(cam_target.y - view_height / 2, 0, room_height - view_height);
	
	var current_x = camera_get_view_x(view);
	var current_y = camera_get_view_y(view);
	var spd = .1;
	camera_set_view_pos(view, lerp(current_x, cam_x, spd), lerp(current_y, cam_y, spd))		
}






