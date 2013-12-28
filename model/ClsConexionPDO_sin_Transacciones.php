<?php
/*
	Autor			:	Armando Enrique Pisfil Puemape 
  	Fecha			:	11/08/2012
  	Clase			:	ClsConexion
	Institucion		:	Taxi del Norte
	Estado			:	OK
*/
 Class ClsConexion extends PDO
{ 
	

	private static $db_host = '127.0.0.1';
    private static $db_user = 'root';
    private static $db_pass = '';
	protected $db_driver = 'mysql';
    protected $db_name = 'db_sa';
    protected $query;
    protected $rows = array();
    private $conn;

	  
    # Conectar a la base de datos
    private function open_connection()
    {
    	$cadena=$this->db_driver.":host=".self::$db_host.";dbname=" .$this->db_name;  
		$this->conn = new PDO($cadena,self::$db_user,self::$db_pass);
		$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		// $this->conn->query("SET NAMES 'utf8'"); 
    }
    # Desconectar la base de datos
    private function close_connection()
    {        
        $this->conn = null;
    }
    # Ejecutar un query simple del tipo INSERT, DELETE, UPDATE
    protected function execute_single_query()
    {
        $this->open_connection();
        $stm = $this->conn->prepare($this->query);
        $stm->execute() ;
        $this->close_connection();
    }
    # Traer resultados de una consulta en un Array 
    protected function get_results_from_query()
    {
        $this->open_connection();        
        $stm = $this->conn->prepare($this->query);
        $stm->execute() ;
        $this->rows= array("cuerpo"=> $stm->fetchAll());     
      	 var_dump($this->rows);
        $this->close_connection();
        
    }
 # EJECUTAR UN QUERY DEL ITPO INSERT , DELETE , UPDATE , SELECT
 # para el caso de que insert  INSERT , DELETE , UPDATE devuelva parametros desde un procedimiento almacend0 
    protected function execute_query()
    {
    	$this->open_connection();        
        $stm = $this->conn->prepare($this->query);
        $stm->execute() ;
        $this->rows= array("cuerpo"=> $stm->fetchAll());     
      	 var_dump($this->rows);
        $this->close_connection();
    }

}



?>