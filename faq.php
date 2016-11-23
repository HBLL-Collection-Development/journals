<?php

require_once 'vendor/autoload.php';

$configs = \Journals\Config::get();

$html = <<<'HTML'
<h1>FAQs</h1>
<p><strong>What is the IPP?</strong></p>
<p>Impact per Publication (IPP): Measures the ratio of citations per article published in a journal. Unlike the standard impact factor, the IPP metric uses a three year citation window, widely considered to be the optimal time period to accurately measure citations in most subject fields.</p>

<p><strong>What is the SJR?</strong></p>
<p>SCImago Journal Rank (SJR)) indicator: It expresses the average number of weighted citations received in the selected year by the documents published in the selected journal in the three previous years, <em>i.e.</em> weighted citations received in year X to documents published in the journal in years X-1, X-2 and X-3. See <a href="http://www.scimagojr.com/SCImagoJournalRank.pdf">detailed description of SJR</a> (PDF).</p>

<p><strong>What is the h-index?</strong></p>
<p>The h-index expresses the journal&rsquo;s number of articles (h) that have received at least h citations. It quantifies both journal scientific productivity and scientific impact and it is also applicable to scientists, countries, etc. (see <a href="http://en.wikipedia.org/wiki/Hirsch_number">H-index wikipedia definition</a>).</p>

<p><strong>What is the SNIP?</strong></p>
<p>Source Normalized Impact per Paper (SNIP): Measures contextual citation impact by weighting citations based on the total number of citations in a subject field. The impact of a single citation is given higher value in subject areas where citations are less likely, and vice versa.</p>

<p><strong>What do some of the other bibliometrics mean?</strong></p>
<p>You can review the <a href="http://www.scimagojr.com/help.php">Scimago help page</a> for details on what the other bibliometrics mean.</p>

<p><strong>What is a use?</strong></p>
<p>A use is an electronic full-text download using <a href="https://www.projectcounter.org">COUNTER-compliant usage statistics</a>. If a journal is available from multiple sources, the usage is summed over all the resources. Print usage is not currently available.</p>

<p><strong>What does it mean when it says there is no data?</strong></p>
<p>There are several reasons you might see &ldquo;No data&rdquo; listed in the table. Commonly, this is because of missing or incorrect ISSNs. Sometimes the data is simply not available. If there are zero uses, it will show &ldquo;0&rdquo; rather than &ldquo;No data&rdquo;.</p>

<p><strong>What do the fund code averages mean?</strong></p>
<p>The fund code averages are the average values for all titles within that one fund code. For price, this is the average of all non-zero, non-missing price data. This means that the average is higher than the actual average price. When using this number to calculate if an individual title is at or below average, this works out favorably for an individual title.</p>

<p><strong>What do the red, yellow, and green colors mean?</strong></p>
<p>Red means that the individual metric is poor compared to the average within that one fund code. Yellow means it is within 15% of the average within that one fund code. Green means that is compares favorably to the average title within that one fund code. No color means there is no data to make a comparison to the average.</p>
HTML;

new \Journals\Twig('base.tmpl', array('title' => 'FAQs', 'content' => $html));
