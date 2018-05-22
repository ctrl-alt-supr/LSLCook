//Devuelve un canal privado en base a una clave y un texto arbitrario. Todas las llamadas a esta función para una misma key y texto devolverán el mismo canal.
integer getPrivateChannel(key id, string salt){
    string setint = (string)((integer)("0x"+llGetSubString((string)id,-8,-1)) * llStringLength(salt) * llCeil(llLog(llStringLength(salt))));
    return (integer)llGetSubString(setint, 0, 7);
}