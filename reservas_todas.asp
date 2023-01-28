<!-- #include file=conexion.asp -->
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

<li><a  href="INDEX.asp">INICIO</a></li>
<li><a  href="vuelos.asp">BUSCAR VUELOS</a></li>
<li><a  class="active" href="reservas.asp">RESERVAS</a></li>
<li><a  href="aviones.asp">AVIONES</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a  href="practica.html"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">


<div id="content">

<table cellspacing="10">





<%

'MUESTRA TODAS LAS RESERVAS HECHAS POR UNA PERSONA, OBTENIDO A PARTIR DEL DNI

dni= request.form("dni")



Set reservas= Conexion.Execute("SELECT COUNT(*) AS RESERVAS FROM listado_reservas WHERE NIF='"& dni&"'")
If reservas("RESERVAS") = 0 then 


Response.Write("No hay reservas con este NIF")

Else



Response.Write("<tr><b>RESERVAS</b><br><br></tr>")
Response.Write("<tr><td><b>ID RESERVA</b></td><td><b>FECHA</b></td><td><b>ORIGEN</b></td><td><b>DESTINO</b></td><td><b>CANCELADO</b></td><td><b>COMPAÑIA</b></td><td><b>NIF</b></td></tr>")



Set resultado = Conexion.Execute("SELECT * FROM LISTADO_RESERVAS WHERE NIF='"& dni&"'")


do while not resultado.EOF

If resultado("CANCELADO")=0 then

cancelado="NO"

else

cancelado="SI"

End If




Response.Write("<tr><td><center><a href=reserva_todas_individual.asp?id=" & resultado("IDRESERVA") & ">" & resultado("IDRESERVA") & " </a><center></td><td>" & resultado("FECHA_VUELO") & "</td><td>" & resultado("CIUDAD_ORIGEN") & "</td><td>" & resultado("CIUDAD_DESTINO") & " </td><td>" & cancelado & " </td><td>" & resultado("COMPANIA") & " </td><td>" & resultado("NIF") & " </td></tr>")

	resultado.MoveNext

loop

End If

%>


</table>

<br/>

<p><a href="reservas_todas_formulario.asp">Volver atras</a></p>

</div>






</article>


<footer id="footer">


</footer>

</div>

</body>

</html>