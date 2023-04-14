<?php

require_once 'vendor/autoload.php';

$configs    = \Journals\Config::get();

$fund       = filter_var($_REQUEST['fund'], FILTER_SANITIZE_SPECIAL_CHARS);
$fundName   = filter_var($_REQUEST['fundName'], FILTER_SANITIZE_SPECIAL_CHARS);
$librarians = filter_var($_REQUEST['librarians'], FILTER_SANITIZE_SPECIAL_CHARS);

$db = new Database\Database();
$db->host($configs['database']['host'])
   ->dbName($configs['database']['database'])
   ->username($configs['database']['username'])
   ->password($configs['database']['password'])
   ->connect();

// Funds list
$funds = $db->select('DISTINCT `subAccount`')
            ->from('`journals`')
            ->orderBy('`subAccount`')
            ->fetchAll();

// Journal list
$journals = $db->select('MAX(`account`) AS `account`, MAX(`subAccount`) AS `subAccount`, MAX(`title`) AS `title`, MAX(`orderNumber`) AS `orderNumber`, MAX(`titleControl`) AS `titleControl`, MAX(`issn`) AS `issn`, MAX(`callNumber`) AS `callNumber`, MAX(`notes`) AS `notes`, MAX(`objectId`) AS `objectId`, MAX(`sfxSortableTitle`) AS `sfxSortableTitle`, MAX(`sfxTitle`) AS `sfxTitle`, MAX(`sfxIssn`) AS `sfxIssn`, MAX(`sfxEIssn`) AS `sfxEIssn`, MAX(`lccn`) AS `lccn`, MAX(`copies`) AS `copies`, MAX(`price2016`) AS `price2016`, MAX(`price2015`) AS `price2015`, MAX(`platforms`) AS `platforms`, MAX(`usage2012`) AS `usage2012`, MAX(`usage2013`) AS `usage2013`, MAX(`usage2014`) AS `usage2014`, MAX(`usage2015`) AS `usage2015`, MAX(`usage2016`) AS `usage2016`, MAX(`rank`) AS `rank`, MAX(`type`) AS `type`, MAX(`sjrBestQuartile`) AS `sjrBestQuartile`, MAX(`hIndex`) AS `hIndex`, MAX(`totalDocs2015`) AS `totalDocs2015`, MAX(`totalDocs3Years`) AS `totalDocs3Years`, MAX(`totalRefs`) AS `totalRefs`, MAX(`totalCites3Years`) AS `totalCites3Years`, MAX(`citableDocs3Years`) AS `citableDocs3Years`, MAX(`citesPerDoc2Years`) AS `citesPerDoc2Years`, MAX(`refsPerDoc`) AS `refsPerDoc`, MAX(`country`) AS `country`, MAX(`snip1999`) AS `snip1999`, MAX(`ipp1999`) AS `ipp1999`, MAX(`sjr1999`) AS `sjr1999`, MAX(`snip2000`) AS `snip2000`, MAX(`ipp2000`) AS `ipp2000`, MAX(`sjr2000`) AS `sjr2000`, MAX(`snip2001`) AS `snip2001`, MAX(`ipp2001`) AS `ipp2001`, MAX(`sjr2001`) AS `sjr2001`, MAX(`snip2002`) AS `snip2002`, MAX(`ipp2002`) AS `ipp2002`, MAX(`sjr2002`) AS `sjr2002`, MAX(`snip2003`) AS `snip2003`, MAX(`ipp2003`) AS `ipp2003`, MAX(`sjr2003`) AS `sjr2003`, MAX(`snip2004`) AS `snip2004`, MAX(`ipp2004`) AS `ipp2004`, MAX(`sjr2004`) AS `sjr2004`, MAX(`snip2005`) AS `snip2005`, MAX(`ipp2005`) AS `ipp2005`, MAX(`sjr2005`) AS `sjr2005`, MAX(`snip2006`) AS `snip2006`, MAX(`ipp2006`) AS `ipp2006`, MAX(`sjr2006`) AS `sjr2006`, MAX(`snip2007`) AS `snip2007`, MAX(`ipp2007`) AS `ipp2007`, MAX(`sjr2007`) AS `sjr2007`, MAX(`snip2008`) AS `snip2008`, MAX(`ipp2008`) AS `ipp2008`, MAX(`sjr2008`) AS `sjr2008`, MAX(`snip2009`) AS `snip2009`, MAX(`ipp2009`) AS `ipp2009`, MAX(`sjr2009`) AS `sjr2009`, MAX(`snip2010`) AS `snip2010`, MAX(`ipp2010`) AS `ipp2010`, MAX(`sjr2010`) AS `sjr2010`, MAX(`snip2011`) AS `snip2011`, MAX(`ipp2011`) AS `ipp2011`, MAX(`sjr2011`) AS `sjr2011`, MAX(`snip2012`) AS `snip2012`, MAX(`ipp2012`) AS `ipp2012`, MAX(`sjr2012`) AS `sjr2012`, MAX(`snip2013`) AS `snip2013`, MAX(`ipp2013`) AS `ipp2013`, MAX(`sjr2013`) AS `sjr2013`, MAX(`snip2014`) AS `snip2014`, MAX(`ipp2014`) AS `ipp2014`, MAX(`sjr2014`) AS `sjr2014`, MAX(`snip2015`) AS `snip2015`, MAX(`ipp2015`) AS `ipp2015`, MAX(`sjr2015`) AS `sjr2015`, MAX(`asjc`) AS `asjc`')
               ->from('`journals`')
               ->where('`subAccount` = :fund')
               ->groupBy('`titleControl`')
               ->orderBy('`sfxSortableTitle`')
               ->bind(['fund' => $fund])
               ->fetchAll();

