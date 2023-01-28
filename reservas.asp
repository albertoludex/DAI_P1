<!-- #include file=cambiar_menu.asp -->
<!DOCTYPE html>
<html>

<!-- PAGINA PRINCIPAL DE RESERVAS, 2 OPCIONES, CONUSLTA CON DNI O DNI + IDRESERVA -->

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
<li><a  href="vuelos.asp">BUSCAR VUELOS</a></li>
<li><a  class="active" href="reservas.asp">RESERVAS</a></li>
<li><a  href="aviones.asp">AVIONES</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a href="sesion.asp"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">

<div id="content">




<table>


<tr><b>CONSULTA DE RESERVAS</b><br><br></tr>
<tr><td><button onclick="window.location.href='reservas_todas_formulario.asp'">TODAS LAS RESERVAS</button></td><td><button onclick="window.location.href='reservas_individual_formulario.asp'">RESERVAS INDIVIDUALES</button></td><td><button onclick="window.location.href='reserva_jsp_formulario.asp'">RESERVA JSP</button></td></tr>
<tr><td>(SOLO DNI)</td><td>(DNI + ID RESERVA)</td><td>(DNI+ORIGEN)</td></tr>   



</table>



</div>



</article>


<footer id="footer">



</footer>

</div>

</body>

</html>