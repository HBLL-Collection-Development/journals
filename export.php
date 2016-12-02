<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$fund = filter_var($_REQUEST['fund'], FILTER_SANITIZE_STRING);

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
// Journal list
$url = $configs['temp'].'/fund'.$fund.'.csv';
if ($fund === 'all') {
    $db->query('SELECT \'Account\', \'Fund Code\', \'Title\', \'Sortable Title\', \'ISSN\', \'eISSN\', \'LCCN\', \'Title Control\', \'Call Number\', \'2016 Price\', \'2015 Price\', \'Platforms\', \'2012 Usage\', \'2013 Usage\', \'2014 Usage\', \'2015 Usage\', \'2016 Usage\', \'h-index\', \'Total Docs 2015\', \'Total Docs 3 Years\', \'Total Refs\', \'Total Cites 3 Years\', \'Citable Docs 3 Years\', \'Cites Per Doc 2 Years\', \'Refs Per Doc\', \'Country\', \'1999 SNIP\', \'1999 IPP\', \'1999 SJR\', \'2000 SNIP\', \'2000 IPP\', \'2000 SJR\', \'2001 SNIP\', \'2001 IPP\', \'2001 SJR\', \'2002 SNIP\', \'2002 IPP\', \'2002 SJR\', \'2003 SNIP\', \'2003 IPP\', \'2003 SJR\', \'2004 SNIP\', \'2004 IPP\', \'2004 SJR\', \'2005 SNIP\', \'2005 IPP\', \'2005 SJR\', \'2006 SNIP\', \'2006 IPP\', \'2006 SJR\', \'2007 SNIP\', \'2007 IPP\', \'2007 SJR\', \'2008 SNIP\', \'2008 IPP\', \'2008 SJR\', \'2009 SNIP\', \'2009 IPP\', \'2009 SJR\', \'2010 SNIP\', \'2010 IPP\', \'2010 SJR\', \'2011 SNIP\', \'2011 IPP\', \'2011 SJR\', \'2012 SNIP\', \'2012 IPP\', \'2012 SJR\', \'2013 SNIP\', \'2013 IPP\', \'2013 SJR\', \'2014 SNIP\', \'2014 IPP\', \'2014 SJR\', \'2015 SNIP\', \'2015 IPP\', \'2015 SJR\' UNION ALL SELECT IFNULL(CONCAT("\=\"", `account`, "\""), \'\'), IFNULL(CONCAT("\=\"", `subAccount`, "\""), \'\'), IFNULL(`sfxTitle`, \'\'), IFNULL(`sfxSortableTitle`, \'\'), IFNULL(CONCAT(SUBSTRING(sfxIssn, 1, 4), "-", SUBSTRING(sfxIssn, 5, 8)), \'\'), IFNULL(CONCAT(SUBSTRING(sfxIssn, 1, 4), "-", SUBSTRING(sfxEIssn, 5, 8)), \'\'), IFNULL(CONCAT("\=\"", `lccn`, "\""), \'\'), IFNULL(`titleControl`, \'\'), IFNULL(`callNumber`, \'\'), IFNULL(`price2016`, \'\'), IFNULL(`price2015`, \'\'), IFNULL(`platforms`, \'\'), IFNULL(`usage2012`, \'\'), IFNULL(`usage2013`, \'\'), IFNULL(`usage2014`, \'\'), IFNULL(`usage2015`, \'\'), IFNULL(`usage2016`, \'\'), IFNULL(`hIndex`, \'\'), IFNULL(`totalDocs2015`, \'\'), IFNULL(`totalDocs3Years`, \'\'), IFNULL(`totalRefs`, \'\'), IFNULL(`totalCites3Years`, \'\'), IFNULL(`citableDocs3Years`, \'\'), IFNULL(`citesPerDoc2Years`, \'\'), IFNULL(`refsPerDoc`, \'\'), IFNULL(`country`, \'\'), IFNULL(`snip1999`, \'\'), IFNULL(`ipp1999`, \'\'), IFNULL(`sjr1999`, \'\'), IFNULL(`snip2000`, \'\'), IFNULL(`ipp2000`, \'\'), IFNULL(`sjr2000`, \'\'), IFNULL(`snip2001`, \'\'), IFNULL(`ipp2001`, \'\'), IFNULL(`sjr2001`, \'\'), IFNULL(`snip2002`, \'\'), IFNULL(`ipp2002`, \'\'), IFNULL(`sjr2002`, \'\'), IFNULL(`snip2003`, \'\'), IFNULL(`ipp2003`, \'\'), IFNULL(`sjr2003`, \'\'), IFNULL(`snip2004`, \'\'), IFNULL(`ipp2004`, \'\'), IFNULL(`sjr2004`, \'\'), IFNULL(`snip2005`, \'\'), IFNULL(`ipp2005`, \'\'), IFNULL(`sjr2005`, \'\'), IFNULL(`snip2006`, \'\'), IFNULL(`ipp2006`, \'\'), IFNULL(`sjr2006`, \'\'), IFNULL(`snip2007`, \'\'), IFNULL(`ipp2007`, \'\'), IFNULL(`sjr2007`, \'\'), IFNULL(`snip2008`, \'\'), IFNULL(`ipp2008`, \'\'), IFNULL(`sjr2008`, \'\'), IFNULL(`snip2009`, \'\'), IFNULL(`ipp2009`, \'\'), IFNULL(`sjr2009`, \'\'), IFNULL(`snip2010`, \'\'), IFNULL(`ipp2010`, \'\'), IFNULL(`sjr2010`, \'\'), IFNULL(`snip2011`, \'\'), IFNULL(`ipp2011`, \'\'), IFNULL(`sjr2011`, \'\'), IFNULL(`snip2012`, \'\'), IFNULL(`ipp2012`, \'\'), IFNULL(`sjr2012`, \'\'), IFNULL(`snip2013`, \'\'), IFNULL(`ipp2013`, \'\'), IFNULL(`sjr2013`, \'\'), IFNULL(`snip2014`, \'\'), IFNULL(`ipp2014`, \'\'), IFNULL(`sjr2014`, \'\'), IFNULL(`snip2015`, \'\'), IFNULL(`ipp2015`, \'\'), IFNULL(`sjr2015`, \'\') FROM `journals` GROUP BY `titleControl`');
} else {
    $db->query('SELECT \'Account\', \'Title\', \'Sortable Title\', \'ISSN\', \'eISSN\', \'LCCN\', \'Title Control\', \'Call Number\', \'2016 Price\', \'2015 Price\', \'Platforms\', \'2012 Usage\', \'2013 Usage\', \'2014 Usage\', \'2015 Usage\', \'2016 Usage\', \'h-index\', \'Total Docs 2015\', \'Total Docs 3 Years\', \'Total Refs\', \'Total Cites 3 Years\', \'Citable Docs 3 Years\', \'Cites Per Doc 2 Years\', \'Refs Per Doc\', \'Country\', \'1999 SNIP\', \'1999 IPP\', \'1999 SJR\', \'2000 SNIP\', \'2000 IPP\', \'2000 SJR\', \'2001 SNIP\', \'2001 IPP\', \'2001 SJR\', \'2002 SNIP\', \'2002 IPP\', \'2002 SJR\', \'2003 SNIP\', \'2003 IPP\', \'2003 SJR\', \'2004 SNIP\', \'2004 IPP\', \'2004 SJR\', \'2005 SNIP\', \'2005 IPP\', \'2005 SJR\', \'2006 SNIP\', \'2006 IPP\', \'2006 SJR\', \'2007 SNIP\', \'2007 IPP\', \'2007 SJR\', \'2008 SNIP\', \'2008 IPP\', \'2008 SJR\', \'2009 SNIP\', \'2009 IPP\', \'2009 SJR\', \'2010 SNIP\', \'2010 IPP\', \'2010 SJR\', \'2011 SNIP\', \'2011 IPP\', \'2011 SJR\', \'2012 SNIP\', \'2012 IPP\', \'2012 SJR\', \'2013 SNIP\', \'2013 IPP\', \'2013 SJR\', \'2014 SNIP\', \'2014 IPP\', \'2014 SJR\', \'2015 SNIP\', \'2015 IPP\', \'2015 SJR\' UNION ALL SELECT IFNULL(CONCAT("\=\"", `account`, "\""), \'\'), IFNULL(`sfxTitle`, \'\'), IFNULL(`sfxSortableTitle`, \'\'), IFNULL(CONCAT(SUBSTRING(sfxIssn, 1, 4), "-", SUBSTRING(sfxIssn, 5, 8)), \'\'), IFNULL(CONCAT(SUBSTRING(sfxIssn, 1, 4), "-", SUBSTRING(sfxEIssn, 5, 8)), \'\'), IFNULL(CONCAT("\=\"", `lccn`, "\""), \'\'), IFNULL(`titleControl`, \'\'), IFNULL(`callNumber`, \'\'), IFNULL(`price2016`, \'\'), IFNULL(`price2015`, \'\'), IFNULL(`platforms`, \'\'), IFNULL(`usage2012`, \'\'), IFNULL(`usage2013`, \'\'), IFNULL(`usage2014`, \'\'), IFNULL(`usage2015`, \'\'), IFNULL(`usage2016`, \'\'), IFNULL(`hIndex`, \'\'), IFNULL(`totalDocs2015`, \'\'), IFNULL(`totalDocs3Years`, \'\'), IFNULL(`totalRefs`, \'\'), IFNULL(`totalCites3Years`, \'\'), IFNULL(`citableDocs3Years`, \'\'), IFNULL(`citesPerDoc2Years`, \'\'), IFNULL(`refsPerDoc`, \'\'), IFNULL(`country`, \'\'), IFNULL(`snip1999`, \'\'), IFNULL(`ipp1999`, \'\'), IFNULL(`sjr1999`, \'\'), IFNULL(`snip2000`, \'\'), IFNULL(`ipp2000`, \'\'), IFNULL(`sjr2000`, \'\'), IFNULL(`snip2001`, \'\'), IFNULL(`ipp2001`, \'\'), IFNULL(`sjr2001`, \'\'), IFNULL(`snip2002`, \'\'), IFNULL(`ipp2002`, \'\'), IFNULL(`sjr2002`, \'\'), IFNULL(`snip2003`, \'\'), IFNULL(`ipp2003`, \'\'), IFNULL(`sjr2003`, \'\'), IFNULL(`snip2004`, \'\'), IFNULL(`ipp2004`, \'\'), IFNULL(`sjr2004`, \'\'), IFNULL(`snip2005`, \'\'), IFNULL(`ipp2005`, \'\'), IFNULL(`sjr2005`, \'\'), IFNULL(`snip2006`, \'\'), IFNULL(`ipp2006`, \'\'), IFNULL(`sjr2006`, \'\'), IFNULL(`snip2007`, \'\'), IFNULL(`ipp2007`, \'\'), IFNULL(`sjr2007`, \'\'), IFNULL(`snip2008`, \'\'), IFNULL(`ipp2008`, \'\'), IFNULL(`sjr2008`, \'\'), IFNULL(`snip2009`, \'\'), IFNULL(`ipp2009`, \'\'), IFNULL(`sjr2009`, \'\'), IFNULL(`snip2010`, \'\'), IFNULL(`ipp2010`, \'\'), IFNULL(`sjr2010`, \'\'), IFNULL(`snip2011`, \'\'), IFNULL(`ipp2011`, \'\'), IFNULL(`sjr2011`, \'\'), IFNULL(`snip2012`, \'\'), IFNULL(`ipp2012`, \'\'), IFNULL(`sjr2012`, \'\'), IFNULL(`snip2013`, \'\'), IFNULL(`ipp2013`, \'\'), IFNULL(`sjr2013`, \'\'), IFNULL(`snip2014`, \'\'), IFNULL(`ipp2014`, \'\'), IFNULL(`sjr2014`, \'\'), IFNULL(`snip2015`, \'\'), IFNULL(`ipp2015`, \'\'), IFNULL(`sjr2015`, \'\') FROM `journals` WHERE `subAccount` = :fund GROUP BY `titleControl`');
    $db->bind('fund', $fund);
}
$journals = $db->resultSet();

if (file_exists($url)) {
    unlink($url);
}

$fp = fopen($url, 'w');
foreach ($journals as $journal) {
    fputcsv($fp, $journal);
}
fclose($fp);

header('Content-Type: application/csv');
header('Content-Disposition: attachment; filename="fund'.$fund.'.csv"');
header('Content-Description: File Transfer');
header('Content-Type: application/csv');
header('Content-Disposition: attachment; filename="fund'.$fund.'.csv"');
header('Expires: 0');
header('Cache-Control: must-revalidate');
header('Pragma: public');
header('Content-Length: '.filesize($url));
readfile($url);
exit;
