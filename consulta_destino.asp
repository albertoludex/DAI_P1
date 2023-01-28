<!-- #include file=conexion.asp -->
<%


'CONSULTA DE LOS DESTINOS SEGUN UN ORIGEN RECIBIDO, DEVUELVE XML


origen=request.form("origen")


response.ContentType="text/xml"
response.CacheControl="no-cache, must-revalidate"





SentenciaSQL = "Select COUNT(*) AS EXISTE from LISTA_DESTINOS("& origen &")"

Set existe = Conexion.Execute(SentenciaSQL)


'COMPROBAMOS PRIMERO QUE EXISTAN DESTINOS

if existe("EXISTE")>0 then


'SI EXISTEN DESTINOS SE DEVUELVE UN XML CON LOS ID Y LOS NOMBRES DE LAS CIUDADES


SentenciaSQL = "Select IDCIUDADDESTINO, CIUDAD_DESTINO from LISTA_DESTINOS("& origen &")"

Set rs = Conexion.Execute(SentenciaSQL)


if (not(rs.Eof)) then
%><?xml version="1.0" encoding="UTF-8"?> <%
response.write("<XML>")
' Recorremos el Recorset
do until rs.Eof
response.write("<destino>")

response.write("<idciudad>")
response.write( rs("IDCIUDADDESTINO") )
response.write("</idciudad>")

response.write("<ciudad>")
response.write( rs("CIUDAD_DESTINO") )
response.write("</ciudad>")



response.write("</destino>")

rs.MoveNext
loop
response.write("</XML>")
end if

else 

'SI NO EXISTEN DESTINOS SE DEVUELVE UN XML CON UN SIMPLE MENSAJE 

response.Write("<XML>")

response.Write("<nodestino>")
response.Write("No disponibles")
response.Write("</nodestino>")

response.Write("</XML>")

End If

%>