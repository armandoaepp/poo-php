<?php
include_once "../../capa_negocio/Ajax/Funciones_Ajax/Fnc_Global.php";
include_once "../../capa_negocio/fpfd/fpdf.php";


# Clases Php	
include_once "ClsAcceso_Datos.php";
include_once "ClsParametro_Dat.php";
include_once "ClsParParametro_Dat.php";
include_once "ClsPersona_Dat.php";
include_once "ClsUsuario_Dat.php";

#	Funciones Php 

include_once "../../capa_negocio/Ajax/Funciones_Ajax/Fnc_Comun.php";
include_once "../../capa_negocio/Ajax/Funciones_Ajax/Fnc_xajax_Combos.php";
include_once "../../capa_negocio/Ajax/Funciones_Ajax/Fnc_Transaccion.php";

include_once "../../capa_negocio/Ajax/Funciones_Ajax/Fnc_Permisos.php";
include_once "../../capa_negocio/Ajax/Funciones_Ajax/Fnc_Persona.php";
include_once "../../capa_negocio/Ajax/Funciones_Ajax/Fnc_Principal.php";
include_once "../../capa_negocio/Ajax/Funciones_Ajax/Fnc_Usuario.php";


$xajax->processRequest();

?>