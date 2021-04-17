<?php
class ItemC{

    private $conn;
    private $table_name = "item_cita";


    public $idItemC;
    public $Estado;
    public $IdHorario;




    public function __construct($db)
    {
        $this->conn = $db;
    }


    function read()
    {
    // select all query
    $query = "SELECT
                *
            FROM
                " . $this->table_name;

    $stmt = $this->conn->prepare($query);

    $stmt->execute();

    return $stmt;
    }


    function create()
    {

    $query = "INSERT INTO " . $this->table_name . " 
            SET  
            Estado=:Estado, 
            IdHorario=:IdHorario";

    echo $query;

    $stmt = $this->conn->prepare($query);


    $stmt->bindParam(":Estado", $this->Estado);
    $stmt->bindParam(":IdHorario", $this->IdHorario);

    if($stmt->execute())
    {
        return true;
    }

    return false;
    }


    function update()
    {

        $query = "UPDATE
                " . $this->table_name . "
            SET
            Estado=:Estado, 
            IdHorario=:IdHorario
            WHERE
            idItemC=:idItemC";


    $stmt = $this->conn->prepare($query);


    $stmt->bindParam(":Estado", $this->Estado);
    $stmt->bindParam(":IdHorario", $this->IdHorario);
    $stmt->bindParam(":idItemC", $this->idItemC);  

    if($stmt->execute())
    {
        return true;
    }
    return false;
    }


    function delete()
    {


    $query = "DELETE FROM " . $this->table_name . " WHERE idItemC = ?";


    $stmt = $this->conn->prepare($query);


    $stmt->bindParam(1, $this->idItemC);


    if($stmt->execute())
    {
        return true;
    }
    return false;

    }


    function readOne()
    {

        $query = "SELECT
                    *
                FROM
                    " . $this->table_name ." 
                WHERE
                idItemC = ?";

        $stmt = $this->conn->prepare( $query );

        $stmt->bindParam(1, $this->idItemC);

        $stmt->execute();
    
        return $stmt;

        
    }



}