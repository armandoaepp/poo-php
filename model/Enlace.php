<?php

require_once "../controller/Funciones_Ajax/Fnc_Global.php";


# =====================	Beans Php
include_once "../beans/Bean_General.php" ;
include_once "../beans/Bean_Parametro.php" ;

# =====================	Clases Php
require_once "ClsConexion.php";
require_once "ClsParametro_Dat.php";



# =====================	Funciones Php
// require_once "../../capa_negocio/Funciones_Ajax/Fnc_Comun.php";


# INICIALIZAR XAJAX
// $xajax->processRequest();

try
{


	$objParametro = new ClsParametro() ;
	# $nOriReg, $nCanReg, $nPagRegistro, $nParClase, $cParNombre="-", $cParDescripcion="-"
	/*$data = $objParametro->Filtrar_Parametro(0 , 20 , 0 , 1001 , "-" , "-");

		echo "Numero de Filas : ". count($data["cuerpo"])."<br>";

		for($i = 0 ; $i < count( $data["cuerpo"]) ; $i++ ){
		    echo  $data["cuerpo"][$i]["nParCodigo"]."-" . $data["cuerpo"][$i]["cParNombre"]." - ".$data["cuerpo"][$i]["cParDescripcion"]."</br>";
		}*/
	$objParametro->beginTransaction() ;
		$data = $objParametro->Set_Parametro(1009, "NUEVO ", "NUEVA DESCRIPCION ");
		$data = $objParametro->Set_Parametro(1011, "NUEVO ", "NUEVA DESCRIPCION ");
		$data = $objParametro->Set_Parametro(1009, "NUEVO ", "NUEVA DESCRIPCION ");
		$data = $objParametro->Set_Parametro(1009, "NUEVO ", "NUEVA DESCRIPCION ");
		$data = $objParametro->Set_Parametro(1009, "NUEVO ", "NUEVA DESCRIPCION ");
		$data = $objParametro->Set_Parametro(1009, "NUEVO ", "NUEVA DESCRIPCION ");
		$data = $objParametro->Set_Parametro("nueoo", "NUEVO ", "NUEVA DESCRIPCION ");
		$data = $objParametro->Set_Parametro(1009, "NUEVO ", "NUEVA DESCRIPCION ");
	$objParametro->commit() ;

		echo "insert  : ". count($data["cuerpo"])."<br>";
		echo $data["cuerpo"][0]["nParCodigo"]."<br>" ;
		echo $data["cuerpo"][0]["cParJerarquia"]."<br>" ;
}catch(Exception $e ){
	$objParametro->rollback() ;

}


?>