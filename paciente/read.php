<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// database connection will be here
// include database and object files
include_once '../config/database.php';
include_once '../objects/paciente.php';

// instantiate database and product object
    $database = new Database();
    $db = $database->getConnection();

// initialize object
    $paciente = new Paciente($db);

    $stmt = $paciente->read();
    $num = $stmt->rowCount();

// check if more than 0 record found
    if($num>0)
    {
    // products array
    $paciente_arr=array();
    $paciente_arr =array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
    {
        extract($row);

        $paciente_item=array(
            "idpaciente" => $idpaciente,
            "nombres" => $nombres,
            "apellidos" => $apellidos,
            "fecha_Nac" => $fecha_Nac,
            "sexo" => $sexo,
            "estado_Civil" => $estado_Civil,
            "dui" => $dui,
            "email" => $email,
            "departamento" => $departamento,
            "municipio" => $municipio,
            "direccion" => $direccion,
            "telefono" => $telefono
        );

        array_push($paciente_arr, $paciente_item);
    }

    // set response code - 200 OK
    http_response_code(200);

    // show products data in json format
    echo json_encode($paciente_arr);
}
else{

    // set response code - 404 Not found
    http_response_code(404);

    // tell the user no products found
    echo json_encode(
        array("message" => "No patient found.")
    );
}