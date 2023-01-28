<!DOCTYPE html>
<html>



<head>

<meta charset="UTF-8">

<link href="CSS/styles.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

<title>ViajesDAI</title>

<script src="JS/validar_sesion.js"></script>

</head>

<body>

<div id="general">

<header id="header">


<nav id="nav">

<ul>

<li><a  href="INDEX.asp">INICIO</a></li>
<li><a  href="vuelos.asp">BUSCAR VUELOS</a></li>
<li><a  href="reservas.asp">RESERVAS</a></li>
<li><a  href="aviones.asp">AVIONES</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a  class="active" href="sesion.asp">Iniciar Sesion</a></li>

</ul>

</nav>

</header>

<article id="article">

<div id="content">

<h1>INICIO DE SESION</h1>

<form action="sesion_comprobar.asp" method="post">

<table>

<tr><td>Usuario: </td><td><input type="text" name="user" id="user" required></td></tr>
<tr><td>Contraseña: </td><td><input type="password" name="pass" id="pass" required></td></tr>
<tr><td></td><td><center><input type="submit" name="iniciar_sesion" value="Iniciar sesion" onclick="validar()"></center></td></tr>



</table>

</form>

</div>

</article>


<footer id="footer">



</footer>

</div>

</body>

</html>