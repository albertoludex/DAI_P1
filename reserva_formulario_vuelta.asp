<!-- #include file=conexion.asp -->
<!-- #include file=cambiar_menu.asp -->

<!DOCTYPE>
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

<li><a href="INDEX.asp">INICIO</a></li>
<li><a class="active" href="vuelos.asp">BUSCAR VUELOS</a></li>
<li><a  href="reservas.asp">RESERVAS</a></li>
<li><a href="aviones.asp">AVIONES</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a href="sesion.asp"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">

<div id="content">



<%

'FORMULARIO DE RESERVA DE  VUELTA

Set consulta = Conexion.Execute("select max(IDRESERVA) as ultimo_id from RESERVA")

siguiente = consulta("ultimo_id") + 1

id_vuelo=request.querystring("id")
destino=request.querystring("destino")
origen= request.querystring("origen")




%>

<form method="post" action="reserva_vuelta.asp">
<table>
<tr><b>VUELO DE VUELTA</b><br><br></tr>
<tr><td>ID RESERVA: </td><td><input type="text" readonly name="idreserva" value=<% response.write(siguiente) %>></td></tr>
<tr><td>Nombre: </td><td><input type="text" name="nombre" required></td></tr>
<tr><td>Apellidos: </td><td><input type="text" name="apellidos" required></td></tr>
<tr><td>DNI: </td><td><input type="text" name="dni" required></td></tr>
<tr><td>Asientos: </td><td><input type="number" name="asientos" min="1" required></td></tr>
<tr><td><input type="hidden" name="idvuelo" value=<% response.Write(id_vuelo) %> ></td></tr>

<tr><td colspan="2"><center><input type="submit" id="reservar" value="RESERVAR"/></center></td></tr>


</table>
</form>


<p class="nota">*Guarde el numero ID RESERVA para consultar las reservas</p>




</div>


</article>


<footer id="footer">

</footer>

</div>

</body>

</html>