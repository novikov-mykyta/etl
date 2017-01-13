<?php
class Product {

    public $type;
    public $brand;
    public $model;
    public $comments;
    public $id_product;
    public $pageParsed;

    public function productExtract($id) {
        $this->id_product=$id;
        $this->pageParsed = file_get_contents("http://ceneo.pl/" . $id);
        return $this->pageParsed;
    }

    public function productType() {
        $index = '<nav class="breadcrumbs">';
        $closingTag = '</nav>';
        $element = strpos($this->pageParsed, $index);
        $part = substr($this->pageParsed, $element);
        $elements = substr($part, 0, strpos($part, $closingTag));
        $elemArray = explode('</a></span>', $elements);
        $type = trim(strip_tags($elemArray[3]));
        return $type;
    }

    public function productBrand() {
        $index = '<h1 class="product-name js_product-h1-link js_product-force-scroll js_searchInGoogleTooltip"';
        $closingTag = '</h1>';
        $element = strpos($this->pageParsed, $index);
        $part = substr($this->pageParsed, $element);
        $elements = substr($part, 0, strpos($part, $closingTag));
        $elements = strip_tags($elements);
        $elements = explode(" ", $elements);
        $brand = $elements[0];
        return $brand;
    }

    public function productModel() {
        $index = '<h1 class="product-name js_product-h1-link js_product-force-scroll js_searchInGoogleTooltip"';
        $closingTag = '</h1>';
        $element = strpos($this->pageParsed, $index);
        $part = substr($this->pageParsed, $element);
        $elements = substr($part, 0, strpos($part, $closingTag));
        $model = strip_tags($elements);
        return $model;
    }

    public function productComments() {
        $index = '<div class="ProductSublineTags">';
        $closingTag = '</div>';
        $element = strpos($this->pageParsed, $index);
        $part = substr($this->pageParsed, $element);
        $elements = substr($part, 0, strpos($part, $closingTag));
        $comments = strip_tags($elements);
        return $comments;
    }

    public function productTransform() {
        $this->type = $this->productType();
        $this->brand = $this->productBrand();
        $this->model = $this->productModel();
        $this->comments = $this->productComments();
    }

    public function productLoad() {
        $this->productTransform();
        $db = new Database();
        $rows = $db->loadQueriesProduct($this->id_product, $this->type, $this->brand, $this->model, $this->comments) or die(mysql_error());
        
//return $rows;
    }


}

//new Product();
//include ('index.html');