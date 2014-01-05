<?php
include ("../model/Enlace.php");
?>

<!doctype html>
<html lang="es">
<head>
    <?php $xajax->printJavascript();?>

	<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
<link rel="stylesheet" href="./css/style2014.css">

	<title></title>
</head>
<style>
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background:#F7F6F6 ;
}

.contenedor {
	position: absolute; /*Posicionamiento absoluto*/
	top: 50%; /*Desde arriba, colocar al 50% de la pantalla*/
	left: 50%; /*Desde la izquierda, colocar al 50% de la pantalla*/
	height: 180px; /*Le ponemos el valor del alto*/
	width: 360px; /*Le ponemos el valor del ancho*/
	margin-top: -90px; /*Restamos la mitad de alto para centrarlo verticalmente*/
	margin-left: -180px; /*Restamos la mitad de ancho para centrarlo horizontalmente*/

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	padding: 5px
}
.frm
{
	margin: 15px   5px  5px 5px;
	padding: 5px;
}
.border-color{
border: 2px solid #00CC00

}
.border-radius {
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
border-radius: 10px;
}
#msjlogueo{
	color: red ;
}
fieldset input{ text-transform: none!important}
@media only screen and (max-width : 320px)  {

	.contenedor {
		width: 100%!important ;
		top:25%;
		margin-top: 0 ;
		margin-left:0 ;
		left: 0 ;
	}
	fieldset label{
		display: none !important;
	}
	fieldset input{
		width: 98% !important ;
	}
}
</style>
<script type='text/javascript'>
		document.onkeypress=function(e){
		//capturo todos los campos o puedo especificar el campo especifico
		var boton=(document.all);
		// var boton=(document.getElementById("btningresar"));
		//funcion abrevidad de if else
		tecla=(boton) ? event.keyCode : e.which;
		//si tecla es igual a enter, es decir 13 que ejecute el click
		if(tecla==13){
			document.getElementById("btnIngresar").click();
			//return false;
		  }
		}
	</script>
<body>
<div class="contenedor border-color border-radius ">
	<div class="frm row">
			<form class="hform" id="frmLogin"  name="frmLogin" method="post" action="#">
	           <fieldset class="border">

		              <fieldset>
		                  <label for="Usuario_" style="font-weight: bold" >Usuario</label>
		                  <input type="text" class="icon-user" name="Usuario_" id="Usuario_" placeholder="Usuario"  required autofocus >
		              </fieldset>
		              <fieldset>
		              	<label for="UsuarioPassword_" style="font-weight: bold" >Contraseña</label>
		              	<input type="password" name="UsuarioPassword_" id="UsuarioPassword_" placeholder="Password" required="">
		              </fieldset>
		                <fieldset class="text-right" >
		                <button  id="btnIngresar" type="button" class="btn green " onclick="xajax_Validar_Acceso(xajax.getFormValues(frmLogin))"><i class="icon-key"></i> Ingresar</button>
		                </fieldset>
		        </fieldset>
	        </form>
	        <div id="msjlogueo" class="text-center"></div>
	</div>
</div>
</body>
</html>