// Number titles
$numTitles = $db->select('DISTINCT COUNT(`titleControl`) AS `numTitles`')
                ->from('`journals`')
                ->where('`subAccount` = :fund')
                ->bind(['fund' => $fund])
                ->fetch()['numTitles'];
// Average cost
$averagePrice = $db->select('ROUND(AVG(CASE WHEN `price2016` > `price2015` THEN `price2016` ELSE `price2015` END), 2) AS `averagePrice`')
                   ->from('`journals`')
                   ->where('`subAccount` = :fund AND ((`price2016` IS NOT NULL AND `price2016` > 0) OR (`price2015` IS NOT NULL AND `price2015` > 0))')
                   ->bind(['fund' => $fund])
                   ->fetch()['averagePrice'];
// Total spend
$totalSpend = $db->select('SUM(CASE WHEN `price2016` > `price2015` THEN `price2016` ELSE `price2015` END) AS `price`')
                 ->from('`journals`')
                 ->where('`subAccount` = :fund AND ((`price2016` IS NOT NULL AND `price2016` > 0) OR (`price2015` IS NOT NULL AND `price2015` > 0))')
                 ->groupBy('`subAccount`')
                 ->bind(['fund' => $fund])
                 ->fetch()['price'];
// Average use
$averageUse = $db->select('ROUND(AVG(`usage2015`), 0) AS `averageUse`')
                 ->from('`journals`')
                 ->where('`subAccount` = :fund AND `usage2015` IS NOT NULL')
                 ->bind(['fund' => $fund])
                 ->fetch()['averageUse'];
// Average h-index
$averageHIndex = $db->select('ROUND(AVG(`hIndex`), 0) AS `averageHIndex`')
                    ->from('`journals`')
                    ->where('`subAccount` = :fund AND `hIndex` IS NOT NULL')
                    ->bind(['fund' => $fund])
                    ->fetch()['averageHIndex'];
// Average IPP
$averageIpp = $db->select('ROUND(AVG(`ipp2015`), 3) AS `averageIpp`')
                 ->from('`journals`')
                 ->where('`subAccount` = :fund AND `ipp2015` IS NOT NULL')
                 ->bind(['fund' => $fund])
                 ->fetch()['averageIpp'];

new \Journals\Twig('fund.tmpl', array('fund' => $fund, 'fundName' => $fundName, 'librarians' => $librarians, 'numTitles' => $numTitles, 'totalSpend' => $totalSpend, 'averagePrice' => $averagePrice, 'averageUse' => $averageUse, 'averageHIndex' => $averageHIndex, 'averageIpp' => $averageIpp, 'journals' => $journals));
