<?php

require_once "../controller/Funciones_Ajax/Fnc_Global.php";
include_once "../lib/mpdf/mpdf.php";


# =====================	Beans Php
include_once "../beans/Bean_General.php" ;
include_once "../beans/Bean_PerUsuario.php" ;
include_once "../beans/Bean_Transaccion.php" ;
include_once "../beans/Bean_Parametro.php" ;


# =====================	Clases Php
require_once "ClsConexion.php";
require_once "ClsTransaccion_Dat.php";
require_once "ClsUsuario_Dat.php";

require_once "ClsParametro_Dat.php";



# =====================	Funciones Php
require_once "../controller/Funciones_Ajax/Fnc_Comun.php";
require_once "../controller/Funciones_Ajax/Fnc_Transaccion.php";
require_once "../controller/Funciones_Ajax/Fnc_Usuario.php";
require_once "../controller/Funciones_Ajax/Fnc_Parametro.php";


# INICIALIZAR XAJAX
$xajax->processRequest();



?>