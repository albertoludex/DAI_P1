<!-- #include file=conexion.asp -->
<!-- #include file=cambiar_menu.asp -->

<!DOCTYPE html>
<html>

<!-- PAGINA PRICNIAPL DE VUELOS, PERMITE SELECCIONAR ORIGEN Y DESTINO-->

<head>

<meta charset="UTF-8">

<link href="CSS/styles.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

<title>ViajesDAI</title>

<script src="JS/consulta_vuelos.js"></script>

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


<div id="content" >




<table class="buscador">


<tr><b>VUELO DE IDA</b><br><br></tr>



<tr><td>Origen: <select name="origen" id="origen"  onChange="return mostrar_origen()" >
<%
Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
'Recorreremos el RecordSet

do while not origen.EOF
Response.Write("<option value='" & origen("IDCIUDAD") & "'>" & origen("CIUDAD") &"</option>")
'Nos desplazamos por el RecordSet
origen.MoveNext
loop
%>

</select>

</td>



<td>Destino: <select name="destino" id="destino"  onChange="return mostrar_vuelos()" ></select><br></td></tr>




</table>

<br>

<table id="tabla_vuelos" name="tabla_vuelos">

</table>



</div>











</article>


<footer id="footer">



</footer>

</div>

</body>

</html>