

//CONSULTA DE LOS DESTINOS, ENVIA POR "POST" EL ORIGEN Y LE DEVUELVEN UN XML CON LOS ID Y LAS CIUDADES DE DESTINO 

// Creamos el objeto AJAX httprequest
function AJAXCrearObjeto(){
var obj_vuelo;
if (window.XMLHttpRequest) { // no es IE
obj_vuelo = new XMLHttpRequest();
//alert('El navegador no es IE');
}
else { // Es IE o no tiene el objeto
try {
obj_vuelo = new ActiveXObject("Microsoft.XMLHTTP");
//alert('El navegador utilizado es IE');
}
catch (e) {
 //alert('El navegador utilizado no está soportado');
}
}
//alert('realizado');
return obj_vuelo;
}



//CONSULTAR DESTINOS



//LEER DATOS 

function leerDatosDestino(){


//COMPORBAR QUE EL ESTADO SEA 4
if (oXML.readyState == 4) {




var seleccion = document.getElementById('destino');
var tabla = document.getElementById('tabla_vuelos');

var definicion_tabla = new String("");
definicion_tabla= ' '; 
tabla.innerHTML = definicion_tabla;


var definicion_seleccion = new String("");



//COMPROBAR QUE TIPO DE INFORMACION HEMOS RECIDIO, EN ESTE CASO SI HEMOS RECIBIDO EL MENSAJE DE ERROR O NO
if (oXML.responseXML.documentElement.getElementsByTagName('nodestino').length == 0){


//SI NO LO HEMOS RECIBIDO SIGNIFICARÁ QUE HEMOS RECIBIDO EL XML DE LOS DESTINOS 

var v;
var item;


definicion_seleccion='<option value=0>SELECCIONE</option>';

//PROCESAMOS EL XML RECIBIDO Y MAQUETAMOS EL CÓDIGO HTML CORRESPONDIENTE

for (i = 0; i < oXML.responseXML.documentElement.getElementsByTagName('destino').length; i++){
	
	

item = oXML.responseXML.documentElement.getElementsByTagName('destino')[i];

v = item.getElementsByTagName('idciudad')[0].firstChild.data;

definicion_seleccion =definicion_seleccion +'<option value='+ v +'>';


v = item.getElementsByTagName('ciudad')[0].firstChild.data;

definicion_seleccion = definicion_seleccion + v +'</option>';


}
}else{
	
//SI SE HA RECIBIDO EL MENSAJE DE ERROR PONEMOS UNA ETIQUETA HTML CON EL MENSAJE DE INDISPONIBLIDAD	

definicion_seleccion= '<option value=0>' + oXML.responseXML.documentElement.getElementsByTagName('nodestino')[0].firstChild.data + '</option>';

}

//RELLENAMOS EL OBJETO HTML 
seleccion.innerHTML = definicion_seleccion;




}



}


function mostrar_origen(){

var valorx=document.getElementById("origen").value;

oXML = AJAXCrearObjeto();
oXML.open('POST', 'consulta_destino.asp');
oXML.onreadystatechange = leerDatosDestino;
oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

oXML.send('origen='+valorx);

}








//CONSULTAR VUELOS


//LEER DATOS VUELOS
function leerDatosVuelo(){


//COMPORBAR QUE EL ESTADO SEA 4
if (oXML.readyState == 4) {

var xml = oXML.responseXML.documentElement;


var tabla = document.getElementById('tabla_vuelos');

var definicion_tabla = new String("");



//COMPROBAR QUE TIPO DE INFORMACION HEMOS RECIDIO, EN ESTE CASO SI HEMOS RECIBIDO EL MENSAJE DE ERROR O NO
if (xml.getElementsByTagName('novuelo').length == 0){


//SI NO LO HEMOS RECIBIDO SIGNIFICARÁ QUE HEMOS RECIBIDO EL XML DE LOS VUELOS DISPONIBLES

definicion_tabla ='<th>Id Vuelo</th><th>Ciudad Origen</th><th>Ciudad Destino</th><th>Fecha</th><th>Compa&ntilde;&iacute;a</th><th>Plazas</th><th>Plazas Disponibles</th><th>Precio</th>';


var v;
var item;



//PROCESAMOS EL XML RECIBIDO Y MAQUETAMOS EL CÓDIGO HTML CORRESPONDIENTE

for (i = 0; i < xml.getElementsByTagName('vuelo').length; i++){
	
	

item = xml.getElementsByTagName('vuelo')[i];

v = item.getElementsByTagName('idvuelo')[0].firstChild.data;

definicion_tabla =definicion_tabla+'<tr><td><a href="reserva_formulario_ida.asp?id='+ v +'&';


v = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;

definicion_tabla= definicion_tabla+'destino='+ v +'&';


v = item.getElementsByTagName('ciudad_origen')[0].firstChild.data;

definicion_tabla =definicion_tabla+'origen='+ v +'">';


v = item.getElementsByTagName('idvuelo')[0].firstChild.data;

definicion_tabla =definicion_tabla+ v +'<a/></td>';


v = item.getElementsByTagName('ciudad_origen')[0].firstChild.data;

definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';


v = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;

definicion_tabla= definicion_tabla+'<td>' + v +'</td>';


v = item.getElementsByTagName('fecha')[0].firstChild.data;

definicion_tabla= definicion_tabla+'<td>' + v + '</td>';


v = item.getElementsByTagName('compania')[0].firstChild.data;

definicion_tabla= definicion_tabla+'<td>' + v + '</td>';


v = item.getElementsByTagName('n_plazas')[0].firstChild.data;

definicion_tabla= definicion_tabla+'<td>' + v + '</td>';


v = item.getElementsByTagName('n_plazas_disponibles')[0].firstChild.data;

definicion_tabla= definicion_tabla+'<td>' + v + '</td>';


v = item.getElementsByTagName('precio')[0].firstChild.data;

definicion_tabla= definicion_tabla+'<td>' + v + '</td></tr>';

}
}else{

//SI SE HA RECIBIDO EL MENSAJE DE ERROR VACIAMOS EL CONTENIDO
definicion_tabla= ' ';
 
}
//RELLENAMOS EL OBJETO HTML CON LA TABLA DEFINIDA
tabla.innerHTML = definicion_tabla;




}



}


function mostrar_vuelos(){
// recupera el objeto html desplegable de companias
var valorx=document.getElementById("origen").value;
var valory=document.getElementById("destino").value;

// crea el objeto httprequest
oXML = AJAXCrearObjeto();
oXML.open('POST', 'consulta_vuelos.asp');
oXML.onreadystatechange = leerDatosVuelo;
oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// lanza la peticion enviando los parametros
oXML.send('origen='+valorx+'&destino='+valory);

}

