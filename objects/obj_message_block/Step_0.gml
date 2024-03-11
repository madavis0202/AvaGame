//connects each instance of this to the object that spawns it,
//speaker is set by that object
x = speaker.x;
y = speaker.y;

if (place_meeting(x,y,obj_main_character)) && !instance_exists(obj_ui_message_options){
	with instance_create_depth(x,y,depth,obj_ui_message_options){
		talkbox = other.id
		inflicts_words = other.inflicts_words
		speaker = other.speaker.id
		//pass along speaker info here including the behaviours when buttons are pressed and directions
}
}