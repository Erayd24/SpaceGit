/// @description Draw Game
//Background
if(!surface_exists(back)) back = surface_create(room_width, room_height);
draw_set_colour(c_black);
surface_set_target(back);
shader_set(shd_Back);
draw_rectangle(0, 0, room_width, room_height, false);
shader_reset();
surface_reset_target();

//Enemies and Player
if(!surface_exists(gamePlay)) gamePlay = surface_create(room_width, room_height);
surface_set_target(gamePlay);
draw_clear_alpha(c_white, 0);
if(instance_exists(obj_Player)){
    with(obj_Player) {
        if(device_mouse_check_button(0, mb_left)){
            var angle = point_direction(x, y, device_mouse_x(0), device_mouse_y(0));
            var adif = angle_difference(image_angle, angle);
            image_angle += min(abs(adif), rotSpeed)*sign(adif);
        }
        draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle + 90, c_white, 1);
    } 
}
if(instance_exists(obj_Enemy)){
    shader_set(shd_Enemy);
    with(obj_Enemy){
	    shader_set_uniform_f(shader_get_uniform(shd_Enemy, "colNum"), colNum);
	    draw_self();
	}
    shader_reset();
}
surface_reset_target();

//Draw Background and Gameplay Surfaces
draw_surface(back, 0, 0);
draw_surface(gamePlay, 0, 0);

//Draw Messages
//Score
draw_set_colour(c_black);
draw_set_font(fnt_Basic);
draw_set_alpha(backAlpha);
draw_roundrect(5, 5, 5 + string_width("S") * 12, string_height("S") * 2 - 5, false);
if(gameNumber > 1) draw_roundrect(5, room_height - string_height("H") - 10, 10 + string_width("High Score:  " + string(highScore)), room_height - 5, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(10, 5, "Score: " + string(playerScore));
draw_text(10, 65, "Tier: " + string(tier));
if(gameNumber > 1) draw_text(10, room_height - string_height("H") - 5, "High Score: " + string(highScore));

//Dead Message
if(gameEnd){
    draw_set_color(c_black);
    draw_set_alpha(backAlpha);
    draw_roundrect(room_width/2 - (string_width(playerDeadMess + " ")/2), room_height/2, room_width/2 + (string_width(playerDeadMess + " ")/2), room_height/2 + string_height("Y"), false);
    draw_set_alpha(1);
    draw_set_colour(c_red);
    draw_text(room_width/2 - (string_width(playerDeadMess)/2), room_height/2, playerDeadMess);
}

//Restart Button
if(instance_exists(obj_Button)){
    with(obj_Button){
		if(setup){
	        draw_set_alpha(obj_GameState.backAlpha);
			draw_set_color(c_black);
			draw_roundrect(x, y, x + sprite_width, y + sprite_height, false);
			draw_set_alpha(1);
			draw_set_color(c_white);
			draw_set_font(fnt_Basic);
			if(buttonType == "restart") draw_text(x + 1, y + 1, restartMessage);
		}
    }
}

