<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// include database and object files
include_once '../config/database.php';
include_once '../objects/tareas.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare product object
$tarea = new Tarea($db);

// get id of product to be edited
$data = json_decode(file_get_contents("php://input"));

// set ID property of product to be edited
$tarea->idtarea = $data->idtarea;

// set product property values
    $tarea->tarea = $data->tarea;
    $tarea->lugar_Tarea = $data->lugar_Tarea;
    $tarea->hora_Tarea = $data->hora_Tarea;
    $tarea->fecha_Tarea = $data->fecha_Tarea;


// update the product
if($tarea->update()){

    // set response code - 200 ok
    http_response_code(200);

    // tell the user
    echo json_encode(array("message" => "event was updated."));
}

// if unable to update the product, tell the user
else{

    // set response code - 503 service unavailable
    http_response_code(503);

    // tell the user
    echo json_encode(array("message" => "Unable to update event."));
}
?>