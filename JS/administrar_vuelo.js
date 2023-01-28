


function consultar(){
	
 document.getElementById('insertar').style.display='none';	
 document.getElementById('modificar').style.display='none';
 document.getElementById('consultar').style.display='block';
 
document.getElementById('tabla_consultar_2').innerHTML= '';



 
}

function insertar(){
	
 document.getElementById('consultar').style.display='none';
 document.getElementById('insertar').style.display='block';
 document.getElementById('modificar').style.display='none';
 document.getElementById('tabla_insertar').style.display='block';
 document.getElementById('tabla_insertar_2').style.display='none';




}


function modificar(){
	
 document.getElementById('consultar').style.display='none';
 document.getElementById('insertar').style.display='none';
 document.getElementById('modificar').style.display='block';
 document.getElementById('tabla_modificar_1').style.display='inline-block';
 document.getElementById('tabla_modificar_2').style.display='none';
 document.getElementById('tabla_modificar_3').style.display='none';



  
}






// Creamos el objeto AJAX httprequest
function AJAXCrearObjeto(){
var obj_admin;
if (window.XMLHttpRequest) { // no es IE
obj_admin = new XMLHttpRequest();
//alert('El navegador no es IE');
}
else { // Es IE o no tiene el objeto
try {
obj_admin = new ActiveXObject("Microsoft.XMLHTTP");
//alert('El navegador utilizado es IE');
}
catch (e) {
 //alert('El navegador utilizado no está soportado');
}
}
//alert('realizado');
return obj_admin;
}


function LeerDatosConsulta(){
	
		
	//COMPROBAR QUE EL ESTADO SEA 4
if (oXML.readyState == 4) {
	
	
	
		
	var tabla = document.getElementById('tabla_consultar_2');
	var definicion_tabla= new String("");
	
	
	
	if (oXML.responseXML.documentElement.getElementsByTagName('error_consulta').length == 0) {
	
	
	
	
	var v;
	var item;

	definicion_tabla='<tr><th>ID VUELO</th><th>ORIGEN</th><th>DESTINO</th><th>FECHA</th><th>COMPAÍA</th><th>AVION</th><th>DURACION</th><th>PLAZAS</th></tr>';
	
	//PROCESAMOS EL XML RECIBIDO Y MAQUETAMOS EL CODIGO HTML CORRESPONDIENTE
	
	

	
	for( i= 0; i < oXML.responseXML.documentElement.getElementsByTagName('vuelo').length; i++ ){
		
		
		
		item = oXML.responseXML.documentElement.getElementsByTagName('vuelo')[i];
		
		v = item.getElementsByTagName('idvuelo')[0].firstChild.data;
		
		definicion_tabla = definicion_tabla +'<tr><td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('origen')[0].firstChild.data;
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('destino')[0].firstChild.data;
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('fecha')[0].firstChild.data;
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('compania')[0].firstChild.data;
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('avion')[0].firstChild.data;
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('duracion')[0].firstChild.data;
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('plazas')[0].firstChild.data;
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td></tr>';
		
		
		

	}
	}else{
		
		
		definicion_tabla= oXML.responseXML.documentElement.getElementsByTagName('error_consulta')[0].firstChild.data;
		
		
	}
	
	
	
		
	//RELLENAMOS EL OBJETO HTML CON LA TABLA
	tabla.innerHTML = definicion_tabla;
	
}

	
	
}



function mostrarConsulta(){
	
	
	
	var valorx= document.getElementById('id_vuelo_consulta').value;
	
	oXML = AJAXCrearObjeto();
	oXML.open('GET','ServVuelos.asp?idvuelo='+valorx+'&accion=consulta');
	oXML.onreadystatechange = LeerDatosConsulta;
	oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	oXML.send('');
	
}













function LeerDatosInsertar(){
	
		

	//COMPROBAR QUE EL ESTADO SEA 4
if (oXML.readyState == 4) {
	
		
	var idvuelo = Number (document.getElementById('id_vuelo_insertar').value);
		
	var tabla = document.getElementById('tabla_insertar_2');

	
	idvuelo = (idvuelo + 1);
	
	

	//PROCESAMOS EL XML RECIBIDO Y MAQUETAMOS EL CODIGO HTML CORRESPONDIENTE
		
		
	if(oXML.responseXML.documentElement.getElementsByTagName('insertado').length == 0){
		
		tabla.innerHTML = 'Ha ocurrido un error';
		//RELLENAMOS EL OBJETO HTML CON LA TABLA
		document.getElementById('tabla_insertar_2').style.display='block';
		
		
		
		
	}else{

		
	tabla.innerHTML = oXML.responseXML.documentElement.getElementsByTagName('insertado')[0].firstChild.data;
	document.getElementById('tabla_insertar_2').style.display='block';
	document.getElementById('id_vuelo_insertar').value = idvuelo;
}
	
}

	
	
}

