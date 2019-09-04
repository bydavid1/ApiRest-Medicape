<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// database connection will be here
// include database and object files
include_once '../config/database.php';
include_once '../objects/empleado.php';

    $database = new Database();
    $db = $database->getConnection();

// initialize object
    $empleado = new Empleado($db);

    function read()
    {
    // select all query
    $query = "SELECT
                idempleado, nombres, apellidos, fecha_Nac, sexo, estado_Civil, dui, nit, especialidad, telefono, celular, email, departamento, municipio, direccion, antecedentes,  solvencia,  constancia_Titulo,  certificado_Salud, fecha_Contratacion
            FROM
                " . $this->table_name;
    // prepare query statement
    $stmt = $this->conn->prepare($query);
    // execute query
    $stmt->execute();
    return $stmt;
    }

    $stmt = $empleado->read();
    $num = $stmt->rowCount();


    if($num>0)
    {

    $empleado_arr=array();
    $empleado_arr =array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
    {
        extract($row);

        $empleado_item=array(
            "idempleado" => $idempleado,
            "nombres" => $nombres,
            "apellidos" => $apellidos,
            "fecha_Nac" => $fecha_Nac,
            "sexo" => $sexo,
            "estado_Civil" => $estado_Civil,
            "dui" => $dui,
            "nit" => $nit,
            "especialidad" => $especialidad,
            "telefono" => $telefono,
            "celular" => $celular,
            "email" => $email,
            "departamento" => $departamento,
            "municipio" => $municipio,
            "direccion" => $direccion,
            "fecha_Contratacion" => $fecha_Contratacion
        );

        array_push($empleado_arr, $empleado_item);
    }

    http_response_code(200);

    echo json_encode($empleado_arr);
}
else{

    http_response_code(204);

    echo json_encode(
        array("message" => "No employee found.")
    );
}
