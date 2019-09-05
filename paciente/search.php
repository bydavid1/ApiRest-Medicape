<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// include database and object files
include_once '../config/database.php';
include_once '../objects/paciente.php';

$database = new Database();
$db = $database->getConnection();

// initialize object
$paciente = new Paciente($db);




$keywords=isset($_GET["query"]) ? $_GET["query"] : "";

$stmt = $paciente->search($keywords);
$num = $stmt->rowCount();

if($num>0){

    $paciente_arr=array();
    $paciente_arr=array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        extract($row);

        $paciente_item=array(
            "idpaciente" => $idpaciente,
            "nombres" => $nombres,
            "apellidos" =>$apellidos
        );

        array_push($paciente_arr, $paciente_item);
    }

    // set response code - 200 OK
    http_response_code(200);

    // show products data
    echo json_encode($paciente_arr);
}

else{
    // set response code - 404 Not found
    http_response_code(404);

    // tell the user no products found
    echo json_encode(
        array("message" => "No se encontraron Resultados.")
    );
}
?>