function mostrarInsertar(){
	
	var origen= document.getElementById('origen').value;
	var destino= document.getElementById('destino').value;
	
	if(origen==destino){
		
		alert('Origen y Destino no pueden ser iguales');
		
		
	}else{
		
		
	document.getElementById('tabla_insertar').style.display='none';
	
	
	var idvuelo= document.getElementById('id_vuelo_insertar').value;
	var fecha= document.getElementById('fecha').value;
	var compania= document.getElementById('compania').value;
	var avion= document.getElementById('avion').value;
	var duracion= document.getElementById('duracion').value;
	

	oXML = AJAXCrearObjeto();
	oXML.open('GET','ServVuelos.asp?idvuelo='+idvuelo+'&origen='+origen+'&destino='+destino+'&fecha='+fecha+'&compania='+compania+'&avion='+avion+'&duracion='+duracion+'&accion=insertar');
	oXML.onreadystatechange = LeerDatosInsertar;
	oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	oXML.send('');
	
	}
	
}





function LeerDatosModificarConsulta(){
	
		
	//COMPROBAR QUE EL ESTADO SEA 4
if (oXML.readyState == 4) {
	
	
	
		
	var tabla = document.getElementById('tabla_modificar_2');
	var definicion_tabla= new String("");
	
	
	
	if (oXML.responseXML.documentElement.getElementsByTagName('error_consulta').length == 0) {
	
	
	
	
	var v;
	var item;

	definicion_tabla='<tr><th>ID VUELO</th><th>ORIGEN</th><th>DESTINO</th><th>FECHA</th><th>COMPAÍA</th><th>AVION</th><th>DURACION</th><th>PLAZAS</th></tr>';
	
	//PROCESAMOS EL XML RECIBIDO Y MAQUETAMOS EL CODIGO HTML CORRESPONDIENTE
	
	

	
	for( i= 0; i < oXML.responseXML.documentElement.getElementsByTagName('vuelo').length; i++ ){
		
		
		
		item = oXML.responseXML.documentElement.getElementsByTagName('vuelo')[i];
		
		v = item.getElementsByTagName('idvuelo')[0].firstChild.data;
		
		document.getElementById('id_vuelo_modificar').value=v;
		
		definicion_tabla = definicion_tabla +'<tr><td><a class="enlace_formulario_modificar" onClick="return mostrarModificarFormulario()">'+ v +'</a></td>';
		
		
		v = item.getElementsByTagName('origen')[0].firstChild.data;
		
		for(i=0; i < document.getElementById('origen_modificar').length; i++){
			
			if(document.getElementById('origen_modificar').options[i].innerHTML === v){
				
				document.getElementById('origen_modificar').options[i].selected = "true";
				
				
			}else{
				
				
				
			}
			
			
			
		}
		
		
		
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('destino')[0].firstChild.data;
		
		
		
			for(i=0; i < document.getElementById('destino_modificar').length; i++){
			
			if(document.getElementById('destino_modificar').options[i].innerHTML === v){
				
				document.getElementById('destino_modificar').options[i].selected = "true";
				
				
			}else{
				
				
				
			}
			
			
			
			}
			
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('fecha')[0].firstChild.data;
		
		
		dia= v.slice(0,2);
		
		mes = v.slice(3,5);
		
		ano = v.slice(6);
		
		fecha= ano+'-'+mes+'-'+dia;
		
		
		
		document.getElementById('fecha_modificar').value= fecha;
		
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('compania')[0].firstChild.data;
		
	
		
		
			for(i=0; i < document.getElementById('compania_modificar').length; i++){
			
			if(document.getElementById('compania_modificar').options[i].innerHTML === v){
				
				document.getElementById('compania_modificar').options[i].selected = "true";
				
				
			}else{
				
				
				
			}
		
			}
		
		
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('avion')[0].firstChild.data;
		
		
		
			for(i=0; i < document.getElementById('avion_modificar').length; i++){
			
			if(document.getElementById('avion_modificar').options[i].innerHTML === v){
				
				document.getElementById('avion_modificar').options[i].selected = "true";
				
				
			}else{
				
				
				
			}
		
			}
		
		
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('duracion')[0].firstChild.data;
		
		document.getElementById('duracion_modificar').value=v;
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td>';
		
		
		v = item.getElementsByTagName('plazas')[0].firstChild.data;
		
		
		plazas_disponibles= v;
		
		definicion_tabla = definicion_tabla +'<td>'+ v +'</td></tr>';
		
		
		
		v= item.getElementsByTagName('plazast')[0].firstChild.data;
		
		plazas_totales = v;
		
		plazas_reservadas= plazas_totales - plazas_disponibles;
		
		document.getElementById('plazas_modificar').value=plazas_reservadas;
		
		
		document.getElementById('tabla_modificar_2').style.display='block';
		
		

	}
	}else{
		
		
		definicion_tabla= oXML.responseXML.documentElement.getElementsByTagName('error_consulta')[0].firstChild.data;
		document.getElementById('tabla_modificar_2').style.display='block;'
		
	}
	
	
	
		
	//RELLENAMOS EL OBJETO HTML CON LA TABLA
	tabla.innerHTML = definicion_tabla;
	
}

	
	
}






