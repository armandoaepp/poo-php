<?php

session_start();
if (!isset($_SESSION['S_usuario'])) { header ("location:login.php"); exit;
};
include ("../model/Enlace.php");

?>

<!doctype html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Sistema de Administracíon </title>
    <?php $xajax->printJavascript();?>

	<meta name="description" content="Sistema de Administracion" />
	<meta name="author" content="Armando Enrique Pisfil Puemape" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<link rel="stylesheet" href="./css/maquetacion.css">
	<link rel="stylesheet" href="./css/style2014.css">

</head>
<body onload="xajax_MostrarMenus(90);">
	<!--Fondo Transparente-->
    <div id="vidrio">
    </div>
    <!-- Start Ventana Emergente-->
    <form id="frmEmergente" name="frmEmergente">
    <div id="emergente">
          <a href="#close" title="Close" onClick="ocultar_emergente();return false;">
          </a>
          <div id="emergente_contenido">

          </div>
    </div>
    </form>
    <!-- End Ventana Emergente-->


	<div class="grid">
		<div class="row">
			<div class="c12 ">
				<!-- START MENU -->
				<nav id="contenedorMenu"  class="menu">

				</nav>
				<!-- END MENU -->

				<div class="c12" >
						<div class="clear"></div>
						<div class="c4 text-left padding-small-top name-user"><i class="icon-user"> </i><?php echo $_SESSION['S_user_name'] ;?>  </div>
						<div id="NombreMenu" class="c6 text-left padding-small-top title-menu">Sistema de Gestión Comercial </div>
						<div class="c2 last text-right"><a href="Cerrar_Sesion.php" class="btn small"> <i class="icon-close"></i> Cerrar Sesión</a> </div>
				</div>
				<div class="clear"></div>
				<hr>
				<!-- Start Botonera  -->
				<div id="ContenedorBotonera" >

				</div>
				<!-- End Botonera -->

				<!-- Start Contenedor PRINCIPAL -->
				<div class="border-container padding-min-all " >
					<form id="FrmPrincipal" name="FrmPrincipal">
						<div id="ContenedorPrincipal">
							...
						</div>
					</form>
				</div>
				<!-- END Contenedor PRINCIPAL -->

				<!-- Sttart  Contenedor Paginado -->
				<div id="ContenedorPaginado" class="text-center">

				</div>
				<!-- End Contenedor Paginado -->


		</div>

	</div>
</body>
</html>