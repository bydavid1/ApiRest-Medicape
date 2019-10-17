<?php
class Tarea
{
// database connection and table name
    private $conn;
    private $table_name = "tareas";

    // object properties
    public $idtarea;
    public $tarea;
    public $lugar;
    public $hora;
    public $fecha;
    public $Dia;
    public $Mes;
    public $descripcion;


// constructor with $db as database connection
    public function __construct($db)
    {
        $this->conn = $db;
    }



// read products
    function read()
    {

        $query= "SELECT ELT(MONTH(fecha), \"Enero\", \"Febrero\", \"Marzo\", \"Abril\", \"Mayo\", \"Junio\", \"Julio\", \"Agosto\", \"Septiembre\", \"Octubre\", \"Noviembre\", \"Diciembre\") Mes, DAY(fecha) Dia, idtarea, tarea, lugar, hora, descripcion    
            FROM
                " .$this->table_name;

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
                lugar=:lugar, 
                hora=:hora, 
                fecha=:fecha,
                descripcion=:descripcion";

    echo $query;
    // prepare query
    $stmt = $this->conn->prepare($query);

    // bind values
    $stmt->bindParam(":tarea", $this->tarea);
    $stmt->bindParam(":lugar", $this->lugar);
    $stmt->bindParam(":hora", $this->hora);
    $stmt->bindParam(":fecha", $this->fecha);
    $stmt->bindParam(":descripcion", $this->descripcion);
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
            lugar=:lugar,
            hora=:hora, 
            fecha=:fecha,
            descripcion=:descripcion        
            WHERE
            idtarea=:idtarea";

    // prepare query statement
    $stmt = $this->conn->prepare($query);

    // bind new values
    $stmt->bindParam(":tarea", $this->tarea);
    $stmt->bindParam(":lugar", $this->lugar);
    $stmt->bindParam(":hora", $this->hora);
    $stmt->bindParam(":fecha", $this->fecha);
    $stmt->bindParam(":descripcion", $this->descripcion);
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
    $query = "SELECT idtarea, tarea, lugar, DATE_FORMAT(hora, \"%H:%i\") hora, fecha, descripcion 
    FROM  " . $this->table_name ."
    WHERE fecha = CURRENT_DATE";
    // prepare query statement
    $stmt = $this->conn->prepare($query);
    // execute query
    $stmt->execute();
    return $stmt;
    }



}