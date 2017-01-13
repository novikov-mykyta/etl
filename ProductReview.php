<?php

class ProductReview {

    public $id;
    private $pageParsedId;
    private $pagination; // pages numeration for comments
    public $elemReviewsNumber;
    public $elementsArray;
    public $pageParsed;
    public $autor = '<div class="product-reviewer">';
    public $pros = '<div class="pros-cell">';
    public $cons = '<div class="cons-cell">';
    public $description = '<p class="product-review-body">';
    public $stars = '<span class="review-score-count">';
    public $date = '<span class="review-time">';
    public $recomend = '<em class="product-recommended">';
    public $voiceYes = '<span id="votes-yes';
    public $voiceNo = '<span id="votes-no';

    public function parseCountPages() {
        $id = $_POST['object'];
        $this->id = $id;
        $this->pageParsed = file_get_contents("http://ceneo.pl/" . $id);
        
        $index = '<li class="page-tab reviews">';
        $closingTag = '</a>';
        $element = strpos($this->pageParsed, $index); // start position of pages element
        $part = substr($this->pageParsed, $element);
        $partEnd = strpos($part, $closingTag);
        $elemReviewsNumberString = strip_tags(substr($part, 0, $partEnd));
        $elemReviewsNumber = str_replace(")", "", substr($elemReviewsNumberString, 19));

        $this->elemReviewsNumber = $elemReviewsNumber;

        if ($elemReviewsNumber % 10 == 0) {
            $pagesCount = $elemReviewsNumber / 10;
        } else {
            $pagesCount = intval($elemReviewsNumber / 10 + 1);
        }
        return $pagesCount;
    }

    public function extractElements() {

        $pagesCount = $this->parseCountPages();
        $index = '<li class="product-review js_product-review">';
        $closingTag = '<input type="hidden"';

        if ($pagesCount > 1) {
            
            $element = strpos($this->pageParsed, $index);
            $part = substr($this->pageParsed, $element);
            $elements = substr($part, 0, strpos($part, $closingTag));
            $elementsArray = explode('<li class="product-review js_product-review">', $elements);


            for ($i = 2; $i <= $pagesCount; $i++) {
                $pageParsed = file_get_contents("http://ceneo.pl/$this->id/" . "opinie-" . $i);
                $element = strpos($pageParsed, $index);
                $part = substr($pageParsed, $element);
                $elements = substr($part, 0, strpos($part, $closingTag));
                $elements = explode('<li class="product-review js_product-review">', $elements);
                foreach ($elements as $elem) {
                    if ($elem != "")
                        array_push($elementsArray, $elem);
                }
            }
        } else {
            
            $element = strpos($this->pageParsed, $index);
            $part = substr($this->pageParsed, $element);
            $partEnd = strpos($part, $closingTag);
            $elements = substr($part, 0, strpos($part, $closingTag));
            $elementsArray = explode('<li class="product-review js_product-review">', $elements);
        }
        array_shift($elementsArray);
        $this->elementsArray = $elementsArray;
        echo "Pobrano stronę dla produktu " . $this->id . '<br>';
    }

    public function transformElement($e, $index, $closingTag) {
        $position = strpos($e, $index);
        $part = substr($e, $position);
        $elem = strip_tags(substr($part, 0, strpos($part, $closingTag)));
        $elem = trim($elem);
        return $elem;
    }

    public function transformElementProsCons($e, $index, $closingTag) {
        $position = strpos($e, $index);
        $part = substr($e, $position);
        $elem = substr($part, 0, strpos($part, $closingTag));
        $position = strpos($elem, '<ul>');
        $part = substr($elem, $position);
        $elem = substr($part, 0, strpos($part, '</ul>'));
        $elemArray = explode('</li>', $elem);
        $elem = strip_tags(implode(',', $elemArray));
        $elem = trim($elem);
        $elem = explode(',', $elem);
        $counter = 0;
        foreach ($elem as $e) {
            $e = trim($e);
            $elem[$counter] = $e;
            $counter++;
        }
        $elem = implode(',', $elem);
        return $elem;
    }

    public function transformElementStars($e, $index, $closingTag) {
        $position = strpos($e, $index);
        $part = substr($e, $position);
        $elem = strip_tags(substr($part, 0, strpos($part, $closingTag)));
        return substr($elem, 0, 1);
    }

    public function transformElementDate($e, $index, $closingTag) {
        $position = strpos($e, $index);
        $part = substr($e, $position);
        $elem = substr($part, 0, strpos($part, $closingTag));
        $elem = str_replace("<", '&lt', $elem);
        $elem = str_replace(">", '&gt', $elem);
        $position = strpos($elem, '<time datetime="');
        $part = substr($elem, $position);
        $date = substr($elem, 59, 19);
        $date = str_replace("data:", '', $date);
        return $date;
    }

    public function loadElements() {

        $count = 0;
        $db = new Database();
        for ($i = 0; $i < $this->elemReviewsNumber; $i++) {

            $db->loadQueries(
                    $this->id, 
                    $this->transformElement($this->elementsArray[$i], $this->autor, '</div>'), 
                    $this->transformElementProsCons($this->elementsArray[$i], $this->pros, '</div>'), 
                    $this->transformElementProsCons($this->elementsArray[$i], $this->cons, '</ul>'), 
                    $this->transformElement($this->elementsArray[$i], $this->description, '</p>'), 
                    $this->transformElementStars($this->elementsArray[$i], $this->stars, '</span>'),
                    $this->transformElementDate($this->elementsArray[$i], $this->date, '</span>'), 
                    $this->transformElement($this->elementsArray[$i], $this->recomend, '</em>'), 
                    $this->transformElement($this->elementsArray[$i], $this->voiceYes, '</span>'), 
                    $this->transformElement($this->elementsArray[$i], $this->voiceNo, '</span>')
            );
        }
        echo $db->rows . " rows added to reviews scheme<br>";
    }


}
