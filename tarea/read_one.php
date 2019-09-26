<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');

// include database and object files
include_once '../config/database.php';
include_once '../objects/tareas.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare product object
$tarea = new Tarea($db);

// set ID property of record to read
$tarea->idtarea = isset($_GET['idtarea']) ? $_GET['idtarea'] : die();

// read the details of product to be edited
$stmt = $tarea->readById();
$num = $stmt->rowCount();
$tarea_arr=array();
if($num>0){

    $tarea_arr=array();
    $tarea_arr =array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){

        extract($row);

        $tarea_item=array(
            "idtarea" => $idtarea,
            "tarea" => $tarea,
            "lugar_Tarea" => $lugar_Tarea,
            "hora_Tarea" => $hora_Tarea,
            "fecha_Tarea" => $fecha_Tarea
        
        );

        array_push($tarea_arr, $tarea_item);
    }

    // set response code - 200 OK
    http_response_code(200);

    // show products data in json format
    echo json_encode($tarea_arr);
}
else{

    // set response code - 404 Not found
    http_response_code(404);

    // tell the user no products found
    echo json_encode(
        array("message" => "No quotes found.")
    );
}
?>