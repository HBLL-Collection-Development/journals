<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$fundCode = filter_var($_REQUEST['fundCode'], FILTER_SANITIZE_SPECIAL_CHARS);

$budget = new \Journals\Funds();

$librarians = $budget->getLibrarians($fundCode);

echo $librarians;

$fundName = $budget->getFundName($fundCode);

echo $fundName;
