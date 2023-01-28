<html>
   <head>
      <title>Prueba Conexion</title>
   </head>
<body>
   <%
      on Error Resume Next
      Set Conexion = Server.CreateObject("ADODB.Connection")
      Conexion.ConnectionString = "Data Source=agencia; USER=SYSDBA; PASSWORD=masterkey"
      Conexion.Mode = 1
      Conexion.Open
      if Err.Description <>"" then
         Response.Write("Error: " & Err.Description & "<br>")
      else
         Response.Write("Conexión Lograda con Éxito")
      end if
      Conexion.Close
      Set Conexion = nothing	  	  
   %>   
</body>
</html>