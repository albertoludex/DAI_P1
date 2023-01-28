<!-- #include file=conexion.asp -->
<!-- #include file=cambiar_menu.asp -->
<!-- #include file=sesion_requerido.asp -->

<!DOCTYPE html>
<html>

<!-- PAGINA PRICNIAPL DE VUELOS, PERMITE SELECCIONAR ORIGEN Y DESTINO-->

<head>

<meta charset="UTF-8">

<link href="CSS/styles.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

<title>ViajesDAI</title>

<script src="JS/administrar_vuelo.js"></script>



</head>

<body>

<div id="general">

<header id="header">




<nav id="nav">

<ul>

<li><a href="INDEX.asp">INICIO</a></li>
<li><a  href="vuelos.asp">BUSCAR VUELOS</a></li>
<li><a  href="reservas.asp">RESERVAS</a></li>
<li><a href="aviones.asp">AVIONES</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  class="active" href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a href="sesion.asp"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">


<div id="content">


<a onClick="return consultar()" class="botonadmin">CONSULTAR</a>
<a onClick="return insertar()" class="botonadmin">INSERTAR</a>
<a onClick="return modificar()" class="botonadmin">MODIFICAR</a>



<div id="consultar" >

<table name="tabla_consultar_1" id="tabla_consultar_1" cellpadding="10" class="buscador">


	<tr><th></th><th>CONSULTAR VUELO</th><br><br></tr>

	<tr><td>ID Vuelo:</td><td><input type="number" min="0" id="id_vuelo_consulta" name="id_vuelo_consulta" onclick="return mostrarConsulta()" onkeyup="return mostrarConsulta()"></td></tr>
	
	<tr><td><br><br></td></tr>

</table>



<table name="tabla_consultar_2" id="tabla_consultar_2" class="buscador">


</table>


</div>


<div id ="insertar" >

<table name="tabla_insertar" id="tabla_insertar" cellpadding="10">

	<tr><th></th><th>INSERTAR</th><br><br></tr>

	<tr><td>ID Vuelo:</td><td>
	
	<%
	
	Set idvuelo = Conexion.Execute("select max(IDVUELO) as ultimo from VUELO")

	siguiente = idvuelo("ultimo") + 1
	
	%>

	<input type="text" id="id_vuelo_insertar" readonly  value=<% Response.Write(siguiente) %> size="10"></td></tr>

	<tr><td>Origen:</td><td><select name="origen" id="origen">
	<%
	
	Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
	'Recorreremos el RecordSet

	do while not origen.EOF
	Response.Write("<option value='" & origen("IDCIUDAD") & "'>" & origen("CIUDAD") &"</option>")
	'Nos desplazamos por el RecordSet
	origen.MoveNext
	loop
	
	
	%>	

	</select></td></tr>

	<tr><td>Destino:</td><td><select name="destino" id="destino">
	
	<%
	
	Set destino = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
	'Recorreremos el RecordSet

	do while not destino.EOF
	Response.Write("<option value='" & destino("IDCIUDAD") & "'>" & destino("CIUDAD") &"</option>")
	'Nos desplazamos por el RecordSet
	destino.MoveNext
	loop
	
	
	%>	

	</select></td></tr>

	<tr><td>Fecha:</td><td><input type="date" id="fecha" required></td></tr>

	<tr><td>Compañia:</td><td><select name="compania" id="compania">
	
	<%
	
	Set compania = Conexion.Execute("select IDCOMPANIA, COMPANIA from COMPANIA order by COMPANIA")
	'Recorreremos el RecordSet

	do while not compania.EOF
	Response.Write("<option value='" & compania("IDCOMPANIA") & "'>" & compania("COMPANIA") &"</option>")
	'Nos desplazamos por el RecordSet
	compania.MoveNext
	loop
	
	%>	

	</select></td></tr>

	<tr><td>Avion:</td><td><select name="avion" id="avion">
	
	<%
	
	Set avion = Conexion.Execute("select IDAVION, AVION from AVION order by AVION")
	'Recorreremos el RecordSet
	
	do while not avion.EOF
	Response.Write("<option value='" & avion("IDAVION") & "'>" & avion("AVION") &"</option>")
	'Nos desplazamos por el RecordSet
	avion.MoveNext
	loop
	
	%>	

	</select></td></tr>

	<tr><td>Duracion:</td><td><input type="number" min="1" size="10" id="duracion" required></td></tr>
	
	
	<tr><td></td><td><input type="button" value="Isertar" onclick="return mostrarInsertar()"></td></tr>
	
