<?php

class Database {

    public $rows;
    
    public function loadQueries($id_product, $autor, $advanteges, $disadvanteges, $description, $stars, $date, $recomend, $voiceYes, $voiceNo) {
        $query = "SELECT id_product,autor FROM reviews WHERE `id_product`='$id_product' AND `autor`='$autor' AND `date`='$date'";
        $exec = mysql_query($query);

        if(mysql_affected_rows() !== 1){
        $query = "INSERT INTO reviews VALUES('','$id_product', '$autor', '$advanteges', '$disadvanteges', '$description', '$stars', '$date', '$recomend', '$voiceYes', '$voiceNo')";
        $exec = mysql_query($query); 
        $this->rows += mysql_affected_rows();
        }  
    }
    public function loadQueriesProduct($id_product, $type, $brand, $model, $comments) {
        $query = "SELECT * from products where id_product=$id_product";
        $exec = mysql_query($query);
        
        if(mysql_affected_rows() == 0){
        $query = "INSERT INTO products VALUES('','$id_product', '$type', '$brand', '$model', '$comments')";
        $exec = mysql_query($query);
        echo mysql_affected_rows()." row added to products scheme<br>";
        }
    }
    public function cleanDb() {
        $query = "TRUNCATE reviews";
        $exec = mysql_query($query);
        $query = "TRUNCATE products";
        $exec = mysql_query($query);
    }
    public function __construct() {
        $username = 'root';
        $server = 'localhost';
        $password = '';
        $dbName = 'etl';
        $conn = mysql_connect($server, $username, $password) or die("mysql error");
        $db = mysql_select_db($dbName) or die("mysql error");
    }
}
include ('index.html');