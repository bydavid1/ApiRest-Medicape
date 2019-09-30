<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/especialidades.php';

$database = new Database();
$db = $database->getConnection();

$especialidad = new Especialidades($db);

$stmt = $especialidad->read();
$num = $stmt->rowCount();

if($num>0){

    $arr=array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        extract($row);

        $item=array(
            "idespecialidad" => $idespecialidad,
            "nombre" => $nombre,
            "publico" => $publico
        );

        array_push($arr, $item);
    }

    http_response_code(200);

    echo json_encode($arr);
}
else{
    http_response_code(204);

    echo json_encode(
        array("message" => "No especialties found.")
    );
}

