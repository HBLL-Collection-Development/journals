<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$fund = filter_var($_REQUEST['fund'], FILTER_SANITIZE_STRING);

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
$db->query('SELECT * FROM `journals` WHERE `subAccount` = :fund GROUP BY `titleControl` ORDER BY `sfxSortableTitle`');
$db->bind('fund', $fund);
$journals = $db->resultSet();
$db = null;

new \Journals\Twig('fund.tmpl', array('fund' => $fund, 'journals' => $journals));
