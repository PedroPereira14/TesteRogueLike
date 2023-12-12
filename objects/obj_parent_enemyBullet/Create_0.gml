/// @description Insert description here
// You can write your code in this editor
damage = 0;

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

function GiveDamageToPlayer(dmg, player) {
        player.Health -= dmg;
}




