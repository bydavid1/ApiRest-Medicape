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
$usuario->user_Name = isset($_GET['iduser']) ? $_GET['iduser'] : die();

// read the details of product to be edited
$usuario->readId();

if($usuario->user_Name!=null)
{
    // create array
    $usuario_arr = array(
        "user_Name" => $usuario->user_Name,
        "user_Password" => $usuario->user_Password,
        "user_type" => $usuario->user_type,
        "valor" => $usuario->valor
    );

    // set response code - 200 OK
    http_response_code(200);

    // make it json format
    echo json_encode($usuario_arr);
}

else{
    // set response code - 404 Not found
    http_response_code(404);

    // tell the user product does not exist
    echo json_encode(array("message" => "User does not exist."));
}
?>