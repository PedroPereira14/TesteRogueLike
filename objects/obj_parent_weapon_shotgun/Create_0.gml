/// @description Data from weapons
// 
Clip = 0;
MaxClip = Clip;
fireRate = 15;
reloadTimer = 0;
reloading = false;
BulletType = obj_bullet_test;
MinReloadTime = 0;
MaxReloadTime = 0;
Spread = 10;
function followTarget (target) {
	if target != noone {
	    var distance_to_target = distance_to_object(target);

	    if (distance_to_target > 3) {
	        move_towards_point(target.x, target.y, speed_of);
	    } else {
	        speed = 0;
	    }
	}
}

function reload(reloadKey) {
    if (reloading) {
        reloadTimer--;
        if (reloadTimer <= 0) {
            reloading = false;
            Clip = MaxClip;
        }
    } else if (keyboard_check_pressed(reloadKey) && Clip == 0) {
        reloading = true;
        reloadTimer = MinReloadTime;
    }else if (keyboard_check_pressed(reloadKey) && Clip < MaxClip) {
        reloading = true;
        reloadTimer = MaxReloadTime;
    }
}


function shoot(mouse_x, mouse_y, shootButton) {
    if (mouse_check_button_pressed(shootButton) && Clip > 0) {
		var bullet_speed = 8;
		var spread_angle = Spread;
		var fire_rate = fireRate;
		var angle = point_direction(x, y, mouse_x, mouse_y);
		for (var i = -1; i <= 1; i++) {
		    var bullet = instance_create_depth(x, y, self.depth + 1, BulletType);
		    var adjusted_angle = angle + i * spread_angle;
		    bullet.h_speed = lengthdir_x(bullet_speed, adjusted_angle);
		    bullet.v_speed = lengthdir_y(bullet_speed, adjusted_angle);
		}
		Clip--;
    }else if (Clip == 0){
		reload(shootButton);
	}
}




