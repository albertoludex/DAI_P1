function validar() {
  var usuario = document.getElementById("user").value;
  var contrasena = document.getElementById("pass").value;
  


if(usuario=="SYSDBA" && contrasena =="masterkey"){
	

	
}
else  { 
alert("El nombre de usuario o la contraseña no son correctas. (usuario: SYSDBA contrasena: masterkey)");

}

}