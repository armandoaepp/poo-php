<?php
class Bean_General
{
	# PAGINADO
	protected $nOriRegistros ;
	protected $nNumRegMostrar ;
	protected $nPagRegistro ;
	protected $nPagAct ;
	# ORIGEN DONDE EMPIEZA EL REGISTRO; POR DEFECTO QUE EMPIEZE A LISTAR DESDE EL 0
	public function setnOriRegistros($nOriRegistros_ = 0 ){ $this->nOriRegistros=$nOriRegistros_;}
	public function getnOriRegistros(){ return $this->nOriRegistros;}
	# NUMERO DE REGISTRO A MOSTRAR POR PAGINA: OR DEFECTO QUE LISTE 20
	public function setnNumRegMostrar($nNumRegMostrar_ = 20 ){ $this->nNumRegMostrar=$nNumRegMostrar_;}
	public function getnNumRegMostrar(){ return $this->nNumRegMostrar;}
	# 1 INDICE QUE SE PAGINA; 0 NO SE PAGINA
	public function setnPagRegistro($nPagRegistro_  = 0 ){ $this->nPagRegistro=$nPagRegistro_;}
	public function getnPagRegistro(){ return $this->nPagRegistro;}
	# PAGINA ACTUAL (NUMERO DE PAGINA EN LA QUE SE UBICA EL PAGINADO POR DEFECTO QUE SE UBIQUE EN LA PAGINA 1 )
	public function setnnPagAct($nnPagAct_ = 1 ){ $this->nnPagAct=$nnPagAct_;}
	public function getnnPagAct(){ return $this->nnPagAct;}

}
?>