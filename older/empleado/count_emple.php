<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// database connection will be here
// include database and object files
include_once '../config/database.php';
include_once '../objects/empleado.php';

// instantiate database and product object
    $database = new Database();
    $db = $database->getConnection();

// initialize object
    $empleado = new Empleado($db);
// read products will be here
// read products

// query products
    $stmt = $empleado->CountEmple();
    $num = $stmt->rowCount();

// check if more than 0 record found
    if($num>0)
    {
        http_response_code(200);

        $total = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode($total);
    }
else{

    // set response code - 404 Not found
    http_response_code(404);

    // tell the user no products found
    echo json_encode(
        array("message" => "No employee found.")
    );
}
