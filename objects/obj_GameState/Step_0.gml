/// @description Create Enemies
if(!gameEnd){
	time++;

	if(time % 180 == 0 || time % 120 == 0 && tier > 2 || time % 60 == 0 && tier > 5){
	    with(instance_create(random_range(0, room_width), -50, obj_Enemy)){
	        mobSpeed = random_range(0.4, 1.5 + obj_GameState.tier);
	        image_xscale = random_range(1, 2.3);
	        image_yscale = image_xscale;
	        colNum = irandom_range(0, 360);
	    }
	}

	if(time % 200 <= tier){
	    with(instance_create(random_range(0, room_width), -50, obj_Enemy)){
	        mobSpeed = random_range(0.5, 1.5 * obj_GameState.tier);
	        image_xscale = 1 + irandom(3);
	        image_yscale = image_xscale;
	        colNum = 0.5 + irandom_range(1, 359);
	    }
	}

	if(time % 1200 == 1199 && tier < 99) tier++;

	playerScore++;
}

if(gameEnd && !endSetup){
	with(instance_create(room_width/2, room_height/2, obj_Button)){
		buttonType = "restart";
		image_xscale = 1.08;
		image_yscale = 0.5;
	}
	endSetup = true;
}

///View Update
wwindow = window_get_width();
hwindow = window_get_height();
//show_debug_message("view: " + string(view_wview) + " port: " + string(view_wport) +  " window: " + string(window_get_width()));

if(window_has_focus()){
    if(wwindow != owwindow || hwindow != ohwindow){
        if(wwindow == display_get_width() && hwindow > display_get_height() - 100){
            window_set_fullscreen(true);
        }
        var port_ar = __view_get( e__VW.WPort, 0 ) / __view_get( e__VW.HPort, 0 );
        var window_ar = wwindow / hwindow;
        if(port_ar < window_ar){ //horizontal
            while(window_ar != port_ar){
                window_set_size(window_get_width() - 1, hwindow);
                window_ar = window_get_width() / hwindow;
                if(window_ar < port_ar + 1) break;
            }
        } else { //vertical
            while(window_ar != port_ar){
                window_set_size(wwindow, window_get_height() - 1);
                window_ar = wwindow / window_get_height();
                if(window_ar < port_ar + 1) break;
            }
        }
        
        display_set_gui_size(__view_get( e__VW.WPort, 0 ), __view_get( e__VW.HPort, 0 ));
        surface_resize(application_surface, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ))
        owwindow = window_get_width();
        ohwindow = window_get_height();
        
        show_debug_message("Window height: " + string(window_get_height()) + " Window width: " + string(window_get_width()));
    }
}

