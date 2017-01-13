<?php

require 'database.php';
require 'Product.php';
require 'ProductReview.php';

class Bootstrap {
    public $pageParsed;
    
    public function __construct() {
        $product = new Product();
        $review = new ProductReview();
        $db = new Database(); 
        
        
        if (isset($_POST['cl'])) {
            //$db = new Database();
            $db->cleanDb();
            echo '<br>Baza danych została oczyszczona';
        }
        
        
        if (isset($_POST['etl'])) {
            $review->extractElements();
            $review->loadElements();
            $product->productExtract($_POST['object']);
            $product->productLoad();
            echo $db->rows . " rows added to reviews scheme<br>";
        }
        
        
        if (isset($_POST['e'])) {
            session_start();
            $review->extractElements();
            
            $_SESSION['id'] = $_POST['object'];
           
            $_SESSION['count'] = $review->elemReviewsNumber;
            echo "<form method='post' action='Bootstrap.php'>";
            echo "<input type='submit' value='T' name='t'>";
            echo "</form>";
            $_SESSION['elems'] = $review->elementsArray;
            $_SESSION['elemsP'] =  $product->productExtract($_SESSION['id']);
        } 
        
        
        elseif (isset($_POST['t'])) {
            session_start();

            for ($i = 0; $i < $_SESSION['count']; $i++) {
                $_SESSION["autor"][$i] = $review->transformElement($_SESSION['elems'][$i], $review->autor, '</div>');
                $_SESSION["pros"][$i] = $review->transformElementProsCons($_SESSION['elems'][$i], $review->pros, '</div>');
                $_SESSION["cons"][$i] = $review->transformElementProsCons($_SESSION['elems'][$i], $review->cons, '</ul>');
                $_SESSION["description"][$i] = $review->transformElement($_SESSION['elems'][$i], $review->description, '</p>');
                $_SESSION["stars"][$i] = $review->transformElementStars($_SESSION['elems'][$i], $review->stars, '</span>');
                $_SESSION["date"][$i] = $review->transformElementDate($_SESSION['elems'][$i], $review->date, '</span>');
                $_SESSION["recomend"][$i] = $review->transformElement($_SESSION['elems'][$i], $review->recomend, '</em>');
                $_SESSION["voiceYes"][$i] = $review->transformElement($_SESSION['elems'][$i], $review->voiceYes, '</span>');
                $_SESSION["voiceNo"][$i] = $review->transformElement($_SESSION['elems'][$i], $review->voiceNo, '</span>');
            }
            $product->pageParsed = $_SESSION['elemsP'];
            $product->productTransform();
            $_SESSION['type'] = $product->type;
            $_SESSION['brand'] = $product->brand;
            $_SESSION['model'] = $product->model;
            $_SESSION['comments'] = $product->comments;
            
            echo "<form method='post' action='Bootstrap.php'>";
            echo "<input type='submit' value='L' name='l'>";
            echo "</form>";
        } 
        
        
        elseif (isset($_POST['l'])) {
            session_start();
            $db = new Database();
            for ($i = 0; $i < $_SESSION['count']; $i++) {
                $db->loadQueries(
                        $_SESSION['id'], $_SESSION["autor"][$i], $_SESSION["pros"][$i], $_SESSION["cons"][$i], $_SESSION["description"][$i], $_SESSION["stars"][$i], $_SESSION["date"][$i], $_SESSION["recomend"][$i], $_SESSION["voiceYes"][$i], $_SESSION["voiceNo"][$i]
                );
            }
            $db->loadQueriesProduct(
                    $_SESSION['id'], $_SESSION['type'], $_SESSION['brand'], $_SESSION['model'], $_SESSION['comments']
            );
            echo $db->rows . " rows added to reviews scheme<br>";
            session_destroy();
        }
        
        
        
        echo "<form action='Bootstrap.php' method='post'>";
        echo "<select name='select'>";
        $query = "SELECT id_product FROM products GROUP BY id_product";
        $exec = mysql_query($query);
        while($row=mysql_fetch_array($exec))
        {
            $row = $row['id_product'];
            echo "<option name=$row value=$row>".$row."</option>";
        }
    
        echo "</select>";
        echo "<input type='submit' name='submit' value='submit' />";
        echo "</form>";
        
        if(isset($_POST['select'])){
            $post = $_POST['select'];
            
            
            
            $query = "SELECT * FROM products WHERE id_product='$post'";
            $exec = mysql_query($query);
            while($row = mysql_fetch_array($exec)){
                $id_product = $row['id_product'];
                $type = $row['type'];
                $brand = $row['brand'];
                $model = $row['model'];
                $comments = $row['comments'];
                echo "id produktu: ".$id_product.'<br>';
                echo "typ: ".$type.'<br>';
                echo "marka: ".$brand.'<br>';
                echo "model: ".$model.'<br>';
                echo "dodatkowe uwagi: ".$comments.'<br>';
                
                
            }
                $query = "SELECT * INTO OUTFILE 'c:/xampp/htdocs/ETL/folder/$id_product.csv' FIELDS TERMINATED BY '\r' OPTIONALLY ENCLOSED BY '\t' LINES TERMINATED BY '\n\n\n' FROM products WHERE id_product='$id_product'";
                $exec = mysql_query($query);
                echo "<a href='c:/xampp/htdocs/ETL/folder/$id_product.csv' download>download csv</a>";
                echo "<br><br>";
            
           
            $query = "SELECT * FROM reviews WHERE id_product='$post'";
            $exec = mysql_query($query);
            while($row = mysql_fetch_array($exec)){
            $autor = $row['autor'];
            $pros = $row['advanteges'];
            $cons = $row['disadvanteges'];
            $description = $row['description'];
            $stars = $row['stars'];
            $date = $row['date'];
            $recomend = $row['recomend'];
            $voiceYes = $row['voiceYes'];
            $voiceNo = $row['voiceNo'];
            echo $autor.'<br>';
            echo "Zalety: ".$pros."<br>";
            echo "Wady: ".$cons."<br>";
            echo $description."<br>";
            echo "Stars: ".$stars."<br>";
            echo "Date: ".$date."<br>";
            echo $recomend."<br>";
            echo "Głosy za: ".$voiceYes."; Głosy przeciw: ".$voiceNo."<br><br>";
            

            $q = "SELECT * INTO OUTFILE 'c:/xampp/htdocs/ETL/folder/$autor$date.txt' FIELDS TERMINATED BY ' ' OPTIONALLY ENCLOSED BY ' ' LINES TERMINATED BY ' ' FROM reviews WHERE `autor`='$autor' AND `date`='$date'";
            $exe = mysql_query($q);
            echo "<a href='c:/xampp/htdocs/ETL/folder/$autor$date.txt' download>download txt</a>";
            echo '<br>';
        }
        
        }
        
      
        
    }

}

new Bootstrap();
