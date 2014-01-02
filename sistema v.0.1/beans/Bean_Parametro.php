<?php
class Bean_Parametro extends Bean_General
{

	# Parametro
	protected $nParCodigo;
	protected $nParClase;
	protected $cParJerarquia;
	protected $cParNombre;
	protected $cParDescripcion;
	protected $nParTipo;
	public function setnParCodigo($nParCodigo_){ $this->nParCodigo=$nParCodigo_;}
	public function getnParCodigo(){ return $this->nParCodigo;}
	public function setnParClase($nParClase_){ $this->nParClase=$nParClase_;}
	public function getnParClase(){	return $this->nParClase;}
	public function setcParJerarquia($cParJerarquia_){ $this->cParJerarquia=$cParJerarquia_;}
	public function getcParJerarquia(){ return $this->cParJerarquia;}
	public function setcParNombre($cParNombre_){ $this->cParNombre=$cParNombre_;}
	public function getcParNombre(){ return $this->cParNombre;}
	public function setcParDescripcion($cParDescripcion_){ $this->cParDescripcion=$cParDescripcion_;}
	public function getcParDescripcion(){ return $this->cParDescripcion;}
	public function setnParTipo($nParTipo_){ $this->nParTipo=$nParTipo_;}
	public function getnParTipo(){ return $this->nParTipo;}
}
?>