/// @description Variables
randomize();

time = 0;
playerScore = 0;
highScore = 0;
gameEnd = false;
gameNumber = 1;
gameState = "play";
playerDeadMess = "You Died";
endSetup = false;

backAlpha = 0.2;

playerStartX = room_width/2;
playerStartY = room_height/2;

back = surface_create(room_width, room_height);
gamePlay = surface_create(room_width, room_height);

tier = 1;




///View
wwindow = 1024;
hwindow = 768;
owwindow = wwindow;
ohwindow = hwindow;

__view_set( e__VW.WPort, 0, wwindow );
__view_set( e__VW.HPort, 0, hwindow );

var width = display_get_width();
var height = display_get_height();
var display_ar = width / height;
var port_ar = wwindow / hwindow;

while(port_ar < display_ar){ //width
    width--;
    display_ar = width/height;
    if(display_ar < port_ar + 1) break;
}
while(port_ar > display_ar){ //height
    height--;
    display_ar = width/height;
    if(display_ar < port_ar + 1) break;
}

window_set_max_width(width);
window_set_max_height(height);

