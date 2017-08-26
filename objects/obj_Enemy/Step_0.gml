/// @description Movement
y+=mobSpeed;

///Destroy self
if(y > room_height + 50) instance_destroy();

///Colission with Player
if(instance_place(x, y, obj_Player)){
    with(obj_Player){
        instance_destroy();
    }
    obj_GameState.gameEnd = true;
}

