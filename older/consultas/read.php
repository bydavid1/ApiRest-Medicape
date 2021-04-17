<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/consultas.php';

$database = new Database();
$db = $database->getConnection();

$consulta = new Consultas($db);

$consulta->idempleado = isset($_GET['idempleado']) ? $_GET['idempleado'] : die();

$stmt = $consulta->read();
$num = $stmt->rowCount();

if($num>0){

    // products array
    $consulta_arr=array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);

        $consulta_item=array(
            "idconsulta" => $idconsulta,
            "fecha" => $fecha,
            "hora" => $hora,
            "nombres" => $nombres,
            "apellidos" => $apellidos,
            "num_Consultorio" => $num_Consultorio
        );

        array_push($consulta_arr, $consulta_item);
    }

    // set response code - 200 OK
    http_response_code(200);

    // show products data in json format
    echo json_encode($consulta_arr);
}
else{

    // set response code - 404 Not found
    http_response_code(204);

    // tell the user no products found
    echo json_encode(
        array("message" => "No products found.")
    );
}

// no products found will be here