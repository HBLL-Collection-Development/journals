<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$titleControl = filter_var($_REQUEST['titleControl'], FILTER_SANITIZE_STRING);

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
$db->query('SELECT * FROM `journals` WHERE `titleControl` = :titleControl GROUP BY `titleControl`');
$db->bind('titleControl', $titleControl);
$journal = $db->single();

$issn = $journal['issn'];

$db->query('SELECT `total`, `year`, `platform` FROM `USAGE` WHERE `issn` = :issn OR `eIssn` = :issn ORDER BY `platform`, `year`');
$db->bind('issn', $issn);
$usage = $db->resultSet();

$db->query('SELECT MIN(`year`) AS `min`, MAX(`year`) AS `max` FROM `USAGE` WHERE `issn` = :issn OR `eIssn` = :issn');
$db->bind('issn', $issn);
$range = $db->single();

$db->query('SELECT SUM(`total`) AS `total`, `year` FROM `usage` WHERE `issn` = :issn OR `eIssn` = :issn GROUP BY `year` ORDER BY `YEAR`');
$db->bind('issn', $issn);
$totals = $db->resultSet();

$db = null;

new \Journals\Twig('journal.tmpl', array('titleControl' => $titleControl, 'usage' => $usage, 'totals' => $totals, 'range' => $range, 'journal' => $journal));
