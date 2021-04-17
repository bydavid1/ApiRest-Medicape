<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../objects/item_cita.php';

$database = new Database();
$db = $database->getConnection();

$itemc = new ItemC($db);

$data = json_decode(file_get_contents("php://input"));


if  (
    !empty($data->Estado) &&
    !empty($data->IdHorario) 
    )
{

    $itemc->Estado = $data->Estado;
    $itemc->IdHorario = $data->IdHorario;


    if($itemc->create())
    {

        http_response_code(201);

        echo json_encode(array("message" => "quotes was created."));
    }

    else
    {

        http_response_code(503);

        echo json_encode(array("message" => "Unable to create quotes."));
    }
}


    else
    {

    http_response_code(400);

    echo json_encode(array("message" => "Unable to create quote. Data is incomplete."));
    }
?>