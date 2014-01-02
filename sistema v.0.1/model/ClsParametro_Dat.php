<?php
	/*
		Autor			:	ARMANDO ENRIQUE PISFIL PUEMAPE
	  	Fecha			:	28/12/2013
	  	Clase			:	ClsParametro_Dat
		Estado			:	OK
	*/

	Class ClsParametro_Dat extends ClsConexion
	{
		#  FUNCIÓN PARA FILTRAR PARAMETRO
		function Filtrar_Parametro($objBeanParametro)
		{
			$nOriReg         = $objBeanParametro->getnOriRegistros() ;
			$nCanReg         = $objBeanParametro->getnNumRegMostrar() ;
			$nPagRegistro    = $objBeanParametro->getnPagRegistro() ;
			$nParClase       = $objBeanParametro->getnParClase() ;
			$cParNombre      = $objBeanParametro->getcParNombre() ;
			$cParDescripcion = $objBeanParametro->getcParDescripcion() ;

			$this->query="Call usp_Filtrar_Parametro($nOriReg, $nCanReg, $nPagRegistro, '$cParNombre', '$cParDescripcion', $nParClase)";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}
		# INSERTAR
		function Set_Parametro($objBeanParametro ) {
			$nParClase       = $objBeanParametro->getnParClase() ;
			$cParNombre      = $objBeanParametro->getcParNombre() ;
			$cParDescripcion = $objBeanParametro->getcParDescripcion() ;

			$this->query="Call usp_Set_Parametro($nParClase, '$cParNombre', '$cParDescripcion' )";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}

		# Filtrar un parametro
		function Get_Parametro_By_Todos($objBeanParametro ) {
			$nParCodigo      = $objBeanParametro->getnParCodigo() ;
			$nParClase       = $objBeanParametro->getnParClase() ;
			$cParJerarquia   = $objBeanParametro->getcParJerarquia() ;
			$cParNombre      = $objBeanParametro->getcParNombre() ;
			$cParDescripcion = $objBeanParametro->getcParDescripcion() ;
			$nParTipo        = $objBeanParametro->getnParTipo() ;

			$this->query="Call usp_Get_Parametro_By_Todos($nParCodigo, $nParClase, '$cParJerarquia' , '$cParNombre', '$cParDescripcion' , $nParTipo )";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}


	}
?>