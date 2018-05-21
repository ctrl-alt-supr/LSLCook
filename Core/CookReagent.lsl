//MATERIAP
//Este script debe ser ejecutado por todos los elementos que pueden formar parte de una receta.

//COSAS QUE SE PERMITE HACER CON LA MATERIA PRIMA ANTES DE ELABORARSE
//Indica si la materia prima puede ser desojada de algun tipo de piel o cubierta externa
integer CAN_BE_PEELED=FALSE;
//Indica si la materia prima puede ser cortada en rodajas
integer CAN_BE_SLICED=FALSE;
//Indica si la materia prima puede ser cortada en cubos
integer CAN_BE_DICED=FALSE;
//Indica si la materia prima puede ser cortada a mitades
integer CAN_CUT_IN_HALF=FALSE;
//Indica si la materia prima puede ser cortada a cuartos
integer CAN_CUT_IN_QUARTER=FALSE;

//COSAS QUE SE PERMITE HACER CON LA MATERIA PRIMA PARA ELABORARLA
//Indica si la materia prima puede ser picada
integer CAN_BE_MINCED=FALSE;
//Indica si la materia prima puede ser mezclada en una licuadora
integer CAN_BE_MIXED=FALSE;
//Indica si la materia prima puede ser frita
integer CAN_BE_FRIED=FALSE;
//Indica si la materia prima puede ser horneada
integer CAN_BE_BAKED=FALSE;
//Indica si la materia prima puede ser congelada
integer CAN_BE_FROZEN=FALSE;

//COSAS QUE SE PERMITE HACER CON LA MATERIA PRIMA PARA CONSUMIRLA
//Indica si la materia prima puede ser comida
integer CAN_BE_EATEN=FALSE;
//Indica si la materia prima puede ser bebida
integer CAN_BE_DRUNK=FALSE;

//Comunication protocol
string appSalt = "COCINANDOCONLOLES";
integer privateChannel = 0;
integer privateOwnerChannel = 0;
string TOUCHED_API_MSG = "TOUCHED_BY";

integer getPrivateChannelOwner(string salt){
    string setint = (string)((integer)("0x"+llGetSubString((string)llGetOwner(),-8,-1)) * llStringLength(salt) * llCeil(llLog(llStringLength(salt))));
    return (integer)llGetSubString(setint, 0, 7);
}
integer getPrivateChannelObject(string salt){
    string setint = (string)((integer)("0x"+llGetSubString((string)llGetKey(),-8,-1)) * llStringLength(salt) * llCeil(llLog(llStringLength(salt))));
    return (integer)llGetSubString(setint, 0, 7);
}

default
{
    state_entry()
    {
       privateChannel=getPrivateChannelObject(appSalt);
       privateOwnerChannel=getPrivateChannelOwner(appSalt);

    }
    touch_start(integer num_detected)
    {
        integer i;
        for (i = 0; i < num_detected; i++)
        {
            key avatar = llDetectedKey(i);
            llSay(privateOwnerChannel, TOUCHED_API_MSG+"|"+(string)avatar);
            llOwnerSay(privateOwnerChannel+" -> "+TOUCHED_API_MSG+"|"+(string)avatar);
        }
    }
}
