/// @description Movement
if(device_mouse_check_button(0, mb_left)){
    var Xspeed = playerSpeed;
    var Yspeed = playerSpeed;
    if(abs(device_mouse_x(0) - Xspeed) < 1) Xspeed = abs(device_mouse_x(0) - Xspeed);
    if(abs(device_mouse_y(0) - Yspeed) < 1) Xspeed = abs(device_mouse_y(0) - Yspeed);
    
    if(device_mouse_x(0) > x && x < room_width) x += Xspeed;
    if(device_mouse_x(0) < x && x > 0) x -= Xspeed;
    if(device_mouse_y(0) > y && y < room_height) y += Yspeed;
    if(device_mouse_y(0) < y && y > 0) y -= Yspeed;
}

