<?php
/*
	Autor          :   Armando Enrique Pisfil Puemape 
    Fecha           :   27/12/2014
    Clase           :   ClsConexion
    Estado          :   OK
    twitter         :   @armandoaepp
*/
 Class ClsConexion 
{ 
	

	private static $db_host = '127.0.0.1';
    private static $db_user = 'root';
    private static $db_pass = '';
	protected $db_driver = 'mysql'; 
    protected $db_name = 'db_sa';
    protected $query;
    protected $rows = array();
    private $conn;
    # variable para controlar transacciones 
    protected $hasActiveTransaction = false;
	  
    # Conectar a la base de datos utilizamos la libreria pdo 
    private function open_connection()
    {
    	$cadena=$this->db_driver.":host=".self::$db_host.";dbname=" .$this->db_name;  
		$this->conn = new PDO($cadena,self::$db_user,self::$db_pass);
        # para manejar errores y excepcciones especiales para el manejo de transacciones
		$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        # codificacion utf-8 
        $this->conn->query("SET NAMES 'utf8'"); 
    }
    # Desconectar la base de datos
    private function close_connection()
    {        
        $this->conn = null;
    }
# ESPECIAL PARA SQL A NIVEL DE APLICACIÓN 
    # Ejecutar un query simple del tipo INSERT, DELETE, UPDATE
    protected function execute_single_query()
    {
        # hasActiveTransaction si es vdd entonces esta iniciada una transaccion 
        if( $this->hasActiveTransaction==false)
            $this->open_connection();
        # prepare query 
        $stm = $this->conn->prepare($this->query);
        $stm->execute() ;
    }
    # Traer resultados de una consulta en un Array 
    protected function get_results_from_query()
    {
        # hasActiveTransaction si es vdd entonces esta iniciada una transaccion         
        $this->open_connection();        
        $stm = $this->conn->prepare($this->query);
        $stm->execute() ;
        $this->rows= array("cuerpo"=> $stm->fetchAll());     
      	 var_dump($this->rows);
        $this->close_connection();
        
    }
    # EJECUTAR UN QUERY DEL ITPO INSERT , DELETE , UPDATE , SELECT
    # para el caso de que  UN  insert  INSERT , DELETE , UPDATE devuelva parametros desde un procedimiento almacendO
    # para poder utilizar este metodo todos query deben de tener por lo menos un valor de respuesta
    protected function execute_query()
    {    
        # hasActiveTransaction si es vdd entonces esta iniciada una transaccion         
        if( $this->hasActiveTransaction==false)
    	$this->open_connection();

        $stm = $this->conn->prepare($this->query);
        // $stm->execute() ;
        if($stm->execute())
        {
            $this->rows= array("cuerpo"=> $stm->fetchAll());     
        }
      	 // var_dump($this->rows);
         
        // $this->close_connection();
    }
    # Iniciar un transaccion 
    public function beginTransaction()
    {
    # nos conectamos 
        $this->open_connection();               
    # iniciamos la transaccion 
        $this->conn->beginTransaction();
    #activamos la varible controladora de transacciones 
        $this->hasActiveTransaction = true ; 
        
    }
# si a tenido existo hacemos un commit para volcar los datos 
    public function commit() 
    {
        $this->conn->commit ();
        $this->hasActiveTransaction = false;
        $this->close_connection();

    }
# si hay errores para dehacer el volcado de datos 
    public function rollback()
    {
        $this->conn->rollback ();
        $this->hasActiveTransaction = false;
        $this->close_connection();
    }

}



?>