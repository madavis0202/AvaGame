d_key = keyboard_check(ord("D"));
a_key = keyboard_check(ord("A"));
w_key = keyboard_check(ord("W"));
s_key = keyboard_check(ord("S"));

xspeed = (d_key - a_key) * move_speed;
yspeed = (s_key - w_key) * move_speed;

if (xspeed != 0 && yspeed != 0) {
    xspeed *= 0.8; // Reduce horizontal speed by 40%
    yspeed *= 0.8; // Reduce vertical speed by 40%
}

if xspeed == 0 && yspeed == 0 
{
    image_index = 0;
}

// Depth
depth = -bbox_bottom;

// Set sprite
if global.briefcase_open == true
{
	xspeed = 0;
	yspeed = 0;
    sprite_index = sprite[PAUSE];
	image_index += .001
	face = DOWN;
}
else
{
    mask_index = sprite[DOWN];
    if yspeed == 0 {
        if xspeed > 0 {face = RIGHT};
        if xspeed < 0 {face = LEFT};
    }

    if xspeed > 0 && face == LEFT{ face = RIGHT}
    if xspeed < 0 && face == RIGHT{ face = LEFT}

    if xspeed == 0 {
        if yspeed > 0 {face = DOWN};
        if yspeed < 0 {face = UP};
    }

    sprite_index = sprite[face];
}

// This is collisions
if place_meeting(x + xspeed, y, obj_wall)
{
    xspeed = 0;
}

if place_meeting(x, y + yspeed, obj_wall)
{
    yspeed = 0;
}

x += xspeed;
y += yspeed;


if yspeed > 0 && face == UP{ face = DOWN}
if xspeed < 0 && face == DOWN{ face = UP}