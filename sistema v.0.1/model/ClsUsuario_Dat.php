<?php
	/*
		Autor			:	ARMANDO ENRIQUE PISFIL PUEMAPE
	  	Fecha			:	31/12/2013
	  	Clase			:	ClsUsuario_Dat
		Estado			:	OK
	*/

	Class ClsUsuario_Dat extends ClsConexion
	{
		//Funcion Verificar si existe el Usuario
		function Get_Usuario_By_Clave_UserName($objBeanUsuario)
		{
			$cUserName  = $objBeanUsuario->getcPerUsuCodigo() ;
			$cUserClave = $objBeanUsuario->getcPerUsuClave() ;

			$this->query="call usp_Get_Usuario_By_Clave_UserName('$cUserName','$cUserClave')";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}
		# Funcion Para seleccionar los Permisos de los Usuarios
		function Get_Permisos_By_Usuario($nPerTipo, $nPerEstado, $nPerUsuEstado, $nPerUsuAccEstado, $nParClase, $nPercodigo, $nPerUsuAccGrupo)
		{
			$this->query="Call usp_Get_Permisos_By_Usuario($nPerTipo, $nPerEstado, $nPerUsuEstado, $nPerUsuAccEstado, $nParClase, $nPercodigo, $nPerUsuAccGrupo)";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}

		//Funcion que muestra los SubPermisos de un Usuario
		function Get_SubPermisos_By_Usuario_Jerarquia($nPerTipo, $nPerEstado, $nPerUsuEstado, $nPerUsuAccEstado, $nParClase, $nPercodigo,$nCanJerarquia,$cJerarquia, $nPerUsuAccGrupo, $nParJeraquia)
		{
			$this->query="Call usp_Get_SubPermisos_By_Usuario_Jerarquia($nPerTipo, $nPerEstado, $nPerUsuEstado,$nPerUsuAccEstado, $nParClase, $nPercodigo,$nCanJerarquia,'$cJerarquia', $nPerUsuAccGrupo,$nParJeraquia)";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}

		//Funcion Para seleccionar los Permisos de los Usuarios(BOTONERA)
		function Get_Permisos_Botonera_By_Usuario(	$nPerTipo,
												$nPerEstado,
												$nPerUsuEstado,
												$nPerUsuAccEstado,
												$nParClase,
												$nPercodigo,
												$nPerUsuAccGrupo,
												$nParTipo,
												$nParSrcClase,
												$nParSrcCodigo)
		{
			$this->query="Call usp_Get_Permisos_Botonera_By_Usuario($nPerTipo, $nPerEstado, $nPerUsuEstado, $nPerUsuAccEstado, $nParClase, $nPercodigo, $nPerUsuAccGrupo, $nParTipo, $nParSrcClase, $nParSrcCodigo)";
			$this->execute_query();
			$data = $this->rows ;
			return $data;
		}



	}
?>