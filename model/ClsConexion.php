<?php
/*
	Autor			:	Armando Enrique Pisfil Puemape 
  	Fecha			:	27/12/2014
  	Clase			:	ClsConexion
	Estado			:	OK
    twitter         :   @armandoaepp
*/
Class ClsConexion
{
	

	private static $db_host = '127.0.0.1';
    private static $db_user = 'root';
    private static $db_pass = '';
    protected $db_name = 'db_sa';
    protected $query;
    protected $rows = array();
    private $conn;

     # métodos abstractos para y/o   clases que hereden
    abstract protected function get();
    abstract protected function set();
    abstract protected function edit();
    abstract protected function delete();
    # los siguientes métodos pueden definirse con exactitud
    # y no son abstractos
    # Conectar a la base de datos
    private function open_connection()
    {
        $this->conn = new mysqli(self::$db_host, self::$db_user, self::$db_pass, $this->db_name);
    }
    # Desconectar la base de datos
    private function close_connection()
    {
        $this->conn->close();
    }
    # Ejecutar un query simple del tipo INSERT, DELETE, UPDATE
    protected function execute_single_query()
    {
        $this->open_connection();
        $this->conn->query($this->query);
        $this->close_connection();
    }
    # Traer resultados de una consulta en un Array
    protected function get_results_from_query()
    {
        $this->open_connection();
        $result = $this->conn->query($this->query);
        while ($this->rows[] = $result->fetch_assoc());
        $result->close();
        $this->close_connection();
        array_pop($this->rows);
    }

/*	private $Cnx;
	private $pServer="";
	private $pDataBase="";
	private $pUser="";
	private $pPassword="";

	function __construct()
	{
		// $this->pServer="www.adrisconsulting.com";
		// $this->pDataBase="adriscon_sistgob";
		// $this->pUser="adriscon_user";
		// $this->pPassword="+-*user+-*";
		
		$this->pServer="127.0.0.1";
		$this->pDataBase="db_sa";		
		$this->pUser="root";
		$this->pPassword="";

		$this->Cnx=new mysqli($this->pServer, $this->pUser, $this->pPassword, $this->pDataBase)or die("Error en la Conexion");
		$this->Cnx->set_charset("utf8"); // para resolver los problemas de las tildes y ñ
   	}


	function Ejecutar_Consulta($StrMySql)
	{
		$rs=$this->Cnx->query($StrMySql);
		if ($rs)
			return $rs;
		else
			return false;
	}

	function Ejecutar_Instruccion($StrMySql)
	{
		$rpta=$this->Cnx->query($StrMySql);
		return $rpta;
	}

	function __destruct()
	{
		$this->Cnx->close();
	}*/
}
?>