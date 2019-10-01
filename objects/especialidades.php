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
       //Falta crear 
    }

}