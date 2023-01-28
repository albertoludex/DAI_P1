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

'INSERTA UNA NUEVA RESERVA, EN ESTE CASO ES LA RESERVA DE VUELTA

idreserva= request.form("idreserva")
nombre= request.form("nombre")
apellidos= request.form("apellidos")
dni= request.form("dni")
asientos= request.form("asientos")
idvuelo=request.form("idvuelo")
cancelado= "0"

destino=request.form("destino")
origen=request.form("origen")


SentenciaSQL="insert into RESERVA values ('" & idreserva & "', '" & apellidos & "', '" & nombre & "', '" & dni & "', '" & idvuelo & "', '" & asientos & "','" & cancelado & "' )"

Set rs = Conexion.Execute(SentenciaSQL)



response.Write("La reserva se ha hecho correctamente. Su <b> ID DE RESERVA: " & idreserva & "</b>")


%>



<p><a href="INDEX.asp">Volver al index</a><p/>

</div>


</article>


<footer id="footer">


</footer>

</div>

</body>

</html>