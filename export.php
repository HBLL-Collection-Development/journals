<?php

require_once 'vendor/autoload.php';
ini_set('memory_limit', '-1');

$configs = \Journals\Config::get();

$fund = filter_var($_REQUEST['fund'], FILTER_SANITIZE_SPECIAL_CHARS);

$db = new Database\Database();
$db->host($configs['database']['host'])
   ->dbName($configs['database']['database'])
   ->username($configs['database']['username'])
   ->password($configs['database']['password'])
   ->connect();

// Journal list

$url = $configs['temp'].'/fund'.$fund.'.csv';

if ($fund === 'all') {
    $journals = $db->select("'Account', 'Title', 'Sortable Title', 'ISSN', 'eISSN', 'LCCN', 'Title Control', 'Call Number', '2016 Price', '2015 Price', 'Platforms', '2012 Usage', '2013 Usage', '2014 Usage', '2015 Usage', '2016 Usage', 'h-index', 'Total Docs 2015', 'Total Docs 3 Years', 'Total Refs', 'Total Cites 3 Years', 'Citable Docs 3 Years', 'Cites Per Doc 2 Years', 'Refs Per Doc', 'Country', '1999 SNIP', '1999 IPP', '1999 SJR', '2000 SNIP', '2000 IPP', '2000 SJR', '2001 SNIP', '2001 IPP', '2001 SJR', '2002 SNIP', '2002 IPP', '2002 SJR', '2003 SNIP', '2003 IPP', '2003 SJR', '2004 SNIP', '2004 IPP', '2004 SJR', '2005 SNIP', '2005 IPP', '2005 SJR', '2006 SNIP', '2006 IPP', '2006 SJR', '2007 SNIP', '2007 IPP', '2007 SJR', '2008 SNIP', '2008 IPP', '2008 SJR', '2009 SNIP', '2009 IPP', '2009 SJR', '2010 SNIP', '2010 IPP', '2010 SJR', '2011 SNIP', '2011 IPP', '2011 SJR', '2012 SNIP', '2012 IPP', '2012 SJR', '2013 SNIP', '2013 IPP', '2013 SJR', '2014 SNIP', '2014 IPP', '2014 SJR', '2015 SNIP', '2015 IPP', '2015 SJR'")
                   ->unionAll()
                   ->select("MAX(IFNULL(CONCAT('=\"', `account`, '\"'), '')), MAX(IFNULL(`sfxTitle`, '')), MAX(IFNULL(`sfxSortableTitle`, '')), MAX(IFNULL(CONCAT(SUBSTRING(sfxIssn, 1, 4), '-', SUBSTRING(sfxIssn, 5, 8)), '')), MAX(IFNULL(CONCAT(SUBSTRING(sfxIssn, 1, 4), '-', SUBSTRING(sfxEIssn, 5, 8)), '')), MAX(IFNULL(CONCAT('=\"', `lccn`, '\"'), '')), MAX(IFNULL(`titleControl`, '')), MAX(IFNULL(`callNumber`, '')), MAX(IFNULL(`price2016`, '')), MAX(IFNULL(`price2015`, '')), MAX(IFNULL(`platforms`, '')), MAX(IFNULL(`usage2012`, '')), MAX(IFNULL(`usage2013`, '')), MAX(IFNULL(`usage2014`, '')), MAX(IFNULL(`usage2015`, '')), MAX(IFNULL(`usage2016`, '')), MAX(IFNULL(`hIndex`, '')), MAX(IFNULL(`totalDocs2015`, '')), MAX(IFNULL(`totalDocs3Years`, '')), MAX(IFNULL(`totalRefs`, '')), MAX(IFNULL(`totalCites3Years`, '')), MAX(IFNULL(`citableDocs3Years`, '')), MAX(IFNULL(`citesPerDoc2Years`, '')), MAX(IFNULL(`refsPerDoc`, '')), MAX(IFNULL(`country`, '')), MAX(IFNULL(`snip1999`, '')), MAX(IFNULL(`ipp1999`, '')), MAX(IFNULL(`sjr1999`, '')), MAX(IFNULL(`snip2000`, '')), MAX(IFNULL(`ipp2000`, '')), MAX(IFNULL(`sjr2000`, '')), MAX(IFNULL(`snip2001`, '')), MAX(IFNULL(`ipp2001`, '')), MAX(IFNULL(`sjr2001`, '')), MAX(IFNULL(`snip2002`, '')), MAX(IFNULL(`ipp2002`, '')), MAX(IFNULL(`sjr2002`, '')), MAX(IFNULL(`snip2003`, '')), MAX(IFNULL(`ipp2003`, '')), MAX(IFNULL(`sjr2003`, '')), MAX(IFNULL(`snip2004`, '')), MAX(IFNULL(`ipp2004`, '')), MAX(IFNULL(`sjr2004`, '')), MAX(IFNULL(`snip2005`, '')), MAX(IFNULL(`ipp2005`, '')), MAX(IFNULL(`sjr2005`, '')), MAX(IFNULL(`snip2006`, '')), MAX(IFNULL(`ipp2006`, '')), MAX(IFNULL(`sjr2006`, '')), MAX(IFNULL(`snip2007`, '')), MAX(IFNULL(`ipp2007`, '')), MAX(IFNULL(`sjr2007`, '')), MAX(IFNULL(`snip2008`, '')), MAX(IFNULL(`ipp2008`, '')), MAX(IFNULL(`sjr2008`, '')), MAX(IFNULL(`snip2009`, '')), MAX(IFNULL(`ipp2009`, '')), MAX(IFNULL(`sjr2009`, '')), MAX(IFNULL(`snip2010`, '')), MAX(IFNULL(`ipp2010`, '')), MAX(IFNULL(`sjr2010`, '')), MAX(IFNULL(`snip2011`, '')), MAX(IFNULL(`ipp2011`, '')), MAX(IFNULL(`sjr2011`, '')), MAX(IFNULL(`snip2012`, '')), MAX(IFNULL(`ipp2012`, '')), MAX(IFNULL(`sjr2012`, '')), MAX(IFNULL(`snip2013`, '')), MAX(IFNULL(`ipp2013`, '')), MAX(IFNULL(`sjr2013`, '')), MAX(IFNULL(`snip2014`, '')), MAX(IFNULL(`ipp2014`, '')), MAX(IFNULL(`sjr2014`, '')), MAX(IFNULL(`snip2015`, '')), MAX(IFNULL(`ipp2015`, '')), MAX(IFNULL(`sjr2015`, ''))")
                   ->from("`journals`")
                   ->groupBy("`titleControl`")
                   ->fetchAll();
} else {
    $journals = $db->select("'Account', 'Title', 'Sortable Title', 'ISSN', 'eISSN', 'LCCN', 'Title Control', 'Call Number', '2016 Price', '2015 Price', 'Platforms', '2012 Usage', '2013 Usage', '2014 Usage', '2015 Usage', '2016 Usage', 'h-index', 'Total Docs 2015', 'Total Docs 3 Years', 'Total Refs', 'Total Cites 3 Years', 'Citable Docs 3 Years', 'Cites Per Doc 2 Years', 'Refs Per Doc', 'Country', '1999 SNIP', '1999 IPP', '1999 SJR', '2000 SNIP', '2000 IPP', '2000 SJR', '2001 SNIP', '2001 IPP', '2001 SJR', '2002 SNIP', '2002 IPP', '2002 SJR', '2003 SNIP', '2003 IPP', '2003 SJR', '2004 SNIP', '2004 IPP', '2004 SJR', '2005 SNIP', '2005 IPP', '2005 SJR', '2006 SNIP', '2006 IPP', '2006 SJR', '2007 SNIP', '2007 IPP', '2007 SJR', '2008 SNIP', '2008 IPP', '2008 SJR', '2009 SNIP', '2009 IPP', '2009 SJR', '2010 SNIP', '2010 IPP', '2010 SJR', '2011 SNIP', '2011 IPP', '2011 SJR', '2012 SNIP', '2012 IPP', '2012 SJR', '2013 SNIP', '2013 IPP', '2013 SJR', '2014 SNIP', '2014 IPP', '2014 SJR', '2015 SNIP', '2015 IPP', '2015 SJR'")
                   ->unionAll()
                   ->select("MAX(IFNULL(CONCAT('=\"', `account`, '\"'), '')), MAX(IFNULL(`sfxTitle`, '')), MAX(IFNULL(`sfxSortableTitle`, '')), MAX(IFNULL(CONCAT(SUBSTRING(sfxIssn, 1, 4), '-', SUBSTRING(sfxIssn, 5, 8)), '')), MAX(IFNULL(CONCAT(SUBSTRING(sfxIssn, 1, 4), '-', SUBSTRING(sfxEIssn, 5, 8)), '')), MAX(IFNULL(CONCAT('=\"', `lccn`, '\"'), '')), MAX(IFNULL(`titleControl`, '')), MAX(IFNULL(`callNumber`, '')), MAX(IFNULL(`price2016`, '')), MAX(IFNULL(`price2015`, '')), MAX(IFNULL(`platforms`, '')), MAX(IFNULL(`usage2012`, '')), MAX(IFNULL(`usage2013`, '')), MAX(IFNULL(`usage2014`, '')), MAX(IFNULL(`usage2015`, '')), MAX(IFNULL(`usage2016`, '')), MAX(IFNULL(`hIndex`, '')), MAX(IFNULL(`totalDocs2015`, '')), MAX(IFNULL(`totalDocs3Years`, '')), MAX(IFNULL(`totalRefs`, '')), MAX(IFNULL(`totalCites3Years`, '')), MAX(IFNULL(`citableDocs3Years`, '')), MAX(IFNULL(`citesPerDoc2Years`, '')), MAX(IFNULL(`refsPerDoc`, '')), MAX(IFNULL(`country`, '')), MAX(IFNULL(`snip1999`, '')), MAX(IFNULL(`ipp1999`, '')), MAX(IFNULL(`sjr1999`, '')), MAX(IFNULL(`snip2000`, '')), MAX(IFNULL(`ipp2000`, '')), MAX(IFNULL(`sjr2000`, '')), MAX(IFNULL(`snip2001`, '')), MAX(IFNULL(`ipp2001`, '')), MAX(IFNULL(`sjr2001`, '')), MAX(IFNULL(`snip2002`, '')), MAX(IFNULL(`ipp2002`, '')), MAX(IFNULL(`sjr2002`, '')), MAX(IFNULL(`snip2003`, '')), MAX(IFNULL(`ipp2003`, '')), MAX(IFNULL(`sjr2003`, '')), MAX(IFNULL(`snip2004`, '')), MAX(IFNULL(`ipp2004`, '')), MAX(IFNULL(`sjr2004`, '')), MAX(IFNULL(`snip2005`, '')), MAX(IFNULL(`ipp2005`, '')), MAX(IFNULL(`sjr2005`, '')), MAX(IFNULL(`snip2006`, '')), MAX(IFNULL(`ipp2006`, '')), MAX(IFNULL(`sjr2006`, '')), MAX(IFNULL(`snip2007`, '')), MAX(IFNULL(`ipp2007`, '')), MAX(IFNULL(`sjr2007`, '')), MAX(IFNULL(`snip2008`, '')), MAX(IFNULL(`ipp2008`, '')), MAX(IFNULL(`sjr2008`, '')), MAX(IFNULL(`snip2009`, '')), MAX(IFNULL(`ipp2009`, '')), MAX(IFNULL(`sjr2009`, '')), MAX(IFNULL(`snip2010`, '')), MAX(IFNULL(`ipp2010`, '')), MAX(IFNULL(`sjr2010`, '')), MAX(IFNULL(`snip2011`, '')), MAX(IFNULL(`ipp2011`, '')), MAX(IFNULL(`sjr2011`, '')), MAX(IFNULL(`snip2012`, '')), MAX(IFNULL(`ipp2012`, '')), MAX(IFNULL(`sjr2012`, '')), MAX(IFNULL(`snip2013`, '')), MAX(IFNULL(`ipp2013`, '')), MAX(IFNULL(`sjr2013`, '')), MAX(IFNULL(`snip2014`, '')), MAX(IFNULL(`ipp2014`, '')), MAX(IFNULL(`sjr2014`, '')), MAX(IFNULL(`snip2015`, '')), MAX(IFNULL(`ipp2015`, '')), MAX(IFNULL(`sjr2015`, ''))")
                   ->from("`journals`")
                   ->where("`subAccount` = :fund")
                   ->groupBy("`titleControl`")
                   ->bind(['fund' => $fund])
                   ->fetchAll();
}

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
