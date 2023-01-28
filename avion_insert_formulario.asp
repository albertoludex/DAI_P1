<!-- #include file=conexion.asp -->
<!-- #include file=sesion_requerido.asp -->
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
<li><a href="vuelos.asp">BUSCAR VUELOS</a></li>
<li><a  href="reservas.asp">RESERVAS</a></li>
<li><a class="active" href="aviones.asp">AVIONES</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a  href="sesion.asp"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">

<div id="content">


<%

'FORMULARIO PARA INTRODUCIR UN AVION, SE CALCULA AUTOMATICAMNETE EL ID DEL AVION

Set consulta = Conexion.Execute("select max(IDAVION) as ultimo_id from AVION")

siguiente = consulta("ultimo_id") + 1


%>


<form name="formulario_2" action="avion_insert.asp" method="post">

<table>

<tr><b>INTRODUCIR avion</b><br><br></tr>

<tr><td>ID Avion:</td><td><input type="text" name="idcompania" readonly value=<% response.write(siguiente) %> ></td></tr>

<tr><td>Nombre:</td><td><input type="text" name="nombre" required></td></tr>
<tr><td>Plazas:</td><td><input type="text" name="plazas" required></td></tr>
<tr><td>Precio Base:</td><td><input type="text" name="precio" required></td></tr>


<tr><td colspan="2"><center><input type="submit" id="introducir" value="Introducir Avion"/></center></td></tr>



</table>

</form>



</table>


<br/>



<p><a href="aviones.asp">Volver atras</a></p>



</div>

</article>


<footer id="footer">

</footer>

</div>

</body>

</html>