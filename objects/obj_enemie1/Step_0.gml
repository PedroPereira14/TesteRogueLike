 /// @description Insert description here
// You can write your code in this editor

var player_x = obj_player.x;
var player_y = obj_player.y;

EnemyDirection(player_x, player_y);

if (Health == 0){
	instance_destroy();
}