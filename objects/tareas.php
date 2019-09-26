<?php
class Tarea
{
// database connection and table name
    private $conn;
    private $table_name = "tareas";

    // object properties
    public $idtarea;
    public $tarea;
    public $lugar_Tarea;
    public $hora_Tarea;
    public $fecha_Tarea;


// constructor with $db as database connection
    public function __construct($db)
    {
        $this->conn = $db;
    }



// read products
    function read()
    {
    // select all query
    $query = "SELECT
                *
            FROM
                " . $this->table_name;
    // prepare query statement
    $stmt = $this->conn->prepare($query);
    // execute query
    $stmt->execute();
    return $stmt;
    }



    function create()
    {
    // query to insert record
    $query = "INSERT INTO " . $this->table_name . " 
                SET  
                tarea=:tarea, 
                lugar_Tarea=:lugar_Tarea, 
                hora_Tarea=:hora_Tarea, 
                fecha_Tarea=:fecha_Tarea";

    echo $query;
    // prepare query
    $stmt = $this->conn->prepare($query);

    // bind values
    $stmt->bindParam(":tarea", $this->tarea);
    $stmt->bindParam(":lugar_Tarea", $this->lugar_Tarea);
    $stmt->bindParam(":hora_Tarea", $this->hora_Tarea);
    $stmt->bindParam(":fecha_Tarea", $this->fecha_Tarea);
    // execute query
    if($stmt->execute())
    {
        return true;
    }

    return false;
    }




    function update()
    {

    // update query
        $query = "UPDATE
                " . $this->table_name . "
            SET
            tarea=:tarea,
            lugar_Tarea=:lugar_Tarea,
            hora_Tarea=:hora_Tarea, 
            fecha_Tarea=:fecha_Tarea        
            WHERE
            idtarea=:idtarea";

    // prepare query statement
    $stmt = $this->conn->prepare($query);

    // bind new values
    $stmt->bindParam(":tarea", $this->tarea);
    $stmt->bindParam(":lugar_Tarea", $this->lugar_Tarea);
    $stmt->bindParam(":hora_Tarea", $this->hora_Tarea);
    $stmt->bindParam(":fecha_Tarea", $this->fecha_Tarea);
    $stmt->bindParam(":idtarea", $this->idtarea);    
    // execute the query
    if($stmt->execute())
    {
        return true;
    }
    return false;
    }


    function delete()
    {

    // delete query
    $query = "DELETE FROM " . $this->table_name . " WHERE idtarea = ?";

    // prepare query
    $stmt = $this->conn->prepare($query);

    // bind id of record to delete
    $stmt->bindParam(1, $this->idtarea);

    // execute query
    if($stmt->execute())
    {
        return true;
    }
    return false;

    }

//read One Quotes
    function readById()
    {

        // query to read single record
        $query = "SELECT
                    *
                FROM
                    " . $this->table_name ." 
                WHERE
                idtarea = ?";
    
        // prepare query statement
        $stmt = $this->conn->prepare( $query );
    
        // bind id of product to be updated
        $stmt->bindParam(1, $this->idtarea);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }

//readDate
    function readDate()
    {
    // select all query

    
    $query = "SELECT
                *
            FROM    " . $this->table_name ."
            WHERE
            fecha_Tarea = CURRENT_DATE ";
    // prepare query statement
    $stmt = $this->conn->prepare($query);
    // execute query
    $stmt->execute();
    return $stmt;
    }



}