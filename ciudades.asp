<!-- #include file=conexion.asp -->
<!-- #include file=sesion_requerido.asp -->
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

<li><a   href="INDEX.asp">INICIO</a></li>
<li><a  href="vuelos.asp">BUSCAR VUELOS</a></li>
<li><a  href="reservas.asp">RESERVAS</a></li>
<li><a  href="aviones.asp">AVIONES</a></li>
<li><a  class="active" href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a  href="sesion.asp"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">

<div id="content">


<%


Set consulta = Conexion.Execute("select max(IDCIUDAD) as ultimo_id from CIUDAD")

siguiente = consulta("ultimo_id") + 1


%>


<form name="formulario_2" action="http://localhost:8081/Prueba/ciudades.jsp" method="get">

<table>
<tr><td>ID Ciudad:</td><td><input type="text" name="idciudad" readonly value=<% response.write(siguiente) %> ></td></tr>

<tr><td>Ciudad:</td><td><input type="text" name="ciudad" required></td></tr>

<tr><td>Tasa:</td><td><input type="number" min="1" name="tasa" required></td></tr>

<tr><td></td><td><center><input type="submit" id="introducir" value="Introducir Ciudad"/></center></td></tr>



</table>

</form>






</table>




</div>



</article>


<footer id="footer">



</footer>

</div>

</body>

</html>