<!-- #include file=conexion.asp -->
<!-- #include file=sesion_requerido.asp -->
<!-- #include file=cambiar_menu.asp -->

<!DOCTYPE>
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

'SE AÑADE UN NUEVO AVION  CON EL NOMBRE ESPECIFICADO, EL IDAVION ES GENERADO AUTOMATICAMNETE EN EL PASO ANTERIOR

idcompania= request.form("idcompania")
nombre= request.form("nombre")
plazas= request.form("plazas")
precio= request.form("precio")



SentenciaSQL = "insert into AVION values ('" & idcompania & "', '" & nombre & "', '" & plazas & "', '" & precio & "')"

Set rs = Conexion.Execute(SentenciaSQL)

response.Write("Se ha insertado el Avion " & nombre & " con id " & idcompania& "con un numero de plazas: " &plazas& "y precio de: " &precio)

Conexion.Close
Set Conexion = nothing




%>


<br/>


<p><a href="avion_insert_formulario.asp">Volver atras</a></p>
<p><a href="INDEX.asp">Volver al Index</a></p>

</div>


</article>


<footer id="footer">


</footer>

</div>

</body>

</html>