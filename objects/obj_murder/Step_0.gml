// obj_fish Step Event
if (follow != -1) {
    // Check if the followed object still exists in the scene
    if (!instance_exists(follow)) {
        // The followed object is no longer in the scene, so destroy this object
        instance_destroy();
    } else {
        // Update the position based on the followed object's position and offsets
        x = follow.x + offset_x
        y = follow.y + offset_y
    }
}








