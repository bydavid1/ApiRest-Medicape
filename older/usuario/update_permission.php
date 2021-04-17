<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');

// include database and object files
include_once '../config/database.php';
include_once '../objects/usuario.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare product object
$usuario = new Usuario($db);

// set ID property of record to read
$idespecialidad = isset($_GET['idespecialidad']) ? $_GET['idespecialidad'] : die();
$data = json_decode(file_get_contents("php://input"));

$usuario->valor = $data->valor;

if($usuario->UpdatePermission("especialty", $idespecialidad))
{
    // set response code - 200 OK
    http_response_code(200);

    // make it json format
    echo json_encode(array("message" => "Updated."));
}

else{
    // set response code - 404 Not found
    http_response_code(404);

    // tell the user product does not exist
    echo json_encode(array("message" => "User does not exist."));
}
?>