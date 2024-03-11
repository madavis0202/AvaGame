//Counts down after the player goes away from an enemy and deletes at the end
if (place_meeting(x,y,obj_message_block)){
      timer = timer_max 
  }
else{
  if (timer <= 0){
    instance_destroy();
  }
  else
    timer--
}


//Creates message UI
var i, ch, word, object_type;


for (i = 1; i < 5; i++) {
    // this "inflicts_words" variable is defined on the object
    // that the user collides with, that knows it's words;
    // it'll have a code like "fms " -- if it supports those words
    ch = string_char_at(inflicts_words, i);  // GML string indices start at 1
	word = undefined;
	object_type = undefined;
	if (global.word_murder == true){
	}
    if (ch == "f" && !instance_exists(obj_fish) && global.word_fish == true){
        word = FISH;
		object_type = obj_fish;
    } else if (ch == "m" && !instance_exists(obj_murder) && global.word_murder == true){
        word = MURDER;
		object_type = obj_murder;
    } else if (ch == "s" && !instance_exists(obj_sexy) && global.word_sexy == true){
        word = SEXY;
		object_type = obj_sexy;
    } else if (ch == "h" && !instance_exists(obj_hey) && global.word_hey == true){
        word = HEY;
		object_type = obj_hey;
    } else if (ch == "S" && !instance_exists(obj_sky) && global.word_sky == true){
        word = SKY;
		object_type = obj_sky;
    }
	    // If word is defined, create the instance and update offsets
    if (word != undefined && object_type != undefined) {
        with (instance_create_depth(other.x, other.y, depth-1, object_type)){
		follow = other.id
        if (i == 1) {
			//North
            offset_y = +10
			offset_x = 0
        } else if (i == 2) {
			//East
			offset_y = 0
            offset_x = +10;
        } else if (i == 3) {
			//South
            offset_y = -10;
			offset_x = 0;
        } else if (i == 4) {
			//West
			offset_y = 0;
            offset_x = -10;

		}
    }
	}
}

//

//Selecting
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

//Changed sprite based on input
if (right_key && !left_key && !up_key && !down_key){
	sprite_index = message_right
	speaker.right_option_pressed = true;
}
else if (!right_key && left_key && !up_key && !down_key){
	sprite_index = message_left
	speaker.left_option_pressed = true;
}
else if (!right_key && !left_key && up_key && !down_key){
	sprite_index = message_up
	speaker.up_option_pressed = true;
}
else if (!right_key && !left_key && !up_key && down_key){
	sprite_index = message_down
	speaker.down_option_pressed = true;
}
if (right_key || left_key || up_key || down_key){
//Should make the button do destroy animation after use
}






