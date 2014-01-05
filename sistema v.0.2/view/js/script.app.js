;
/*OCULTANDO EMERGENTE*/
var jqn= jQuery.noConflict();

	function js_seleccionar_fila(tr_id)
	{
		// Obtenemos el Objeto Padre
			// objpadre = jqn(obj).parents() ;

			// Hacemos Visible el Hermono Oculta

			jqn('#tbodyData>tr').removeClass("add-background-tr") ;
			jqn('#'+tr_id).addClass("add-background-tr") ;
			// jqn('#'+tr_id).css("background","#ccc") ;
			// alert("holas") ;
	}
