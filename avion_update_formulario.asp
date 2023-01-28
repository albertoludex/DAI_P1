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

'FORMULARIO ACTUALIZACION AVION, SOLO SE PUEDE ACTUALIZAR EL NOMBRE

id_recibido = request.querystring("id")

Set consulta = Conexion.Execute("select IDAVION, AVION from AVION where IDAVION = " & id_recibido)

id= consulta("IDAVION")
nombre= consulta("AVION")




%>


<form name="formulario_update" action="avion_update.asp" method="post">
<table>

<tr><b>MODIFICAR Avion</b><br><br></tr>

<tr><td>Id Avion:</td><td><input type="text" name="idcompania" value="<% response.write(id) %>" readonly></td></tr>

<tr><td>Nombre:</td><td><input type="text" name="nombre" required value="<% response.write(nombre) %>"></td></tr>

<tr><td colspan="2"><center><input type="submit" id="cambiar" value="Modificar"/></center></td></tr>

</table>

</form>


<br/>

//<p><a href="aviones.asp">Volver atras</a></p>

</div>

</article>


<footer id="footer">


</footer>

</div>

</body>

</html>