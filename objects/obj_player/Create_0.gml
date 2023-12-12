 /// @description Todas as Funcoes de movimento e colisoes do personagem principal
// You can write your code in this editor
v_speed=0;
h_speed=0;
move_speed=3;
Health=100;

PlayerStates = {
    idle: 0,
    walking: 1,
	walkingLeft:2
};
 
state = PlayerStates.idle;



function HorizontalMovement(h){
	if place_meeting(x+h,y,obj_block){
	while !place_meeting(x+sign(h),y,obj_block){
		x+=sign(h)
	}
	h = 0;
}
x+=h;
}

function VerticalMovement(v){
	if place_meeting(x,y+v,obj_block){
	while !place_meeting(x,y+sign(v),obj_block){
		y+=sign(v)
	}
	v = 0;
}
y+=v;
}

function debugCharacter(key){
	if keyboard_check(key){
		draw_text(x-20,y-100, "Position: "+ string(x) +", "+ string(y));
		draw_text(x-20,y-80, "Vspeed: "+ string(v_speed) +"  Hspeed: "+ string(h_speed));
	}
}

