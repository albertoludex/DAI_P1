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
<li><a href="companias.asp">COMPAÑIAS</a></li>
<li><a  href="ciudades.asp">CIUDADES</a></li>
<li><a  href="GestionarVuelos.asp">ADMINISTRAR</a></li>
<li style="float:right"><a href="sesion.asp"><% response.write(sesion) %></a></li>

</ul>

</nav>

</header>

<article id="article">

<div id="content">


<table cellspacing="10">



<%

'RESULTADOS DE LOS VUELOS DE VUELTA DE UN VUELO ESPECIFICADO ANTERIORMENTE

origen= request.querystring("origen")
destino=request.querystring("destino")


SentenciaSQL="SELECT COUNT(*) AS VUELOS FROM LISTA_VUELOS_PRECIO WHERE CIUDAD_DESTINO='" & destino & "' AND CIUDAD_ORIGEN='" & origen & "' "

Set vuelos= Conexion.Execute(SentenciaSQL)

If vuelos("VUELOS") = 0 then 


Response.Write("Lo sentimos, no hay vuelos de vuelta disponibles")

Else


Response.Write("<tr><b>VUELO DE IDA</b><br><br></tr>")
Response.Write("<tr><td><b>ID</b></td><td><b>ORIGEN</b></td><td><b>DESTINO</b></td><td><b>FECHA</b></td><td><b>COMPAÑIA</b></td><td><b>Nº PLAZAS</b></td><td><b>PLAZAS DISPONIBLES</b></td><td><b>PRECIO</b></td></tr>")



SentenciaSQL="SELECT IDVUELO, CIUDAD_ORIGEN, CIUDAD_DESTINO, FECHA, COMPANIA, N_PLAZAS, N_PLAZAS_DISPONIBLES, PRECIO FROM LISTA_VUELOS_PRECIO WHERE CIUDAD_DESTINO='" & destino & "' AND CIUDAD_ORIGEN='" & origen & "' "

Set resultado = Conexion.Execute(SentenciaSQL)



do while not resultado.EOF



Response.Write("<tr><td><center><a href=reserva_formulario_vuelta.asp?id=" & resultado("IDVUELO") &"&destino=" & resultado("CIUDAD_DESTINO") &"&origen=" & resultado("CIUDAD_ORIGEN") & ">" & resultado("IDVUELO") & " </a><center></td><td>" & resultado("CIUDAD_ORIGEN") & "</td><td>" & resultado("CIUDAD_DESTINO") & "</td><td>" & resultado("FECHA") & " </td><td>" & resultado("COMPANIA") & " </td><td>" & resultado("N_PLAZAS") & " </td><td>" & resultado("N_PLAZAS_DISPONIBLES") & " </td><td>" & ROUND(resultado("PRECIO"),2) & " </td></tr>")

	resultado.MoveNext

loop

End If


%>

</table>

</div>


</article>


<footer id="footer">


</footer>

</div>

</body>

</html>