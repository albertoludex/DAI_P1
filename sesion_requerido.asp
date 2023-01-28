<%

'SI NO SE HA INICIADO SESION SE MOSTRARÁ UN "ALERT", COMO SOLO SE PUEDE HACER POR JavaScript
'HE INCRSUTADO EL CODIGO DE JAVASCRIPT EN EL DE VBScript. LO HE EHCHO ASI  PORQUE NECESITABA TENER
'EN CUENTA LA VARIABLE DE SESION, QUE LA ESTOY MANEJANDO DESDE VBS. 

If session("usuario")<>"" then



Else

nombre_completo= Split(Request.ServerVariables("SCRIPT_NAME"),"/")

nombre_pagina=nombre_completo(ubound(nombre_completo))


if nombre_pagina="GestionarVuelos.asp" then


Response.Write("<script LANGUAGE=""JavaScript"">alert('Para acceder a ADMINISTRAR debe Iniciar sesion');window.location.href='iniciar_sesion.asp'</script>")

ElseIf nombre_pagina="aviones.asp" then 


Response.Write("<script LANGUAGE=""JavaScript"">alert('Para acceder a COMPAÑIAS debe Iniciar sesion');window.location.href='iniciar_sesion.asp'</script>")


ElseIf nombre_pagina="ciudades.asp" then 

Response.Write("<script LANGUAGE=""JavaScript"">alert('Para acceder a CIUDADES debe Iniciar sesion');window.location.href='iniciar_sesion.asp'</script>")


End If

'Response.Write("<script LANGUAGE=""JavaScript"">alert('Para acceder a este apartado primero debe Iniciar sesion');window.location.href='iniciar_sesion.asp'</script>")

'response.redirect("iniciar_sesion.asp")

End If



%>