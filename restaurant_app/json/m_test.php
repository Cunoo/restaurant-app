<?php

    $conn = mysqli_connect('localhost', 'af42keket', 'Heslo123456','fonolabs');

    if (!$conn){
        echo "failed to connect to database\n";

    }
    //get data from database
    $result = mysqli_query($conn, "SELECT * FROM food_categories");

    $data = array();

    while($row = mysqli_fetch_object($result)){
        array_push($data, $row);
    }

?>