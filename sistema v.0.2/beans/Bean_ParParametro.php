<?php
class Bean_ParParametro extends Bean_General
{
	# ParParametro
	protected $nParSrcCodigo;
	protected $nParSrcClase;
	protected $nParDstCodigo;
	protected $nParDstClase;
	protected $cValor;
	protected $nParEstado;
	public function setnParSrcCodigo($nParSrcCodigo_){ $this->nParSrcCodigo=$nParSrcCodigo_;}
	public function getnParSrcCodigo(){ return $this->nParSrcCodigo;}
	public function setnParSrcClase($nParSrcClase_){ $this->nParSrcClase=$nParSrcClase_;}
	public function getnParSrcClase(){ return $this->nParSrcClase;}
	public function setnParDstCodigo($nParDstCodigo_){ $this->nParDstCodigo=$nParDstCodigo_;}
	public function getnParDstCodigo(){ return $this->nParDstCodigo;}
	public function setnParDstClase($nParDstClase_){ $this->nParDstClase=$nParDstClase_;}
	public function getnParDstClase(){ return $this->nParDstClase;}
	public function setcValor($cValor_){ $this->cValor=$cValor_;}
	public function getcValor(){ return $this->cValor;}
	public function setnParEstado($nParEstado_){ $this->nParEstado=$nParEstado_;}
	public function getnParEstado(){ return $this->nParEstado;}
}
?>