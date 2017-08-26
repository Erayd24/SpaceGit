/// @description Action
if(device_mouse_check_button(0, mb_left) && obj_GameState.gameEnd){
	if(instance_position(device_mouse_x(0), device_mouse_y(0), self)){
		if(buttonType == "restart"){
			with(obj_GameState){
				gameEnd = false;
				gameNumber++;
				endSetup = false;
				if(highScore < playerScore) highScore = playerScore;
				playerScore = 0;
				tier = 1;
				time = 0;
				
				if(instance_exists(obj_Enemy)) with obj_Enemy instance_destroy();
				instance_create(playerStartX, playerStartY, obj_Player);
			}
			instance_destroy();
		}
	}
}

if(buttonType == "restart"){
	x = room_width/2 - sprite_width/2;
	y = room_height/2 + sprite_height * 2;
}

setup = true;
