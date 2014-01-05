;
/*OCULTANDO EMERGENTE*/
function ocultar_emergente()
{
	var jq= jQuery.noConflict();
    /* jq("#emergente").fadeOut(500);
     jq("#vidrio").fadeOut(800);*/
    jq("#emergente").css("display","none");
    jq("#vidrio").css("display","none");

    return false;
}

function mostrar_emergente()
{
	// PARA QUE JQUERY NO HAGA COMFLICTO CON LA DEMAS LIBRERIAS
 		var jq= jQuery.noConflict();
 	// ancho y alto del navegador
		w = jq(window).width();
		h = jq(window).height();
	// ancho y alto del emergente
		var ancho_popup = jq("#emergente").width() ;
		var alto_popup  = jq("#emergente").height();
   //Centra el popup
	   w = (w/2) - (ancho_popup/2) - 5 ;
	   h = (h/2) - (alto_popup/2);
	// darle posicion del div
	   jq("#emergente").css("left",w + "px");
	   jq("#emergente").css("top",h + "px");
    	jq("#vidrio").css("display","block");
	//  animamos
     jq("#emergente").fadeIn(1000);
     // jq("#emergente").slideDown();
     return false;
}
