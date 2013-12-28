<?php 
class MyPDO extends PDO {
   protected $hasActiveTransaction = false;

   function beginTransaction () {
      if ( $this->hasActiveTransaction ) {        
         return false;
      } else {        
         $this->hasActiveTransaction = parent::beginTransaction ();
         return $this->hasActiveTransaction;
      }
   }

   function commit () {
      parent::commit ();
      $this->hasActiveTransaction = false;
   }

   function rollback () {
      parent::rollback ();
      $this->hasActiveTransaction = false;
   }

}

$db_host = '127.0.0.1';
$db_user = 'root';
$db_pass = '';
$db_driver = 'mysql';
$db_name = 'db_sa';
$cadena=$db_driver.":host".$db_host.";dbname=" .$db_name;


$obj =  new MyPDO($cadena,$db_host,$db_pass) ;

$obj->beginTransaction () ;

?>