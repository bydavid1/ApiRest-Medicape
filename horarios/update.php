<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


include_once '../config/database.php';
include_once '../objects/horarios.php';


$database = new Database();
$db = $database->getConnection();


$horario = new Horario($db);


$data = json_decode(file_get_contents("php://input"));


$horario->Idhorario = $data->Idhorario;


    $horario->tiempo_cita = $data->tiempo_cita;
    $horario->numero_cita = $data->numero_cita;
    $horario->hora_inicio = $data->hora_inicio;
    $horario->hora_final = $data->hora_final;
    $horario->idDoc = $data->idDoc;



if($horario->update()){


    http_response_code(200);


    echo json_encode(array("message" => "event was updated."));
}

else{


    http_response_code(503);


    echo json_encode(array("message" => "Unable to update event."));
}
?>