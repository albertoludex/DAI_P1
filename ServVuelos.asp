<!-- #include file=conexion.asp -->

<%

idvuelo = request.querystring("idvuelo")

accion= request.querystring("accion")


origen= request.querystring("origen")
destino= request.querystring("destino")
fecha= request.querystring("fecha")
compania= request.querystring("compania")
avion= request.querystring("avion")
duracion= request.querystring("duracion")
plazas= request.querystring("plazas")



response.ContentType="text/xml"
response.CacheControl="no-cache, must revalidate"



if accion="consulta" then



Set comprobar_consulta = Conexion.Execute("SELECT COUNT(*) AS CONSULTAS FROM LISTA_VUELOS_PRECIO WHERE IDVUELO=" & idvuelo)

If comprobar_consulta("CONSULTAS")= 0 then

%><?xml version="1.0" encoding="UTF-8"?><%
response.write("<XML>")
response.write("<error_consulta>")
response.write("No existe el Vuelo especificado")
response.write("</error_consulta>")
response.write("</XML>")

else

Set consulta= Conexion.Execute("SELECT * FROM LISTA_VUELOS_PRECIO WHERE IDVUELO=" & idvuelo)

'SE GENERA LA SALIDA XML CON EL VUELO SELECCIONADO

if (not(consulta.Eof)) then
%><?xml version="1.0" encoding="UTF-8"?><%
Response.Write("<XML>")
'Recorremos el RecordSet
do until consulta.Eof 
response.write("<vuelo>")

response.write("<idvuelo>")
response.write(consulta("IDVUELO"))
response.write("</idvuelo>")

response.write("<origen>")
response.write(consulta("CIUDAD_ORIGEN"))
response.write("</origen>")

response.write("<destino>")
response.write(consulta("CIUDAD_DESTINO"))
response.write("</destino>")

response.write("<fecha>")
response.write(consulta("FECHA"))
response.write("</fecha>")

response.write("<compania>")
response.write(consulta("COMPANIA"))
response.write("</compania>")

response.write("<avion>")
response.write(consulta("AVION"))
response.write("</avion>")

response.write("<duracion>")
response.write(consulta("DURACION"))
response.write("</duracion>")

response.write("<plazas>")
response.write(consulta("N_PLAZAS_DISPONIBLES"))
response.write("</plazas>")

response.write("<plazast>")
response.write(consulta("N_PLAZAS"))
response.write("</plazast>")


response.write("</vuelo>")

consulta.MoveNext
loop
response.write("</XML>")

End If

End If


ElseIf accion="insertar" then


fecha2 = month(fecha) & "/" & day(fecha) & "/" & year(fecha)

Set asientos = Conexion.Execute("SELECT N_PLAZAS FROM AVION WHERE IDAVION=" & avion)




SentenciaSQL = "insert into VUELO values ('" & idvuelo & "','" & origen & "','" & destino & "','" & fecha2 & "','" & compania & "','" & avion & "','" & duracion & "','" & asientos("N_PLAZAS") & "')"

Set insertar = Conexion.Execute(SentenciaSQL)

%><?xml version="1.0" encoding="UTF-8"?><%
response.write("<XML>")
response.write("<insertado>")
response.write("El vuelo se ha insertado con id " & idvuelo)
response.write("</insertado>")
response.write("</XML>")




ElseIf accion="modificar" then



Set plaza_t= Conexion.Execute("SELECT N_PLAZAS FROM AVION WHERE IDAVION=" & avion)

plazas_d= plaza_t("N_PLAZAS")-plazas


fecha2 = month(fecha) & "/" & day(fecha) & "/" & year(fecha)


SentenciaSQL= "Update VUELO set IDCIUDADORIGEN='" & origen & "', IDCIUDADDESTINO='" & destino & "',FECHA='" & fecha2 & "',IDCOMPANIA='" & compania & "',IDAVION='" & avion & "',DURACION='" & duracion & "',N_PLAZAS_DISPONIBLES='" & plazas_d & "' where IDVUELO = " & idvuelo & " "


Set modificar= Conexion.Execute(SentenciaSQL)

%><?xml version="1.0" encoding="UTF-8"?><%
response.write("<XML>")
response.write("<modificado>")
response.write("El vuelo se ha modificado con id " & idvuelo)
response.write("</modificado>")
response.write("</XML>")


End If






%>