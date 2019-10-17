<?php
class TotalesR
{
// database connection and table name
    private $conn;
    private $table_name3 = "consultas";
    private $table_name1 = "empleado";
    private $table_name2 = "paciente";


    // object properties
    public $totalEmple;
    public $totalPa;
    public $totalCon;



// constructor with $db as database connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    function CountTot()
    {
    // select all query
    $query =  "SELECT (SELECT COUNT(*) FROM $this->table_name1) as totalEmple, 
    (SELECT COUNT(*)  FROM   $this->table_name2 ) as totalPa , 
    (SELECT COUNT(*)  FROM   $this->table_name3  WHERE   $this->table_name3.fecha  = CURRENT_DATE) as totalCon";
    // prepare query statement
    //echo $query;
    $stmt = $this->conn->prepare($query);

    // execute query
    $stmt->execute();
    

    return $stmt;
    }

}