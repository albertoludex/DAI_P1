<!-- #include file=conexion.asp -->
<!-- #include file=cambiar_menu.asp -->
<!DOCTYPE html>
<html>

<!-- FORMULARIO PARA CONSULTAR TODAS LAS RESERVAS DE UNA PERSONA, SOLO REQUIERE DNI -->

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
<li><a  href="companias.asp">COMPAÑIAS</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a  href="practica.html"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">


<div id="content">


<form method="post" action="reservas_todas.asp">

<table>
<tr><b>CONSULTAR RESERVAS</b><br><br></tr>
<tr><td>DNI: </td><td><input type="text" name="dni" required></td></tr>
<tr><td colspan="2"><center><input type="submit" id="buscar" value="Buscar"/></center></td></tr>


</table>


</form>


</div>




</article>


<footer id="footer">


</footer>

</div>

</body>

</html>