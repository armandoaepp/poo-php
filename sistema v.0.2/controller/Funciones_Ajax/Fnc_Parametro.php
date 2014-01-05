<?php
	#REGISTRO DE FUNCTIONs PARA DAR MANTENIMIENTO A CUALQUIER PARAMETRO
		$xajax->registerFunction("Listar_Parametros");
		$xajax->registerFunction("Filtrar_Parametro");
		$xajax->registerFunction("Nuevo_Parametro");
		$xajax->registerFunction("Insertar_Parametro");
		$xajax->registerFunction("Editar_Parametro");
		$xajax->registerFunction("Actualizar_Parametro");
		$xajax->registerFunction("Eliminar_Parametro");
		$xajax->registerFunction("ConfEliminar_Parametro");
		$xajax->registerFunction("Reportes_Parametro");
		$xajax->registerFunction("Configurar_Parametro");

		/**
		 * [Configurar_Parametro FUNCION QUE CARGA LOS DATOS PARA CONFIGURA LA LISTA Y FOMULARIO DEL PARAMETRO ]
		 * @param [type] $nParClase [CLASE DEL PARAMETRO]
		 * @param string $funcion   [FUNCION QUE VA CARGAR ESTO SI ES QUE ACCEDO AL FORMULARIO DESDE OTRO INTERFAZ]
		 */
			function Configurar_Parametro($nParClase , $funcion ="")
			{
				$objResponse = new xajaxResponse();

				$objBeanParametro = new  Bean_Parametro() ;
				$objBeanParametro->setnParClase($nParClase) ;
				# cargamos  el parametro padre nParCodigo: 0 y nParEstado : 0
				$objParametro = new ClsParametro_Dat();
				$data = $objParametro->Get_Parametro_Padre_nParClase($objBeanParametro );


				$cParNombre = "";
				if(count($data["cuerpo"])>0)
				{
					$cParNombre=Mayusc($data["cuerpo"][0]["cParNombre"]);
				}

				if(empty($funcion))
				{
					$FuncionCargar = "xajax_Listar_Parametros(0,10,1,1);"  ;
					$objResponse->script($FuncionCargar);
				}
				else
				{
					$FuncionCargar = $funcion ;
				}
				// $objResponse->alert($cParNombre) ;

				@session_start();
				$_SESSION["S_cParNombre"]    =  $cParNombre ;
				$_SESSION["S_nParClase"]     =  $nParClase ;
				$_SESSION["S_Fnc_ListarPar"] =  $FuncionCargar ;

				$objBeanParametro = null;
				return $objResponse ;
			}

		# LISTA PARAMETRO
			function Listar_Parametros($nOriRegistros, $nNumRegMostrar, $nPagRegistro, $nPagAct)
			{
					$objResponse = new xajaxResponse();
					$objParametro = new ClsParametro_Dat();

					$formulario ='';
					$formulario .= ' <div class="ContenedorTable">
							<table style="width:100%;" >
								<tr class="title-table" >
									<td  style="width:20%;">&nbsp; C&oacute;digo</td>
									<td  style="width:35%;">&nbsp;abreviatura </td>
									<td  style="width:45%;">&nbsp;'.$_SESSION["S_cParNombre"].'</td>
								</tr>
						    	<tr class="vform">
									<td>
									    <input  type="search" disabled="disabled" name="" placeholder="" />
									</td>
									<td>
						    		    <input type="search" name="cParNombre_" id="cParNombre_" placeholder="Buscar por Codigo"
						    		    value=""
										onkeyup="xajax_Filtrar_Parametro('.$nOriRegistros.', '.$nNumRegMostrar.', '.$nPagRegistro.', '.$nPagAct.',  xajax.getFormValues(FrmPrincipal) );"
					    		    	onsearch="xajax_Filtrar_Parametro('.$nOriRegistros.', '.$nNumRegMostrar.', '.$nPagRegistro.', '.$nPagAct.',  xajax.getFormValues(FrmPrincipal) );" />

									</td>
									<td>
						    		    <input type="search" name="cParDescripcion_" id="cParDescripcion_" placeholder="Buscar '.$_SESSION["S_cParNombre"].'"
						    		    value=""
										onkeyup="xajax_Filtrar_Parametro('.$nOriRegistros.', '.$nNumRegMostrar.', '.$nPagRegistro.', '.$nPagAct.',  xajax.getFormValues(FrmPrincipal) );"
					    		    	onsearch="xajax_Filtrar_Parametro('.$nOriRegistros.', '.$nNumRegMostrar.', '.$nPagRegistro.', '.$nPagAct.',  xajax.getFormValues(FrmPrincipal) );" />
									</td>
								</tr>
								<tbody id="tbodyData" class="table table-hover table-border">

								</tbody>
						    </table>
						    </div>';

					$formulario="<center>".$formulario."</center>";
				    $objResponse->assign("ContenedorPrincipal","innerHTML",$formulario);
				    $objResponse->script("xajax_Filtrar_Parametro('".$nOriRegistros."', '".$nNumRegMostrar."', '".$nPagRegistro."', '".$nPagAct."',  xajax.getFormValues(FrmPrincipal) );");

					return $objResponse;
			}

		# FILTAR PARAMETRO
			function Filtrar_Parametro($nOriRegistros, $nNumRegMostrar, $nPagRegistro, $nPagAct, $frm)
			{
				$objResponse = new xajaxResponse();
				$objParametro = new ClsParametro_Dat();

				if(empty($frm["cParDescripcion_"]))
				{
					 $cParDescripcion="-";
				}else{
					$cParDescripcion=$frm["cParDescripcion_"];
				}
				if(empty($frm["cParNombre_"]))
				{
					 $cParNombre="-";
				}else{
					 $cParNombre=$frm["cParNombre_"];
				}
					#Se Instrancia la clase Bean_Parametro en un objeto y se encapasula los con los datos
				    $objBeanParametro = new  Bean_Parametro() ;
			    	$objBeanParametro->setnOriRegistros(0) ;
					$objBeanParametro->setnNumRegMostrar(0) ;
					$objBeanParametro->setnPagRegistro(0) ;//que no pagine
					$objBeanParametro->setnParClase($_SESSION["S_nParClase"]) ;
					$objBeanParametro->setcParNombre($cParNombre) ;
					$objBeanParametro->setcParDescripcion($cParDescripcion) ;
					# se llama a la funciona(sin paginado) y se le envia el objeto
			    	$AdoRs =$objParametro->Filtrar_Parametro($objBeanParametro);

			   		 #Capturar el número de registros de acuerdo al objeto que se le envia y los datos qye recibe es un array
			    	$nNumRegExist = count($AdoRs["cuerpo"]);

				    #Filtrar registros deacuerdo al origen de datos y y viene paginados
				    $objBeanParametro->setnOriRegistros($nOriRegistros) ;
					$objBeanParametro->setnNumRegMostrar($nNumRegMostrar) ;
					$objBeanParametro->setnPagRegistro($nPagRegistro) ;

			    	$data =$objParametro->Filtrar_Parametro($objBeanParametro);

			    $formulario= "";
				$Paginacion="&nbsp;";
				# se verifica que el array tenga datos
				if (count($data["cuerpo"]) > 0)
				{
					# se recorre el array y se extraer cada uno de los registros
					for ($i = 0; $i < count($data["cuerpo"]); $i++)
		            {
	            		$formulario.="<tr id='tr".$i."'>";
	                    $formulario.= 	"<td>";
	                    $formulario.=      "<label for='rdCodigo".$i."'> ";
	                    $formulario.=	   		'<input type="radio" value="'.$data["cuerpo"][$i]["nParCodigo"].'" name="rdCodigo" id="rdCodigo'.$i.'" onclick="js_seleccionar_fila(\'tr'.$i.'\');" />';
	                    $formulario.=      "".substr("0000".$data["cuerpo"][$i]["nParCodigo"],-5)."</label>";
	                    $formulario.=  	"</td>";
					   	$formulario.= 	"<td>".$data["cuerpo"][$i]["cParNombre"]."</td>";
					   	$formulario.= 	"<td>".$data["cuerpo"][$i]["cParDescripcion"]."</td>";
						$formulario.="</tr>";
			        }
			        #$nNumRegExist, $nNumRegMostrarxPag, $nPagAct,  $cNameFunction, $frm , $ncantlink = 10
					$Paginacion= Paginar($nNumRegExist, $nNumRegMostrar,  $nPagAct, 'xajax_Filtrar_Parametro', 'xajax.getFormValues(FrmPrincipal)');

					$objResponse->assign("tbodyData","innerHTML",$formulario);
			   		$objResponse->assign("ContenedorPaginado","innerHTML",$Paginacion);
				}
				else
				{
					$objResponse->assign("tbodyData","innerHTML",$formulario);
			   		$objResponse->assign("ContenedorPaginado","innerHTML",$Paginacion);
				}

				return $objResponse;
			}

		#MOSTRAR FRM NUEVO
			function Nuevo_Parametro()
			{
				$objResponse = new xajaxResponse();
				#Formulario
				$formulario = Frm_Parametro("Insertar_Parametro");
				# configurando emergente
					$FrmRpta = FrmEmergente("NUEVO ".$_SESSION["S_cParNombre"], $formulario);
					$objResponse->script("mostrar_emergente();");
					// $objResponse->assign("emergente","style.height","140px");
					$objResponse->assign("emergente_contenido","innerHTML",$FrmRpta);

				return $objResponse;
			}

		#INSERTAR
			function Insertar_Parametro($frm)
			{
				$objResponse = new xajaxResponse();

			  	$objBeanParametro = new  Bean_Parametro() ;
			  	$objBeanParametro->setnParClase($_SESSION["S_nParClase"]) ;
				$objBeanParametro->setcParNombre(Mayusc($frm["txtcParNombre"]));
				$objBeanParametro->setcParDescripcion(Mayusc($frm["txtcParDescripcion"])) ;

				$objParametro = new ClsParametro_Dat();

				$MsjAlter = "";
				$Funcion = "#";

				if(empty($frm["txtcParNombre"]))
				{
					$MsjAlter = "Completar abreviatura.";
				}
				elseif(empty($frm["txtcParDescripcion"]))
				{
					$MsjAlter = "Completar descripci&oacute;n.";
				}

				if($MsjAlter=="")
				{
			    	$dataValida = $objParametro->Validar_Parametro($objBeanParametro);
			        #VALIDAR
				        if(count($dataValida["cuerpo"])>0){
	        				$MsjAlter= ".::YA EXISTE UN REGISTRO IDENTICO::.";
				        }
				        else{
				        	try
				        	{	# iniciamos la transaccion
				        		$objParametro->beginTransaction() ;
				        		$data = $objParametro->Set_Parametro($objBeanParametro);
								Insertar_Transaccion(101,"ACTUALIZO ".$_SESSION["S_cParNombre"]." - nParCodigo : ".$frm["txtnParCodigo"]."- nParClase : ".$_SESSION["S_nParClase"]." - cParDescripcion : ".Mayusc($frm["txtcParDescripcion"]),"") ;
								# si todo a tendido exito
				        		$objParametro->commit();

								$Funcion = $_SESSION["S_Fnc_ListarPar"] ." ocultar_emergente();";
				        	}catch(Exception $e)
				        	{
				        		# si ha habido algun error
				        		$objParametro->rollback();
				        		$MsjAlter =  "Error de registro.";
				        	}
			        	}
				}

				$objResponse->assign("labelMsj","innerHTML",$MsjAlter);
				$objResponse->script($Funcion);
				return $objResponse;
			}

		# MOSTRAR FRM EDITAR
			function Editar_Parametro($frm)
			{
				$objResponse = new xajaxResponse();

				$formulario = "";
				if (!empty($frm["rdCodigo"])) {
					$objBeanParametro = new  Bean_Parametro() ;
				  	$objBeanParametro->setnParClase($_SESSION["S_nParClase"]) ;
					$objBeanParametro->setnParCodigo($frm["rdCodigo"]);

					$objParametro = new ClsParametro_Dat();
					$data	= $objParametro->Buscar_Parametro($objBeanParametro);
					if(count($data["cuerpo"])>0)
					{
						$nnParCodigo=$data["cuerpo"][0]["nParCodigo"];
						$cParDescripcion=Mayusc($data["cuerpo"][0]["cParDescripcion"]);
						$cParNombre=Mayusc($data["cuerpo"][0]["cParNombre"]);

						// Llamamo al la Funcion del Formulario Modal Parameto enviadoles los datos
						$formulario .= Frm_Parametro("Actualizar_Parametro",$nnParCodigo,$cParDescripcion,$cParNombre);
					 }
				}
				else{
					# muesta el mensaje de seleccionar registro
				    $formulario = SeleccionarRegistro() ;
				}
				$FrmRpta = FrmEmergente("ACTUALIZAR ".$_SESSION["S_cParNombre"], $formulario);

				$objResponse = new xajaxResponse();
				$objResponse->script("mostrar_emergente();");
				$objResponse->assign("emergente_contenido","innerHTML",$FrmRpta);

				return $objResponse;
			}

		#ACTUALIZAR
			function Actualizar_Parametro($frm)
			{
				$objResponse = new xajaxResponse();

				$MsjAlter = "";
				$Funcion = "#";

				if(empty($frm["txtcParNombre"])){
					$MsjAlter = "Completar Abreviatura.";
				}
				if(empty($frm["txtcParDescripcion"])){
					$MsjAlter = "Completar ".$_SESSION["S_cParNombre"];
				}

				if($MsjAlter==""){

					$objBeanParametro = new  Bean_Parametro() ;
				  	$objBeanParametro->setnParClase($_SESSION["S_nParClase"]) ;
					$objBeanParametro->setnParCodigo($frm["txtnParCodigo"]);
					$objBeanParametro->setcParNombre(Mayusc($frm["txtcParNombre"]));
					$objBeanParametro->setcParDescripcion(Mayusc($frm["txtcParDescripcion"])) ;

					$objParametro = new ClsParametro_Dat();
					try
		        	{	# iniciamos la transaccion
		        		$objParametro->beginTransaction() ;
		        		$objParametro->Upd_Parametro($objBeanParametro);
						Insertar_Transaccion(102,"ACTUALIZO ".$_SESSION["S_cParNombre"]." - nParCodigo : ".$frm["txtnParCodigo"]."- nParClase : ".$_SESSION["S_nParClase"]." - cParDescripcion : ".Mayusc($frm["txtcParDescripcion"]),"") ;
						# si todo a tendido exito
		        		$objParametro->commit();

						$Funcion = $_SESSION["S_Fnc_ListarPar"] ." ocultar_emergente();";
		        	}catch(Exception $e)
		        	{
		        		# si ha habido algun error
		        		$objParametro->rollback();
		        		$MsjAlter =  "Error de registro.";
		        	}
				}


				$objResponse->assign("labelMsj","innerHTML",$MsjAlter);
				$objResponse->script($Funcion);
				return $objResponse;
			}

		#MOSTRAR ELIMINAR
			function Eliminar_Parametro($frm)
			{
				$objResponse = new xajaxResponse();

				if(empty($frm["rdCodigo"]))
					$rdCodigo = "";
				else
					$rdCodigo = $frm["rdCodigo"];

				$formulario = FrmEliminar("ConfEliminar_Parametro",$rdCodigo);

				$FrmRpta = FrmEmergente("ELIMINAR ".$_SESSION["S_cParNombre"], $formulario);
				$objResponse->script("mostrar_emergente();");
				$objResponse->assign("emergente_contenido","innerHTML",$FrmRpta);

				return $objResponse;
			}

		#CONFIRMAR ELIMINACION
			function ConfEliminar_Parametro($nParCodigo)
			{
				$objResponse = new xajaxResponse();

				$MsjAlter = "";
				$Funcion = "#";

				$objBeanParametro = new  Bean_Parametro() ;
			  	$objBeanParametro->setnParClase($_SESSION["S_nParClase"]) ;
				$objBeanParametro->setnParCodigo($nParCodigo);
				$objBeanParametro->setnParTipo(0);

				try
	        	{
					$objParametro = new ClsParametro_Dat();
	        		# iniciamos la transaccion
	        		$objParametro->beginTransaction() ;
					$objParametro->Upd_Estado_Parametro($objBeanParametro);
					Insertar_Transaccion(103,"ELIMINO ".$_SESSION["S_cParNombre"]." - nParCodigo : ".$nParCodigo."- nParClase : ".$_SESSION["S_nParClase"],"") ;

					# si todo a tendido exito
	        		$objParametro->commit();

					$Funcion = $_SESSION["S_Fnc_ListarPar"] ." ocultar_emergente();";
	        	}
	        	catch(Exception $e)
	        	{
	        		# si ha habido algun error
	        		$objParametro->rollback();
	        		$MsjAlter =  "Error de registro.";
	        	}

				$objResponse->assign("labelMsj","innerHTML",$MsjAlter);
				$objResponse->script($Funcion);
				return $objResponse;
			}

		#FRM NUEVO / ACTUALIZAR
			function Frm_Parametro($funcion="",$nParCodigo="",$cParDescripcion="",$cParNombre="")
			{
					$formulario ="";
				    $formulario .='
				    	<div class="vform vformContenedor">
				    		<input type="hidden" name="txtnParCodigo" value="'.$nParCodigo.'" />
							<fieldset class="c12" >
								<fieldset class="c6" >
									<label for="txtcParNombre"> ABREVIATURA </label>
									<input class="inputs-text" type="text" id="txtcParNombre" name="txtcParNombre" placeholder ="INGRESE ABREVIATURA"  value="'.$cParNombre.'">
								</fieldset>
								<fieldset class="c6" >
									<label for="txtcParDescripcion">'.$_SESSION["S_cParNombre"].'  </label>
									<input class="inputs-text" type="text" id="txtcParDescripcion" name="txtcParDescripcion" placeholder ="INGRESE '.$_SESSION["S_cParNombre"].'" value="'.$cParDescripcion.'">
								</fieldset>
							</fieldset>
							'.botonRegistrar($funcion).'
						</div>
				    ';
					return $formulario;
			}

		# REPORTE DE ARTES DEPESCA
			function Reportes_Parametro($frm="")
			{
				$objBeanParametro = new  Bean_Parametro() ;
		    	$objBeanParametro->setnOriRegistros(0) ;
				$objBeanParametro->setnNumRegMostrar(0) ;
				$objBeanParametro->setnPagRegistro(0) ;
				$objBeanParametro->setnParClase($_SESSION["S_nParClase"]) ;
				$objBeanParametro->setcParNombre("-") ;
				$objBeanParametro->setcParDescripcion("-") ;

				$objParametro = new ClsParametro_Dat();
			    $data =$objParametro->Filtrar_Parametro($objBeanParametro);

				$objResponse = new xajaxResponse();

				$formulario= "";

				if (count($data["cuerpo"]) > 0)
				{
					$i=1;
					$formulario .= "<table class='table'>" ;
					$formulario .='
							<tr class="border-bottom">
								<th class="" style="width:20%;"> Número</th>
								<th class="" style="width: 30% ;">Abreviatura</th>
								<th class="" style="width: 50%;">'.$_SESSION["S_cParNombre"].'</th>
							</tr>
						' ;

					$formulario .= "<tbody>" ;

					for ($i = 0; $i < count($data["cuerpo"]); $i++)
	            	{
							$formulario.="<tr>";
		                    $formulario.= 	"<td style='text-align: center ;'>".$i." </td>";
						   	$formulario.= 	"<td>".$data["cuerpo"][$i]["cParNombre"]."</td>";
						   	$formulario.= 	"<td>".$data["cuerpo"][$i]["cParDescripcion"]."</td>";
							$formulario.="</tr>";
							$i++;
					}
					$formulario .= "</tbody>" ;
					$formulario .= "<tfoot>" ;
					$formulario .= " 	<tr>" ;
					$formulario .= " 	<td  colspan='3' class='border-top'>   </td>" ;
					$formulario .= " 	</tr>" ;

					$formulario .= "</tfoot>" ;

					$formulario .= "</table>" ;
				}

				$HTML ="<html>
							<body>
							<br/>
								<h3 class='rounded text-center mayusc title'>".$_SESSION["S_cParNombre"]."</h3>
								<br/>
							<div>
								".$formulario."
							</div>
							</body>
							</html>";

						$mpdf = new mPDF('utf-8', 'A4');
						$mpdf->mirrorMargins = 1;	// Use different Odd/Even headers and footers and mirror margins

						$mpdf->defaultheaderfontsize = 6;	/* in pts */
						// $mpdf->defaultheaderfontstyle = B;	/* blank, B, I, or BI */
						$mpdf->defaultheaderline = 1; 	/* 1 to include line below header/above footer */

						$mpdf->defaultfooterfontsize = 10;	/* in pts */
						$mpdf->defaultfooterfontstyle = B;	/* blank, B, I, or BI */
						$mpdf->defaultfooterline = 1; 	/* 1 to include line below header/above footer */

						$mpdf->SetHeader('GOBIERNO REGIONAL DE LAMBAYEQUE ||{DATE j/m/Y}' );
						$mpdf->SetFooter('{PAGENO}');	/* defines footer for Odd and Even Pages - placed at Outer margin */

						$stylesheet = file_get_contents('./css/style-pdf.css');
						$mpdf->WriteHTML($stylesheet,1);

						$mpdf->WriteHTML($HTML);

						$fichero = '../documents/grl.pdf';
						$mpdf->Output($fichero);


						$objResponse->script('window.open("'.$fichero.'", "_blank");return false;');
			    return $objResponse;
			}


?>