<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$titleControl = filter_var($_REQUEST['titleControl'], FILTER_SANITIZE_STRING);
$fund = filter_var($_REQUEST['fund'], FILTER_SANITIZE_STRING);
$fundName = filter_var($_REQUEST['fundName'], FILTER_SANITIZE_STRING);
$librarians = filter_var($_REQUEST['librarians'], FILTER_SANITIZE_STRING);

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
$db->query('SELECT * FROM `journals` WHERE `titleControl` = :titleControl GROUP BY `titleControl`');
$db->bind('titleControl', $titleControl);
$journal = $db->single();

$issn = $journal['sfxIssn'];
$eIssn = $journal['sfxEIssn'];

$db->query('SELECT SUM(`total`) AS `total`, `year`, `platform` FROM `usage` WHERE `issn` = :issn OR `issn` = :eIssn OR `eIssn` = :issn OR `eIssn` = :eIssn  GROUP BY `platform`, `year` ORDER BY `platform`, `year`');
$db->bind('issn', $issn);
$db->bind('eIssn', $eIssn);
$usage = $db->resultSet();

$db->query('SELECT MIN(`year`) AS `min`, MAX(`year`) AS `max` FROM `usage` WHERE `issn` = :issn OR `eIssn` = :issn');
$db->bind('issn', $issn);
$range = $db->single();

$db->query('SELECT SUM(`total`) AS `total`, `year` FROM `usage` WHERE `issn` = :issn OR `eIssn` = :issn GROUP BY `year` ORDER BY `YEAR`');
$db->bind('issn', $issn);
$totals = $db->resultSet();

$db = null;

new \Journals\Twig('journal.tmpl', array('titleControl' => $titleControl, 'fund' => $fund, 'fundName' => $fundName, 'librarians' => $librarians, 'usage' => $usage, 'totals' => $totals, 'range' => $range, 'journal' => $journal));
