/// @description Insert description here
// You can write your code in this editor
draw_set_font(ft_mainMenu);

margin = 60;
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

var x1 = gui_width / 2;
var y1 = gui_height / 2;

for (var i = 0; i < op_max; i++) {
    draw_set_halign(fa_middle);
    draw_set_valign(fa_middle);
    
    // Calculate the position of each option
    var option_y = y1 + (margin * (i - (op_max - 1) / 2)); // Adjust the y-position
    
    // Calculate the width and height of the text
    var text_width = string_width(options[i]);
    var text_height = string_height(options[i]);
    
    if (mouse_x > x1 - text_width / 2 && 
        mouse_x < x1 + text_width / 2 &&
        mouse_y > option_y - text_height / 2 && 
        mouse_y < option_y + text_height / 2) {
        draw_set_color(c_yellow);
        
        // Check if mouse button is pressed
        if (mouse_check_button_pressed(mb_left)) {
            // Execute corresponding action
            if (i == 0) {
                room_goto_next();
            } else if (i == 1) {
                // Implement action for option 1
            } else if (i == 2) {
                // Implement action for option 2
            } else if (i == 3) {
                game_end();
            }
        }
    } else {
        draw_set_color(c_white);
    }
    
    draw_text(x1, option_y, options[i]);
    draw_set_color(c_white); // Reset color to white
}

draw_set_font(-1);
