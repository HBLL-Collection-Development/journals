<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$db = new Database\Database();
$db->host($configs['database']['host'])
   ->dbName($configs['database']['database'])
   ->username($configs['database']['username'])
   ->password($configs['database']['password'])
   ->connect();
$funds = $db->select('DISTINCT `subAccount`')
            ->from('`journals`')
            ->orderBy('`subAccount`')
            ->fetchAll();
$budget = new \Journals\Funds();
foreach ($funds as $fund) {
    $librarians = $budget->getLibrarians($fund['subAccount']);
    $fundName = $budget->getFundName($fund['subAccount']);
    $fundCodes[$fund['subAccount']] = array('librarians' => $librarians, 'fundName' => $fundName);
}

new \Journals\Twig('home.tmpl', array('funds' => $fundCodes));
