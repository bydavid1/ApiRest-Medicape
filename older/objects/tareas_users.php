<?php
class TareaUs
{
// database connection and table name
    private $conn;
    private $table_name = "tareas_usuarios";

    // object properties
    public $idUtarea;
    public $tarea;
    public $descripcion;
    public $lugar;
    public $hora;
    public $fecha;
    public $idusers;



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
                descripcion=:descripcion, 
                lugar=:lugar, 
                hora=:hora, 
                fecha=:fecha,
                idusers=:idusers";

    echo $query;
    // prepare query
    $stmt = $this->conn->prepare($query);

    // bind values
    $stmt->bindParam(":tarea", $this->tarea);
    $stmt->bindParam(":descripcion", $this->descripcion);
    $stmt->bindParam(":lugar", $this->lugar);
    $stmt->bindParam(":hora", $this->hora);
    $stmt->bindParam(":fecha", $this->fecha);
    $stmt->bindParam(":idusers", $this->idusers);
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
            descripcion=:descripcion,
            lugar=:lugar,
            hora=:hora, 
            fecha=:fecha,
            idusers=:idusers        
            WHERE
            idUtarea=:idUtarea";

    // prepare query statement
    $stmt = $this->conn->prepare($query);

    // bind new values
    $stmt->bindParam(":tarea", $this->tarea);
    $stmt->bindParam(":descripcion", $this->descripcion);
    $stmt->bindParam(":lugar", $this->lugar);
    $stmt->bindParam(":hora", $this->hora);
    $stmt->bindParam(":fecha", $this->fecha);
    $stmt->bindParam(":idusers", $this->idusers);
    $stmt->bindParam(":idUtarea", $this->idUtarea);    
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
    $query = "DELETE FROM " . $this->table_name . " WHERE idUtarea = ?";

    // prepare query
    $stmt = $this->conn->prepare($query);

    // bind id of record to delete
    $stmt->bindParam(1, $this->idUtarea);

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
                idUtarea = ?";
    
        // prepare query statement
        $stmt = $this->conn->prepare( $query );
    
        // bind id of product to be updated
        $stmt->bindParam(1, $this->idUtarea);
    
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
            fecha = CURRENT_DATE ";
    // prepare query statement
    $stmt = $this->conn->prepare($query);
    // execute query
    $stmt->execute();
    return $stmt;
    }


    function searchTask()
    {

    // select all query
    $query = "SELECT
                *
                FROM
            " . $this->table_name ." 
            WHERE
            idusers = ?";

// prepare query statement
    $stmt = $this->conn->prepare( $query );

// bind id of product to be updated
    $stmt->bindParam(1, $this->idusers);

// execute query
    $stmt->execute();

    return $stmt;
    }



}