<?php
require_once "../../model/ClsConexion.php" ;
require_once "../../model/ClsUsuario_Dat.php" ;
	$objUsuario = new ClsUsuario_Dat();
		$data =$objUsuario->Get_Permisos_By_User(1,0,0,0,5000,1,90);

		$menu = '<ul class="nav">';
		$menu .=	menu($data , 90) ;
		$menu .= '</ul>';

		echo $menu ;

		// var_dump($data) ;

		function menu($data , $nModCodigo )
		{

			$menu = "" ;
			if ($data["cuerpo"] > 0)
			{
				for ($i = 0; $i < count($data["cuerpo"]); $i++)
	            {
	            	if($data["cuerpo"][$i]["CanJerarquia"]==4)
	            	{
	            		$menu .= '<li> ' ;
						$menu .= '	<a href="#" class="primero" onclick="xajax_Mant_Menus('.$data["cuerpo"][$i][4].')">'.($data["cuerpo"][$i][8]).'</span> <span class="flecha">&#9660;</span></a> ';
						$menu .= subMenu($data["cuerpo"][$i]["CanJerarquia"] , $data["cuerpo"][$i]["cParJerarquia"], $nModCodigo ) ;

						$menu .= $data["cuerpo"][$i]["CanJerarquia"] . " " . $data["cuerpo"][$i]["cParJerarquia"].'</li>'."\n" ;
	            	}
	            }
			}
			return $menu ;

		}

		function subMenu($CanJerarquia ,$cParJerarquia ,$nModCodigo  )
		{
			$objUsuario = new ClsUsuario_Dat();
			$dataSubmenu =$objUsuario->Get_SubPermisos_By_User(1,0,0,0,5000,1,$CanJerarquia ,$cParJerarquia ,$nModCodigo,$CanJerarquia );

			$submenu = "";
			if (count($dataSubmenu["cuerpo"]) > 0)
			{
				$submenu .= "<ul>" ."\n";
					for ($i = 0; $i < count($dataSubmenu["cuerpo"]); $i++)
					{
		            			$submenu .= '<li> ' ;
								$submenu .= '	<a href="#" class="primero" onclick="xajax_Mant_Menus('.$dataSubmenu["cuerpo"][$i][4].')">'.($dataSubmenu["cuerpo"][$i][8]).'</span> <span class="flecha">&#9654;</span></a>' ;
								$submenu .=	subMenu($dataSubmenu["cuerpo"][$i]["CanJerarquia"] , $dataSubmenu["cuerpo"][$i]["cParJerarquia"], $nModCodigo) ;
								$submenu .= '</li> '."\n" ;

		            }
		        $submenu .= "</ul>"."\n" ;
			}
			return $submenu ;
		}

		/*function subMenu($dataSubmenu , $nPerUsuAccCodigo , $lenJerarquia)
		{
			$submenu = "";
			if ($data["cuerpo"] > 0)
			{
				$submenu .= "<ul>" ;
					for ($i = 0; $i < count($data["cuerpo"]); $i++)
		            {
		            	if($data["cuerpo"][$i]["CanJerarquia"]==$lenJerarquia)
		            	{
		            		if(substr($data["cuerpo"][$i]["nPerUsuAccCodigo"] , 0 , strlen($nPerUsuAccCodigo) )== $nPerUsuAccCodigo)
		            		{
		            			$submenu .= '<li> ' ;
								$submenu .= '	<a href="#" class="primero" onclick="xajax_Mant_Menus('.$data["cuerpo"][$i][4].')">'.($data["cuerpo"][$i][8]).'</span> <span class="flecha">&#9654;</span></a>' ;
								$submenu .=	subMenu($data , $data["cuerpo"][$i][4] , $data["cuerpo"][$i]["CanJerarquia"]+2) ;
								$submenu .= '</li>';
		            		}

		            	}
		            }
		        $submenu .= "</ul>" ;
			}
			return $submenu ;
		}*/


## mostrar menus
			function Menuw(){
				$objResponse = new xajaxResponse();
				$objExtra	 = new ClsExtra_Datos();
				$Menu = "";
				$target="";

				$AdoRs = $objExtra->Menu();
				while ($Row = $AdoRs->fetch_array()) {


					$Menu.=	"<li>";
					$Menu.=		"<a href='".$Row["enlace"]."' $target>";
					$Menu.=			"<span>".$Row["cParDescripcion"]."</span>";
					$Menu.=		"</a>";
					$SubMenu = SubMenu($Row["cParJerarquia"], $Row["nivel"]);
					if ($SubMenu!=""){
						$Menu.=	"<div>";
						$Menu.=		"<ul>";
						$Menu.=			$SubMenu;
						$Menu.=		"</ul>";
						$Menu.=	"</div>";
					}
					$Menu.=	"</li>";
				}
				$objResponse->assign("menu_web", "innerHTML", $Menu);
				#$objResponse->alert("hola");
				return $objResponse;
			}
		## mostrar sub-menus
			function SubMenuw($jeranquia, $nivel){
				# objeto
					$objExtra = new ClsExtra_Datos();
				# variables
					$Menu = "";
					$SubMenu="";
					$target="";
				# consulta
					$AdoRs = $objExtra->SubMenu($jeranquia, $nivel);
				# recorrido
				while ($Row = $AdoRs->fetch_array()) {
					$SubMenu = SubMenu($Row["cParJerarquia"], $Row["nivel"]);

					$Menu.="<li>";
					$Menu.=	"<a href='".$Row["enlace"]."' $target ";
					# agregar clase a la etiqueta
					if($SubMenu!=""){
						$Menu.="class='parent'";
					}
					$Menu.="><span>".$Row["cParDescripcion"]."</span></a>";
					# agregando sub-menu al menu
					if($SubMenu!=""){
						$Menu.=	"<div>";
						$Menu.=		"<ul>";
						$Menu.=			$SubMenu;
						$Menu.=		"</ul>";
						$Menu.=	"</div>";
					}
					$Menu.="</li>";
				}
				return $Menu;
			}

?>