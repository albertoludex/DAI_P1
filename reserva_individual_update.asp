<!-- #include file=conexion.asp -->
<!-- #include file=cambiar_menu.asp -->
<!DOCTYPE html>
<html>



<head>

<meta charset="UTF-8">

<link href="CSS/styles.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

<title>ViajesDAI</title>

</head>

<body>

<div id="general">

<header id="header">



<nav id="nav">

<ul>

<li><a  href="INDEX.asp">INICIO</a></li>
<li><a  href="vuelos.asp">BUSCAR VUELOS</a></li>
<li><a  class="active" href="reservas.asp">RESERVAS</a></li>
<li><a  href="aviones.asp">AVIONES</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a  href="practica.html"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">


<div id="content">




<%

'ACTUALIZACION DE UNA RESERVA ESPECIFICA, SOLO SE CANCELA LA RESERVA

idreserva= request.form("idreserva")
dni=request.form("dni")



SentenciaSQL = "Update RESERVA set CANCELADO=1 where IDRESERVA = " & idreserva & " AND NIF='" & dni & "'"

Set rs = Conexion.Execute(SentenciaSQL)


on Error Resume Next
if Conexion.Errors.count>0 then

	for each objErr in Conexion.Errors
	
		response.write("<p>Error al Cancelar: " & objErr.Description & "</p>")
		
		next
		
	else
	
		response.Write("Su <b>RESERVA</b> ha sido <b>CANCELADA</b> con exito")
		
	end if
	

	Conexion.Close
	set conexion = nothing







%>

<b/>

<p><a href="INDEX.asp">Volver al index</a></p>

</div>




</article>


<footer id="footer">

</footer>

</div>

</body>

</html>