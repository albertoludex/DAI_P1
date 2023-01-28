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

'ACTUALIZACION DEL AVION, SOLO SE ACTUALIZA EL NOMBRE

idcompania = request.form("idcompania")
nombre = request.form("nombre")

SentenciaSQL = "Update AVION set AVION='" & nombre & "' where IDAVION = " & idcompania & " "

Set rs = Conexion.Execute(SentenciaSQL)

response.Write("El avion se ha modificado con exito")


Conexion.Close
set conexion = nothing



%>


<br/>

<p><a href="avion_update_formulario.asp?id=<%response.Write(idcompania)%>">Volver atras</a></p>
<p><a href="INDEX.asp">Volver al Index</a></p>

</div>

</article>


<footer id="footer">



</footer>

</div>

</body>

</html>