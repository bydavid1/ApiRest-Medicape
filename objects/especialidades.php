<?php
class Especialidades
{
// database connection and table name
    private $conn;
    private $table_name = "especialidades";

    // object properties
    public $idespecialidad;
    public $nombre;
    public $publico;

// constructor with $db as database connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    function read()
    {
    $query = "SELECT
                idespecialidad, nombre, publico
            FROM
                " . $this->table_name . "";
    $stmt = $this->conn->prepare($query);
    $stmt->execute();
    return $stmt;
    }

    function create()
    {
        $query = "INSERT INTO " . $this->table_name . " 
        SET  
        nombre=:nombre, 
        publico=:publico";

echo $query;
// prepare query
$stmt = $this->conn->prepare($query);

// bind values
$stmt->bindParam(":nombre", $this->nombre);
$stmt->bindParam(":publico", $this->publico);

// execute query
if($stmt->execute())
{
return true;
}

return false;
    }

    function updatePublic()
    {
        if($this->publico == 1){
            $query = "UPDATE 
            " . $this->table_name . " SET publico = 0 WHERE idespecialidad = :idespecialidad";
            echo $query;
        }else if($this->publico == 0){
            $query = "UPDATE 
            " . $this->table_name . " SET publico = 1 WHERE idespecialidad = :idespecialidad";
        }else{
            return false;
        }
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":idespecialidad", $this->idespecialidad);
        if($stmt->execute())
        {
            return true;
        }
        return false;
    }

    function update()
    {
      $query = "UPDATE 
            " . $this->table_name . " SET nombre = :nombre WHERE idespecialidad = :idespecialidad";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":idespecialidad", $this->idespecialidad);
        $stmt->bindParam(":nombre", $this->nombre);
        if($stmt->execute())
        {
            return true;
        }
        return false;
    }
}