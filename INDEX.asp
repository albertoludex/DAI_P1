<!-- #include file=cambiar_menu.asp -->
<!DOCTYPE html>
<html>


<head>

<meta charset="UTF-8">

<link href="CSS/styles.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

<title>ViajesDai</title>

</head>

<body>

<div id="general">

<header id="header">




<nav id="nav">

<ul>

<li><a  class="active" href="INDEX.asp">INICIO</a></li>
<li><a  href="vuelos.asp">BUSCAR VUELOS</a></li>
<li><a  href="reservas.asp">RESERVAS</a></li>
<li><a  href="aviones.asp">AVIONES</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a  href="sesion.asp"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">

<div id="content">



<h1>viajesDAI</h1>

<p>"Los mejores vuelos"</p>



</div>



</article>


<footer id="footer">





</footer>

</div>

</body>

</html>