 /// @description Insert description here
// You can write your code in this editor
x += h_speed;
y += v_speed;

if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}
else if (place_meeting(x, y, obj_enemy_parent)) {
    var enemy = instance_place(x, y, obj_enemy_parent);
    if (enemy != noone) {
        GiveDamage(damage, enemy);
        instance_destroy();
    }
}
else if (place_meeting(x, y, obj_block)) {
    instance_destroy();
}

image_angle = point_direction(0, 0, h_speed, v_speed);




