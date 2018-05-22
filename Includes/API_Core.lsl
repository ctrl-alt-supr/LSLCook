//Si no se han cargado los enumerados de los documentos externos, se cargan
#ifndef API_ENUMS
    #define API_ENUMS
    #include "API_Actions.lsl"
    #include "API_Families.lsl"
#endif
#ifndef API_SHARED
    #define API_SHARED
    #include "API_Shared.lsl"
#endif
#define APP_IDENTIFIER "cocinandoconloles"

default
{
    state_entry()
    {
        llOwnerSay("el identificador es " + APP_IDENTIFIER);
        llOwnerSay("ENM_FAMILY_FRUITS es " + (string)ENM_FAMILY_FRUITS);
        llOwnerSay("ENM_ACTION_FRY es " + (string)ENM_ACTION_FRY);
        llOwnerSay("Canal privado para ti es "+(string)getPrivateChannel(llGetOwner(), APP_IDENTIFIER));
        llOwnerSay("Canal privado para mi es "+(string)getPrivateChannel(llGetKey(), APP_IDENTIFIER));
    }
}
