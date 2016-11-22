<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$titleControl = filter_var($_REQUEST['titleControl'], FILTER_SANITIZE_STRING);

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
$db->query('SELECT * FROM `journals` WHERE `titleControl` = :titleControl GROUP BY `titleControl`');
$db->bind('titleControl', $titleControl);
$journal = $db->single();
$db = null;

new \Journals\Twig('journal.tmpl', array('titleControl' => $titleControl, 'journal' => $journal));
