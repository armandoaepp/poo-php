<?php
require_once "ClsConexionPDO.php";
class Usuario extends ClsConexion
{

	public $nParCodigo;
	public $nParClase;
	public $cParJerarquia;
	public $cParNombre;
	public $cParDescripcion;
	public $nParTipo;

	public function get()
    {
            $this->query = "
							SELECT * 
							FROM parametro 
							where nParClase=1001
							
							";
        $this->get_results_from_query();
            // var_dump($this->row);
        // if (count($this->rows) == 1):
        $data = $this->rows ; 
        // var_dump($data) ;
        // echo "data: ".count($data);
        for($i = 0 ; $i < count( $data["cuerpo"]) ; $i++ ){
        	echo  $data["cuerpo"][$i]["nParCodigo"]."-" . $data["cuerpo"][$i]["nParClase"]." - ".$data["cuerpo"][$i]["cParDescripcion"]."</br>";
        	/* foreach ($this->rows[$i] as $propiedad => $valor):
               // $this->$propiedad = $valor;
               echo $valor ."<br>";
            endforeach;*/
        }
           
        
    }
    


    public function set()
    {
    		try
    		{

      	 		// $this->beginTransaction()  ; 
                $this->query = " INSERT  INTO parametro (nParCodigo,  nParClase,  cParJerarquia,cParNombre, cParDescripcion, nParTipo) 
											 VALUES(1  ,  2050 , '111110' ,  'armando', 'Pisfil',	1000)";
				$this->execute_single_query();

				$this->query = " INSERT  INTO parametro (nParCodigo,  nParClase,  cParJerarquia,cParNombre, cParDescripcion, nParTipo) 
											 VALUES(2  ,  2050 , '111110' ,  'armando2222', 'Pisf222il',	1000)";
				$this->execute_single_query();

				$this->query = " INSERT  INTO parametro (nParCodigo,  nParClase,  cParJerarquia,cParNombre, cParDescripcion, nParTipo) 
											 VALUES(3  ,  2050 , '111110' ,  'armando2222', 'Pisf222il',	1000)";
				$this->execute_single_query();

				/*$this->query = " DELETE  FROM parametro WHERE nParCodigo=2 and nParClase=2050 ; ";
				$this->execute_single_query();*/

				 // echo "transaccion : ";
            	// $this->commit() ;
    		}catch(Exception $e) 
    		{
            	// $this->rollback() ;
            	// echo "rollback ";

    		}

        
    }
    public function edit($user_data = array())
    {
        foreach ($user_data as $campo => $valor):
            $$campo = $valor;
        endforeach;
        $this->query = "
						UPDATE usuarios
						SET nombre='$nombre',
						apellido='$apellido',
						clave='$clave'
						WHERE email = '$email'
						";
        $this->execute_single_query();
    }
    public function delete($user_email = '')
    {
        $this->query = "
						DELETE FROM usuarios
						WHERE email = '$user_email'
						";
        $this->execute_single_query();
    }
    function __destruct()
    {
        unset($this);
    }

}


$usuario1 = new Usuario();

// $usuario1->get();
$usuario1->set() ; 
// print $usuario1->nParClase . ' ' . $usuario1->nParCodigo . ' existe<br>';
?>{}