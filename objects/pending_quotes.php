<?php
class pending_quotes
{
// database connection and table name
    private $conn;
    private $table_name = "pending_quotes";

    // object properties
    public $idpending;
    public $fecha;
    public $hora;
    public $nombre;
    public $apellido;
    public $idpaciente;
    public $idempleado;
    public $tipo;

// constructor with $db as database connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    function read()
    {
    // select all query
    $query = "SELECT
              idpending, fecha, hora, paciente.nombre as nombre, paciente.apellido as apellido, tipo
            FROM
                " . $this->table_name . " INNER JOIN paciente ON paciente.idpaciente = pending_quotes.idpaciente WHERE idempleado=" . $this->idempleado;
    // prepare query statement
    $stmt = $this->conn->prepare($query);
    // execute query
    $stmt->execute();
    return $stmt;
    }

    function create()
    {
    // select all query
    $query = "INSERT INTO " . $this->table_name . "
            SET 
            fecha=:fecha,
            hora=:hora,
            tipo=:tipo,
            idempleado=:idempleado,
            idpaciente=:idpaciente";
      
      // prepare query
      $stmt = $this->conn->prepare($query);

      // bind values
      $stmt->bindParam(":fecha", $this->fecha);
      $stmt->bindParam(":hora", $this->hora);
      $stmt->bindParam(":tipo", $this->tipo);
      $stmt->bindParam(":idempleado", $this->idempleado);
      $stmt->bindParam(":idpaciente", $this->idpaciente);
      
      if($stmt->execute())
      {
          return true;
      }else{
          return false;
      }
    }

    function customRead()
    {
    // select all query
    $query = "SELECT
                fecha, hora, tipo
            FROM
                " . $this->table_name ." WHERE idpaciente = ?";
    // prepare query statement
    $stmt = $this->conn->prepare($query);

    $stmt->bindParam(1, $this->idpaciente);
    // execute query
    $stmt->execute();
    
    return $stmt;
    }

    function delete()
    {

    // delete query
    $query = "DELETE FROM " . $this->table_name . " WHERE idpending = ?";

    // prepare query
    $stmt = $this->conn->prepare($query);

    // bind id of record to delete
    $stmt->bindParam(1, $this->idpending);

    $stmt->execute();
    // execute query
  return $stmt;
    }
}
?>