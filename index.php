<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
$db->query('SELECT DISTINCT `subAccount` FROM `journals` ORDER BY `subAccount`');
$funds = $db->resultSet();
$db = null;

new \Journals\Twig('home.tmpl', array('funds' => $funds));
