<?php

$xajax->registerFunction("Validar_Acceso");
$xajax->registerFunction("MostrarMenus");
$xajax->registerFunction("Menus_Botonera");


	# Funcion que muestra los datos de todos los condcutores registrados
		function Validar_Acceso($frm)
		{
			$objUsuario = new Clsusuario_Dat();
			$MsjAlert = "";
			if ((empty($frm['Usuario_']))&&(empty($frm['UsuarioPassword_'])))
				{
					$MsjAlert .= "<span class='msjalert'>Ingrese Usuario y Clave</span>";
				}
			elseif(empty($frm['Usuario_']))
				{
					$MsjAlert .= "<span class='msjalert'>Ingrese Usuario  </span>";
				}
			elseif (empty($frm['UsuarioPassword_']))
				{
					$MsjAlert .= "<span class='msjalert'>Ingrese Contraseña </span>";
				}
			else
				{
					$clave=md5($frm['UsuarioPassword_']);
					$objBeanUser = new Bean_PerUsuario() ;
					$objBeanUser->setcPerUsuCodigo($frm['Usuario_']) ;
					$objBeanUser->setcPerUsuClave($clave) ;
					$data =$objUsuario->Get_Usuario_By_Clave_UserName($objBeanUser);
					if(count($data["cuerpo"])>0)
					{
						@session_start();
						$_SESSION['S_usuario']=$data["cuerpo"][0]["cPerCodigo"];
						$_SESSION['S_user_name']=$data["cuerpo"][0]["cPerNombre"]  . " " .$data["cuerpo"][0]["cPerApellidos"]  ;

						# **********************************************************************
						# ********Registro la activacion del usuario**********************
							Insertar_Transaccion(36,"Ingreso al Sistema","") ;
						//**********************************************************************

					}
					else
					{
						$MsjAlert .= "<span class='msjalert'>El usuario o contrasena son incorrectos </span>";
					}
				}
			$objResponse = new xajaxResponse();

			if ($MsjAlert=="")
				{$objResponse->redirect("sistema.php", 0); }
			else
				{$objResponse->assign("msjlogueo","innerHTML",$MsjAlert); }

			return $objResponse;
		}
	# Mostrar Menus y submenus
		function MostrarMenus($nModCodigo)
		{
				$objUsuario = new ClsUsuario_Dat();
				$data =$objUsuario->Get_Permisos_By_Usuario(1,0,0,0,5000,$_SESSION['S_usuario'],$nModCodigo);

				$menu = '<ul class="nav">';
				if ($data["cuerpo"] > 0)
				{
					for ($i = 0; $i < count($data["cuerpo"]); $i++)
		            {
		            	if($data["cuerpo"][$i]["CanJerarquia"]==4)
		            	{
		            		$menu .= '<li> ' ;
							$menu .= '	<a href="#" class="primero" onclick="xajax_Menus_Botonera('.$data["cuerpo"][$i]["nPerUsuAccCodigo"].')">'.$data["cuerpo"][$i]["NombreMenu"].'</span> <span class="flecha">&#9660;</span></a> ';
							$menu .= subMenu($data["cuerpo"][$i]["CanJerarquia"] , $data["cuerpo"][$i]["cParJerarquia"], $nModCodigo ) ;

							$menu .='</li>'."\n" ;
		            	}
		            }
				}
				$menu .= '</ul>';

				$respuesta = new xajaxResponse();
				$respuesta->assign("contenedorMenu","innerHTML",$menu);
				return $respuesta;
		}
	# funciona recursiva para mostrar submenus n niveles
		function subMenu($CanJerarquia ,$cParJerarquia ,$nModCodigo  )
		{
			$objUsuario = new ClsUsuario_Dat();
			$dataSubmenu =$objUsuario->Get_SubPermisos_By_Usuario_Jerarquia(1,0,0,0,5000,1,$CanJerarquia ,$cParJerarquia ,$nModCodigo,$CanJerarquia );

			$submenu = "";
			if (count($dataSubmenu["cuerpo"]) > 0)
			{
				$submenu .= "<ul>" ."\n";
					for ($i = 0; $i < count($dataSubmenu["cuerpo"]); $i++)
					{
		            			$submenu .= '<li> ' ;
								$submenu .= '	<a href="#"  onclick="xajax_Menus_Botonera('.$dataSubmenu["cuerpo"][$i]["nPerUsuAccCodigo"].'); '.$dataSubmenu["cuerpo"][$i]["cParNombre"].'" >'.$dataSubmenu["cuerpo"][$i]["NombreMenu"].'</span> <span class="flecha">&#9654;</span></a>' ;
								$submenu .=	subMenu($dataSubmenu["cuerpo"][$i]["CanJerarquia"] , $dataSubmenu["cuerpo"][$i]["cParJerarquia"], $nModCodigo) ;
								$submenu .= '</li> '."\n" ;

		            }
		        $submenu .= "</ul>"."\n" ;
			}
			return $submenu ;
		}
	# funciona para mostrar Botonera para un menus
		function Menus_Botonera($Id_Men)
		{
			$objResponse = new xajaxResponse();
			$objUsuario  = New ClsUsuario_Dat();
			$botonera ="";
			$data =$objUsuario->Get_Permisos_Botonera_By_Usuario(1,0,0,0,5001,$_SESSION['S_usuario'],5001,1000,5000,$Id_Men);

			if (count($data["cuerpo"]) > 0)
			{
				$botonera .='<ul class="botonera text-right"> ' ;
					for ($i = 0; $i < count($data["cuerpo"]); $i++)
					{
						$botonera .= '<li>
									<a href="#" id="'.$data["cuerpo"][$i][8].'" onclick="'.$data["cuerpo"][$i][10].'"  title="'.$data["cuerpo"][$i][8].'" ><i class="'.$data["cuerpo"][$i][7].'"> </i></a>
								 </li> ' ;
					}

				$botonera .= '</ul>' ;
			}

				#llenamos el beans
				$objBeanParametro = new Bean_Parametro() ;
				$objBeanParametro->setnParCodigo($Id_Men) ;
				$objBeanParametro->setnParClase(5000) ;
				$objBeanParametro->setcParJerarquia('-') ;
				$objBeanParametro->setcParNombre('-') ;
				$objBeanParametro->setcParDescripcion('-') ;
				$objBeanParametro->setnParTipo(0) ;

				$objParametro = new ClsParametro_Dat();
				$data =$objParametro->Get_Parametro_By_Todos($objBeanParametro);
				$Titulo ="";
				if (count($data["cuerpo"]) > 0)
				{
						$Titulo .= $data["cuerpo"][0]["cParDescripcion"];
		        }

			$objResponse->assign("ContenedorBotonera","innerHTML",$botonera);
			$objResponse->assign("NombreMenu","innerHTML",$Titulo);
			return $objResponse;
		}
?>