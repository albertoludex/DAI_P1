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

<form method="post" action="reserva_individual_update.asp">

<table cellspacing="10">

<tr><b>RESERVA</b><br><br></tr>
<tr><td><b>ID RESERVA</b></td><td><b>FECHA</b></td><td><b>ORIGEN</b></td><td><b>DESTINO</b></td><td><b>CANCELADO</b></td><td><b>COMPAÑIA</b></td><td><b>NIF</b></td></tr>



<%


'MUESTRA UNA RESERVA ESPECIFICA


idreserva= request.querystring("id")



Set resultado = Conexion.Execute("SELECT * FROM LISTADO_RESERVAS WHERE IDRESERVA=" & idreserva)


dni= resultado("NIF")
idreserva= resultado("IDRESERVA")


do while not resultado.EOF

If resultado("CANCELADO")=0 then

cancelado="NO"

else

cancelado="SI"

End If

Response.Write("<tr><td><center>" & resultado("IDRESERVA") & "</center></td><td>" & resultado("FECHA_VUELO") & "</td><td>" & resultado("CIUDAD_ORIGEN") & "</td><td>" & resultado("CIUDAD_DESTINO") & " </td><td>" & cancelado & " </td><td>" & resultado("COMPANIA") & " </td><td>" & resultado("NIF") & " </td></tr>")

	resultado.MoveNext

loop




%>

<input type="hidden" name="dni" value=<% Response.Write(dni) %> >
<input type="hidden" name="idreserva" value=<% Response.Write(idreserva) %> >


</table>



<input type="submit" name="modificar" value="CANCELAR VUELO">

</form>

<b/>



<!-- BOTON PARA VOLVER ATRAS, ENVIAMOS EL DNI PARA QUE APARZCA LA MISMA CONSULTA -->

<form action="reservas_todas.asp" method="post">

<input type="hidden" name="dni" value="<%response.write(dni)%>">

<input id="atras" type="submit" name="volver atras" value="Volver atras">

</form>

</div>




</article>


<footer id="footer">


</footer>

</div>

</body>

</html>