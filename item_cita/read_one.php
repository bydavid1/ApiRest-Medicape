<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');


include_once '../config/database.php';
include_once '../objects/item_cita.php';


$database = new Database();
$db = $database->getConnection();

$itemc = new ItemC($db);


$itemc->idItemC = isset($_GET['idItemC']) ? $_GET['idItemC'] : die();


$stmt = $itemc->readOne();
$num = $stmt->rowCount();
$itemc_arr=array();

if($num>0){

    $itemc_arr=array();
    $itemc_arr =array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){

        extract($row);

        $itemc_item=array(
            "idItemC" => $idItemC,
            "Estado" => $Estado,
            "IdHorario" => $IdHorario
        );

        array_push($itemc_arr, $itemc_item);
    }

    // set response code - 200 OK
    http_response_code(200);

    // show products data in json format
    echo json_encode($itemc_arr);
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