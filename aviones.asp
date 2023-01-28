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


<table cellspacing="10">



<%

'LISTA AVIONES DE LA BD

Set companias = Conexion.Execute("SELECT COUNT(*) AS AVION FROM AVION")

If companias("AVION")=0 Then 


Response.Write("No hay aviones disponibles")


Else

Response.Write("<tr><td><b>ELIMINAR</b></td><td><b>EDITAR</b></td><td><b>NOMBRE</b></td></tr>")

Set resultado = Conexion.Execute("select IDAVION, AVION from AVION ORDER BY IDAVION")

do while not resultado.EOF
Response.Write("<tr><td><center><a href=avion_delete.asp?id=" & resultado("IDAVION") & " ><b><font color=red>X</font></b></a><center></td><td><center><a href=avion_update_formulario.asp?id=" & resultado("IDAVION") & " >" & resultado("IDAVION") & " </a><center></td><td>" & resultado("AVION") & " </td></tr>")

	resultado.MoveNext

loop

End If

%>



</table>


<button Onclick="window.location.href='avion_insert_formulario.asp'">AÑADIR AVION</button>

</div>

</article>


<footer id="footer">


</footer>

</div>

</body>

</html>