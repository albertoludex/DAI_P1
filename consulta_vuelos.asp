<!-- #include file=conexion.asp -->
<%
' Realiza consulta en la base de datos y genera como resultado
' una lista de vuelos en formato XML
'on Error Resume Next
' Accedemos alcompañía enviado desde la pagina principal
origen=request.form("origen")
destino=request.form("destino")


if destino = 0 then

response.ContentType="text/xml"
response.CacheControl="no-cache, must-revalidate"

%><?xml version="1.0" encoding="UTF-8"?><%
response.Write("<XML>")

response.Write("<novuelo>")
response.Write("Lo sentimos, No hay vuelos disponibles")
response.Write("</novuelo>")

response.Write("</XML>")
%><%
else 

Set origen = Conexion.Execute("SELECT CIUDAD FROM CIUDAD WHERE IDCIUDAD=" & origen)
Set destino = Conexion.Execute("SELECT CIUDAD FROM CIUDAD WHERE IDCIUDAD=" & destino)

' El contenido a devolver es XML

response.ContentType="text/xml"
response.CacheControl="no-cache, must-revalidate"

' Consulta SQL de las ciudades que son origen de algun vuelo



SentenciaSQL="SELECT IDVUELO, CIUDAD_ORIGEN, CIUDAD_DESTINO, FECHA, COMPANIA, N_PLAZAS, N_PLAZAS_DISPONIBLES, PRECIO FROM LISTA_VUELOS_PRECIO WHERE CIUDAD_DESTINO='" & destino("CIUDAD") & "' AND CIUDAD_ORIGEN='" & origen("CIUDAD") & "' "

Set rs = Conexion.Execute(SentenciaSQL)


' Se genera una salida XML con la lista de vuelos
if (not(rs.Eof)) then
%><?xml version="1.0" encoding="UTF-8"?> <%
response.write("<XML>")
' Recorremos el Recorset
do until rs.Eof
response.write("<vuelo>")

response.write("<idvuelo>")
response.write( rs("IDVUELO") )
response.write("</idvuelo>")

response.write("<ciudad_origen>")
response.write( rs("CIUDAD_ORIGEN") )
response.write("</ciudad_origen>")

response.write("<ciudad_destino>")
response.write( rs("CIUDAD_DESTINO") )
response.write("</ciudad_destino>")

response.write("<fecha>")
response.write( rs("FECHA") )
response.write("</fecha>")

response.write("<compania>")
response.write( rs("COMPANIA") )
response.write("</compania>")

response.write("<n_plazas>")
response.write( rs("N_PLAZAS") )
response.write("</n_plazas>")

response.write("<n_plazas_disponibles>")
response.write( rs("N_PLAZAS_DISPONIBLES") )
response.write("</n_plazas_disponibles>")

response.write("<precio>")
response.write( rs("PRECIO") )
response.write("</precio>")

response.write("</vuelo>")

rs.MoveNext
loop
response.write("</XML>")
end if

End If
%>