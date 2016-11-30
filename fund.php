<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$fund = filter_var($_REQUEST['fund'], FILTER_SANITIZE_STRING);
$fundName = filter_var($_REQUEST['fundName'], FILTER_SANITIZE_STRING);
$librarians = filter_var($_REQUEST['librarians'], FILTER_SANITIZE_STRING);

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
// Journal list
$db->query('SELECT * FROM `journals` WHERE `subAccount` = :fund GROUP BY `titleControl` ORDER BY `sfxSortableTitle`');
$db->bind('fund', $fund);
$journals = $db->resultSet();
// Number titles
$db->query('SELECT DISTINCT COUNT(`titleControl`) AS `numTitles` FROM `journals` WHERE `subAccount` = :fund');
$db->bind('fund', $fund);
$numTitles = $db->single();
$numTitles = $numTitles['numTitles'];
// Average cost
$db->query('SELECT ROUND(AVG(CASE WHEN `price2016` > `price2015` THEN `price2016` ELSE `price2015` END), 2) AS `averagePrice` FROM `journals` WHERE `subAccount` = :fund AND ((`price2016` IS NOT NULL AND `price2016` > 0) OR (`price2015` IS NOT NULL AND `price2015` > 0))');
$db->bind('fund', $fund);
$averagePrice = $db->single();
$averagePrice = $averagePrice['averagePrice'];
// Average use
$db->query('SELECT ROUND(AVG(`usage2015`), 0) AS `averageUse` FROM `journals` WHERE `subAccount` = :fund AND `usage2015` IS NOT NULL');
$db->bind('fund', $fund);
$averageUse = $db->single();
$averageUse = $averageUse['averageUse'];
// Average h-index
$db->query('SELECT ROUND(AVG(`hIndex`), 0) AS `averageHIndex` FROM `journals` WHERE `subAccount` = :fund AND `hIndex` IS NOT NULL');
$db->bind('fund', $fund);
$averageHIndex = $db->single();
$averageHIndex = $averageHIndex['averageHIndex'];
// Average IPP
$db->query('SELECT ROUND(AVG(`ipp2015`), 3) AS `averageIpp` FROM `journals` WHERE `subAccount` = :fund AND `ipp2015` IS NOT NULL');
$db->bind('fund', $fund);
$averageIpp = $db->single();
$averageIpp = $averageIpp['averageIpp'];
$db = null;

new \Journals\Twig('fund.tmpl', array('fund' => $fund, 'fundName' => $fundName, 'librarians' => $librarians, 'numTitles' => $numTitles, 'averagePrice' => $averagePrice, 'averageUse' => $averageUse, 'averageHIndex' => $averageHIndex, 'averageIpp' => $averageIpp, 'journals' => $journals));
