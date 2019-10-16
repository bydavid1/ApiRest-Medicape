<?php
class Usuario{

// database connection and table name
    private $conn;
    private $table_name = "users";

// object properties
    public $iduser;
    public $user_Name;
    public $user_Password;
    public $email;
    public $user_type;
    public $valor;

// constructor with $db as database connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

// read Exam
    function read()
    {
    // select all query
    $query = "SELECT
                iduser, user_Name, user_Password, email, user_type
            FROM
                " . $this->table_name;
    // prepare query statement
    $stmt = $this->conn->prepare($query);
    // execute query
    $stmt->execute();

    return $stmt;
    }

    function create($idempleado)
    {

    $query = "INSERT INTO " . $this->table_name . " SET  user_Name=:user_Name, user_Password=:user_Password, email=:email, user_type=:user_type";

    $stmt = $this->conn->prepare($query);

    $stmt->bindParam(":user_Name", $this->user_Name);
    $stmt->bindParam(":user_Password", $this->user_Password);
    $stmt->bindParam(":email", $this->email);
    $stmt->bindParam(":user_type", $this->user_type);
    
    if($stmt->execute())
    {
    $iduser = $this->conn->lastInsertId();

    $sql = "INSERT INTO permisos SET valor=:valor";

    $stmt = $this->conn->prepare($sql);

    $stmt->bindParam(":valor", $this->valor);
    
    if($stmt->execute())
    {
        $idpermisos = $this->conn->lastInsertId();

        $sql2 = "UPDATE users SET idpermisos = $idpermisos WHERE iduser = $iduser";

        $stmt = $this->conn->prepare($sql2);

        if($stmt->execute()){
            $sql3 = "UPDATE empleado SET iduser = $iduser WHERE idempleado = $idempleado";

            $stmt = $this->conn->prepare($sql3);
    
            if($stmt->execute()){
               return true;
            }else{
                return false;
            }
        }else {
            return false;
        }
    }else{
        return false;
    }

    }else{
        return false;
    }

    return false;
    }


    function update()
    {

    // update query
        $query = "UPDATE
                " . $this->table_name . "
            SET
            user_Name=:user_Name, 
            user_Password=:user_Password, 
            email=:email, 
            user_type=:user_type 
            WHERE
            iduser=:iduser";

    // prepare query statement
    $stmt = $this->conn->prepare($query);

    // bind new values
    $stmt->bindParam(":user_Name", $this->user_Name);
    $stmt->bindParam(":user_Password", $this->user_Password);
    $stmt->bindParam(":email", $this->email);
    $stmt->bindParam(":user_type", $this->user_type);
    $stmt->bindParam(":iduser", $this->iduser);   

    // execute the query
    if($stmt->execute())
    {
        return true;
    }
    return false;
    }

//deleteExam
    function delete()
    {

    // delete query
    $query = "DELETE FROM " . $this->table_name . " WHERE iduser = ?";

    // prepare query
    $stmt = $this->conn->prepare($query);

    // bind id of record to delete
    $stmt->bindParam(1, $this->iduser);

    // execute query
    if($stmt->execute())
    {
        return true;
    }
    return false;

    }

//readOneExam
    function readOne()
    {

        // query to read single record
        $query = "SELECT
                     user_Name, user_Password, user_type               
                    FROM
                    " . $this->table_name ." 
                WHERE
                    iduser = ?
                LIMIT
                    0,1";
    
        // prepare query statement
        $stmt = $this->conn->prepare( $query );
    
        // bind id of product to be updated
        $stmt->bindParam(1, $this->iduser);
    
        // execute query
        $stmt->execute();
    
        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
        // set values to object properties
        $this->user_Name = $row['user_Name'];
        $this->user_Password = $row['user_Password'];
        $this->user_type = $row['user_type'];
    
        
    }

    function readId()
    {

        // query to read single record
        $query = "SELECT
                     user_Password, user_type, user_Name, permisos.valor as valor               
                    FROM
                    " . $this->table_name ." INNER JOIN permisos ON permisos.idpermisos = users.idpermisos 
                WHERE
                    iduser = ?
                LIMIT
                    0,1";
    
        // prepare query statement
        $stmt = $this->conn->prepare( $query );
    
        // bind id of product to be updated
        $stmt->bindParam(1, $this->user_Name);
    
        // execute query
        $stmt->execute();
    
        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
        // set values to object properties
        $this->user_Password = $row['user_Password'];
        $this->user_type = $row['user_type'];
        $this->user_Name = $row['user_Name'];
        $this->valor = $row['valor'];
    }

//UserExists
    function userExists(){
        $query = "SELECT iduser
                FROM " . $this->table_name . "
                WHERE user_type = 2 AND user_Name = ? AND user_Password = ?
                LIMIT 0,1";
    
        $stmt = $this->conn->prepare( $query );
    

        $stmt->bindParam(1, $this->user_Name);
        $stmt->bindParam(2, $this->user_Password);

        $stmt->execute();
    

        $num = $stmt->rowCount();
    
        if($num>0){
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
      //FALTA

        }else{
            return false;
        }
    }

   
    function adminExist(){
        $query = "SELECT iduser, user_Name, permisos.valor as valor
                FROM " . $this->table_name . " INNER JOIN permisos ON permisos.idpermisos = users.idpermisos
                WHERE user_type = 1 AND user_Name = ? AND user_Password = ?
                LIMIT 0,1";
        $stmt = $this->conn->prepare( $query );
    

        $stmt->bindParam(1, $this->user_Name);
        $stmt->bindParam(2, $this->user_Password);
        $stmt->execute();
        $num = $stmt->rowCount();
    
        if($num == 1){
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->iduser = $row['iduser'];
            $this->valor = $row['valor'];
            $this->user_Name = $row['user_Name'];
            return true;
        }else{
            return false;
        } 
    }

function checkUser()
    {
    
        $query = "SELECT iduser
                FROM " . $this->table_name . "
                WHERE user_Name = ? 
                LIMIT 0,1";
    
        $stmt = $this->conn->prepare( $query );
    

        $stmt->bindParam(1, $this->user_Name);


        $stmt->execute();
    

        $num = $stmt->rowCount();
    
        if($num>0){
        return true;
        }
    
        return false;
    }


    function UpdatePassword()
    {
        $query = "UPDATE
        " . $this->table_name . "
        SET
        user_Password=:user_Password
        WHERE
        iduser=:iduser";

    // prepare query statement
    $stmt = $this->conn->prepare($query);

    // bind new values
    $stmt->bindParam(":user_Password", $this->user_Password);

    $stmt->bindParam(":iduser", $this->iduser);   

// execute the query
    if($stmt->execute())
    {
    return true;
    }
    return false;
    }

    function UpdatePermission($type, $condition)
    {
        if($type == "especialty"){
            $query = "UPDATE permisos SET valor = " . $this->valor . " WHERE idpermisos = (SELECT idpermisos FROM users WHERE iduser = (SELECT iduser FROM empleado WHERE idespecialidad = " . $condition . "))";
    
        $stmt = $this->conn->prepare($query);

        if($stmt->execute())
        {
        return true;
        }
        return false;
        }
    }

}