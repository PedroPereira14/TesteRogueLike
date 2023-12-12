//walk and jump logic 
moveLeftRight = -keyboard_check(vk_left)+keyboard_check(vk_right);
moveUpDown= -keyboard_check(vk_up)+keyboard_check(vk_down); 
h_speed = moveLeftRight*move_speed;
v_speed = moveUpDown*move_speed;
HorizontalMovement(h_speed);
VerticalMovement(v_speed);



if (h_speed > 0 || (v_speed != 0 && h_speed == 0)) {
    state = PlayerStates.walking;
}
else if (h_speed < 0 || (v_speed != 0 && h_speed == 0)){
    state = PlayerStates.walkingLeft;
}
else {
    state = PlayerStates.idle;
}


#region
	switch(state) {
		case PlayerStates.idle:
			sprite_index = spr_char;
			image_speed = 1;
		break;
		case PlayerStates.walking:
			sprite_index = spr_char_walking;
			image_speed = 1;
		break;
		case PlayerStates.walkingLeft:
			sprite_index = spr_char_walking_left;
			image_speed = 1;
	}
#endregion

if(Health <= 0){
	room_goto_next()
}