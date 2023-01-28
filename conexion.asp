
<%


'Establece la Conexion con la Base de datos

on Error Resume Next 
Set Conexion = Server.CreateObject("ADODB.Connection")
Conexion.ConnectionString = "Data Source=agencia; USER=SYSDBA; PASSWORD=masterkey"
Conexion.Mode = 1
Conexion.Open



if Err.Description <> "" then
	response.write("<b>Error</b>: " & Err.Description & "<br>")
else
'	response.write("Conexion realizada con exito.")
	end if


'Conexion.ClOse
'Set Conexion = nothing

'response.write("Se ha cerrado la conexion")


%>