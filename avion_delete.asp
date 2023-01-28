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


'SE ELIMINA EL AVION CON EL IDAVION RECIBIDO

id_recibido = request.querystring("id")

Set consulta = Conexion.Execute("delete from AVION where IDAVION=" & id_recibido)

if Conexion.Errors.Count>0 then

	for each error in Conexion.Errors
	
		response.write(Error.Number & " = " & Error.Description)
		
	next
	
else

	response.write("El avion  se ha eliminado con exito.")
	
end if

Conexion.Close
	
Set Conexion = nothing





%>


<br/>


<p><a href="aviones.asp">Volver atras</a></p>
<p><a href="INDEX.asp">Volver al Index</a></p>


</div>

</article>


<footer id="footer">


</footer>

</div>

</body>

</html>