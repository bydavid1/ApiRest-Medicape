<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');


include_once '../config/database.php';
include_once '../objects/horarios.php';


$database = new Database();
$db = $database->getConnection();

$horario = new Horario($db);


$horario->Idhorario = isset($_GET['Idhorario']) ? $_GET['Idhorario'] : die();


$stmt = $horario->readOne();
$num = $stmt->rowCount();
$horario_arr=array();

if($num>0){

    $horario_arr=array();
    $horario_arr =array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){

        extract($row);

        $horario_item=array(
            "Idhorario" => $Idhorario,
            "tiempo_cita" => $tiempo_cita,
            "numero_cita" => $numero_cita,
            "hora_inicio" => $hora_inicio,
            "hora_final" => $hora_final,
            "idDoc" => $idDoc
        );

        array_push($horario_arr, $horario_item);
    }

    // set response code - 200 OK
    http_response_code(200);

    // show products data in json format
    echo json_encode($horario_arr);
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