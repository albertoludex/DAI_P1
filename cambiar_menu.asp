<%


'Cambia el boton de Iniciar Sesion por "Cerrar Sesion" en caso de que haya una sesion activa

If session("usuario")<>"" then

sesion="Cerrar Sesion"

else

sesion="Iniciar Sesion"

End If


%>