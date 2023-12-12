/// @description Insert description here
// You can write your code in this editor
// obj_EnemyBase Create Event
v_speed = 0;
h_speed = 0;
move_speed = 0;
seek_radius = 0;
damage = 0;
isCoolingDown = false;
cooldownDuration = 0;
Health = 0;
BulletType = obj_bullet_test;

function HorizontalMovement(h) {
    if (!place_meeting(x + h, y, obj_block)) {
        x += h;
    }
}

function VerticalMovement(v) {
    if (!place_meeting(x, y + v, obj_block)) {
        y += v;
    }
}

function DistanceToPlayer(player_x, player_y) {
    return point_distance(x, y, player_x, player_y);
}

function GiveDamage(dmg, player) {
    if (!isCoolingDown) {
        player.Health -= dmg;
        isCoolingDown = true;
        cooldownDuration = 120; // Set your desired cooldown duration here
    }
}

function UpdateCooldown() {
    if (isCoolingDown) {
        cooldownDuration--;

        if (cooldownDuration <= 0) {
            isCoolingDown = false;
        }
    }
}

function EnemyDirection(player_x, player_y) {
    var distance = DistanceToPlayer(player_x, player_y);
    if (distance <= seek_radius) {
        // Implement behavior to follow the player
        var dir_x = sign(player_x - x);
        var dir_y = sign(player_y - y);

        h_speed = dir_x * move_speed / 2;
        v_speed = dir_y * move_speed / 2;
        if (place_meeting(x, y, obj_player)) {
            GiveDamage(damage, obj_player);
        }
        UpdateCooldown();
    } else if (place_meeting(x + h_speed, y, obj_block)) {
        // Reverse horizontal direction when colliding with a block
        h_speed = -h_speed;
    } else if (place_meeting(x, y + v_speed, obj_block)) {
        // Reverse vertical direction when colliding with a block
        v_speed = -v_speed;
    }
    HorizontalMovement(h_speed);
    VerticalMovement(v_speed);
}

function ShootPlayer(player_x, player_y){
		if (!isCoolingDown){
			var bullet = instance_create_depth(x, y, self.depth+1, BulletType);
			var bullet_speed = 10;
			var angle = point_direction(x, y, player_x, player_y);
			bullet.h_speed = lengthdir_x(bullet_speed, angle);
			bullet.v_speed = lengthdir_y(bullet_speed, angle);
			isCoolingDown = true;
			cooldownDuration = 120;
		}
		UpdateCooldown();
}