function mostrarModificarConsulta(){
	

	
	var valorx= document.getElementById('id_vuelo_modificar_1').value;
	oXML = AJAXCrearObjeto();
	oXML.open('GET','ServVuelos.asp?idvuelo='+valorx+'&accion=consulta');
	oXML.onreadystatechange = LeerDatosModificarConsulta;
	oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	oXML.send('');
	
	
}


function mostrarModificarFormulario(){
	

	document.getElementById('tabla_modificar_1').style.display='none';
	document.getElementById('tabla_modificar_2').style.display='none';
	document.getElementById('tabla_modificar_3').style.display='block';
	
	
	
	
}





function LeerDatosModificar(){
	
		

	//COMPROBAR QUE EL ESTADO SEA 4
if (oXML.readyState == 4) {
	
		
	
		
	var tabla = document.getElementById('tabla_modificar_2');

	
	
	
	

	//PROCESAMOS EL XML RECIBIDO Y MAQUETAMOS EL CODIGO HTML CORRESPONDIENTE
		
		
	if(oXML.responseXML.documentElement.getElementsByTagName('modificado').length == 0){
		
		tabla.innerHTML = 'Ha ocurrido un error';
		//RELLENAMOS EL OBJETO HTML CON LA TABLA
		document.getElementById('tabla_modificar_2').style.display='block';
	
		
		
		
	}else{

		
	tabla.innerHTML = oXML.responseXML.documentElement.getElementsByTagName('modificado')[0].firstChild.data;
	document.getElementById('tabla_modificar_2').style.display='block';

	
	
}
	
}

	
	
}






function mostrarModificar(){
	
	
	//MODIFICAR ULTIMO PASO
	
	var origen= document.getElementById('origen_modificar').value;
	var destino= document.getElementById('destino_modificar').value;
	
	if(origen==destino){
		
		alert('Origen y Destino no pueden ser iguales');
		
		
	}else{
		
		
	document.getElementById('tabla_modificar_3').style.display='none';
	
	
	var idvuelo= document.getElementById('id_vuelo_modificar').value;
	var fecha= document.getElementById('fecha_modificar').value;
	var compania= document.getElementById('compania_modificar').value;
	var avion= document.getElementById('avion_modificar').value;
	var duracion= document.getElementById('duracion_modificar').value;
	var plazas= document.getElementById('plazas_modificar').value;
	
	alert(document.getElementById('avion_modificar').value);
	
	oXML = AJAXCrearObjeto();
	oXML.open('GET','ServVuelos.asp?idvuelo='+idvuelo+'&origen='+origen+'&destino='+destino+'&fecha='+fecha+'&compania='+compania+'&avion='+avion+'&duracion='+duracion+'&plazas='+plazas+'&accion=modificar');
	oXML.onreadystatechange = LeerDatosModificar;
	oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	oXML.send('');
	


	
	}


}