</table>


<table name="tabla_insertar_2" id="tabla_insertar_2">

</table>

</div>


<div id="modificar">


<table name="tabla_modificar_1" id="tabla_modificar_1" cellpadding="10" class="buscador">

	<tr><th></th><th>MODIFICAR VUELO</th><br><br></tr>
	

	<tr><td>ID Vuelo:</td><td><input type="number" min="0" id="id_vuelo_modificar_1" onclick="return mostrarModificarConsulta()" onkeyup="return mostrarModificarConsulta()" ></td></tr>
	<tr><td><br><br></td></tr>
</table>




<table name="tabla_modificar_2" id="tabla_modificar_2" class="buscador" style="display: none;">


</table>


<table name="tabla_modificar_3" id="tabla_modificar_3" cellpadding="10" style="display: none;">


	<tr><th></th><th>MODIFICAR</th></tr>

	<tr><td>ID Vuelo:</td><td>
	
	<%
	
	Set idvuelo = Conexion.Execute("select max(IDVUELO) as ultimo from VUELO")

	siguiente = idvuelo("ultimo") + 1
	
	%>

	<input type="text" id="id_vuelo_modificar" readonly  value=<% Response.Write(siguiente) %> size="10"></td></tr>

	<tr><td>Origen:</td><td><select name="origen_modificar" id="origen_modificar">
	<%
	
	Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
	'Recorreremos el RecordSet

	do while not origen.EOF
	Response.Write("<option value='" & origen("IDCIUDAD") & "'>" & origen("CIUDAD") &"</option>")
	'Nos desplazamos por el RecordSet
	origen.MoveNext
	loop
	
	
	%>	

	</select></td></tr>

	<tr><td>Destino:</td><td><select name="destino_modificar" id="destino_modificar">
	
	<%
	
	Set destino = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
	'Recorreremos el RecordSet

	do while not destino.EOF
	Response.Write("<option value='" & destino("IDCIUDAD") & "'>" & destino("CIUDAD") &"</option>")
	'Nos desplazamos por el RecordSet
	destino.MoveNext
	loop
	
	
	%>	

	</select></td></tr>

	<tr><td>Fecha:</td><td><input type="date" id="fecha_modificar" required></td></tr>

	<tr><td>Compañia:</td><td><select name="compania_modificar" id="compania_modificar">
	
	<%
	
	Set compania = Conexion.Execute("select IDCOMPANIA, COMPANIA from COMPANIA order by COMPANIA")
	'Recorreremos el RecordSet

	do while not compania.EOF
	Response.Write("<option value='" & compania("IDCOMPANIA") & "'>" & compania("COMPANIA") &"</option>")
	'Nos desplazamos por el RecordSet
	compania.MoveNext
	loop
	
	%>	

	</select></td></tr>

	<tr><td>Avion:</td><td><select name="avion_modificar" id="avion_modificar">
	
	<%
	
	Set avion = Conexion.Execute("select IDAVION, AVION from AVION order by AVION")
	'Recorreremos el RecordSet
	
	do while not avion.EOF
	Response.Write("<option value='" & avion("IDAVION") & "'>" & avion("AVION") &"</option>")
	'Nos desplazamos por el RecordSet
	avion.MoveNext
	loop
	
	%>	

	</select></td></tr>

	<tr><td>Duracion:</td><td><input type="number" min="1" size="10" id="duracion_modificar" required></td></tr>
	
	
	<tr><td></td><td><input type="button" value="Isertar" onclick="return mostrarModificar()"><input type="hidden" id="plazas_modificar"></td></tr>






</table>

<input type="hidden">



</div>

</div>

</article>


</div>

</body>

</html>