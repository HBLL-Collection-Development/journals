-- About 1–2 minutes to run

--
-- ****** Drop all tables that are about to be generated to make sure we start fresh ******
--

DROP TABLE IF EXISTS `usage`;
DROP TABLE IF EXISTS `usageTemp`;
DROP TABLE IF EXISTS `journals`;
DROP TABLE IF EXISTS `journalsTemp`;
DROP TABLE IF EXISTS `journalsFinal`;
DROP TABLE IF EXISTS `sfxJournals`;
DROP TABLE IF EXISTS `journalsScimago`;
DROP TABLE IF EXISTS `journalsScimago2`;

--
-- ****** `usage` ******
--

-- Sum annual usage data for each row

CREATE TABLE IF NOT EXISTS `usage` (KEY `issnIndx` (`issn`), KEY `eIssnIndx` (`eIssn`), KEY `yearIndx` (`year`))
SELECT
    `title`,
    `publisher`,
    `platform`,
    `doi`,
    `identifier`,
    `issn`,
    `eIssn`,
    `jan`,
    `feb`,
    `mar`,
    `apr`,
    `may`,
    `jun`,
    `jul`,
    `aug`,
    `sep`,
    `oct`,
    `nov`,
    `dec`,
    (IFNULL(`jan`, 0) + IFNULL(`feb`, 0) + IFNULL(`mar`, 0) + IFNULL(`apr`, 0) + IFNULL(`may`, 0) + IFNULL(`jun`, 0) + IFNULL(`jul`, 0) + IFNULL(`aug`, 0) + IFNULL(`sep`, 0) + IFNULL(`oct`, 0) + IFNULL(`nov`, 0) + IFNULL(`dec`, 0)) AS `total`,
    `year`
FROM `rawUsage`;

--
-- ****** `journals` ******
--

CREATE TEMPORARY TABLE `sfxJournals` (KEY `titleControlIndx` (`titleControl`))
SELECT DISTINCT
    `rawWorkflows`.`titleControl`,
    `rawSfx`.`objectId`,
    `rawSfx`.`sortableTitle`,
    `rawSfx`.`title`,
    `rawSfx`.`issn`,
    `rawSfx`.`eIssn`,
    `rawSfx`.`lccn`
FROM `rawWorkflows`
JOIN `rawSfx`
ON (`rawWorkflows`.`issn` = `rawSfx`.`issn` OR `rawWorkflows`.`issn` = `rawSfx`.`eIssn`);

CREATE TABLE IF NOT EXISTS `journals` (KEY `titleControlIndx` (`titleControl`), KEY `yearIndx` (`year`))
SELECT DISTINCT
	`rawWorkflows`.*,
	`sfxJournals`.`objectId`,
    `sfxJournals`.`sortableTitle` AS `sfxSortableTitle`,
    `sfxJournals`.`title` AS `sfxTitle`,
	IFNULL(`sfxJournals`.`issn`, `rawWorkflows`.`issn`) AS `sfxIssn`,
	`sfxJournals`.`eIssn` AS `sfxEIssn`,
	`sfxJournals`.`lccn`
FROM `rawWorkflows`
LEFT JOIN `sfxJournals`
ON `rawWorkflows`.`titleControl` = `sfxJournals`.`titleControl`;

DROP TEMPORARY TABLE `sfxJournals`;

CREATE TABLE `journalsTemp` (KEY `titleControlIndx` (`titleControl`))
SELECT
    *,
    COUNT(`titleControl`) AS `copies`
FROM `journals`
GROUP BY `titleControl`, `year`;

DROP TABLE `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

CREATE TABLE `journalsTemp` (KEY `titleControlIndx` (`titleControl`), KEY `objectIdIndx` (`objectId`))
SELECT
    `account`,
    `subAccount`,
    `title`,
    `orderNumber`,
    `titleControl`,
    `issn`,
    `callNumber`,
    `notes`,
    `objectId`,
    `sfxSortableTitle`,
    `sfxTitle`,
    `sfxIssn`,
    `sfxEIssn`,
    `lccn`,
    `copies`,
    SUM(CASE WHEN `year` = 2016 THEN IFNULL(`price`, 0) ELSE 0 END) AS price2016,
    SUM(CASE WHEN `year` = 2015 THEN IFNULL(`price`, 0) ELSE 0 END) AS price2015
FROM `journals`
GROUP BY `titleControl`;

DROP TABLE `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

CREATE TABLE IF NOT EXISTS `journalsTemp`(KEY `titleControlIndx` (`titleControl`), KEY `sfxIssnIndx` (`sfxIssn`), KEY `sfxEIssn` (`sfxEIssn`))
SELECT
    `journals`.*,
    GROUP_CONCAT(`rawSfx`.`targetPublicName`, ': ', `rawSfx`.`threshold` ORDER BY `rawSfx`.`targetPublicName` SEPARATOR '|') AS `platforms`
FROM `journals`
LEFT JOIN `rawSfx`
ON `journals`.`objectId` = `rawSfx`.`objectId`
GROUP BY `journals`.`titleControl`;

DROP TABLE `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

CREATE TABLE `usageTemp` (KEY `titleControlIndx` (`titleControl`))
SELECT DISTINCT
    `journals`.`titleControl`,
    SUM(CASE WHEN `usage`.`year` = 2012 THEN IFNULL(`usage`.`total`, 0) ELSE 0 END) AS usage2012,
    SUM(CASE WHEN `usage`.`year` = 2013 THEN IFNULL(`usage`.`total`, 0) ELSE 0 END) AS usage2013,
    SUM(CASE WHEN `usage`.`year` = 2014 THEN IFNULL(`usage`.`total`, 0) ELSE 0 END) AS usage2014,
    SUM(CASE WHEN `usage`.`year` = 2015 THEN IFNULL(`usage`.`total`, 0) ELSE 0 END) AS usage2015,
    SUM(CASE WHEN `usage`.`year` = 2016 THEN IFNULL(`usage`.`total`, 0) ELSE 0 END) AS usage2016
FROM `journals`
JOIN `usage`
ON (`journals`.`sfxIssn` = `usage`.`issn` OR `journals`.`sfxIssn` = `usage`.`eIssn` OR `journals`.`sfxEIssn` = `usage`.`issn` OR `journals`.`sfxEIssn` = `usage`.`eIssn`)
GROUP BY `journals`.`titleControl`;

CREATE TABLE `journalsTemp` (KEY `sfxIssnIndx` (`sfxIssn`), KEY `sfxEIssnIndx` (`sfxEIssn`))
SELECT
	`journals`.*,
	`usageTemp`.usage2012,
	`usageTemp`.usage2013,
	`usageTemp`.usage2014,
	`usageTemp`.usage2015,
	`usageTemp`.usage2016
FROM `journals`
LEFT JOIN `usageTemp`
ON `journals`.`titleControl` = `usageTemp`.`titleControl`;

DROP TABLE `usageTemp`;

DROP TABLE `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

CREATE TABLE `journalsScimago2`(KEY `firstIssnIndx` (`firstIssn`), KEY `secondIssnIndx` (`secondIssn`), KEY `thirdIssnIndx` (`thirdIssn`))
SELECT
    *,
    SUBSTRING_INDEX(SUBSTRING_INDEX(`rawScimago`.`issn`, '|', 1), '|', -1) AS firstIssn,
    SUBSTRING_INDEX(SUBSTRING_INDEX(`rawScimago`.`issn`, '|', 2), '|', -1) AS secondIssn,
    SUBSTRING_INDEX(SUBSTRING_INDEX(`rawScimago`.`issn`, '|', 3), '|', -1) AS thirdIssn
FROM `rawScimago`;

UPDATE `journalsScimago2` SET `firstIssn` = NULLIF(TRIM(`firstIssn`), '');
UPDATE `journalsScimago2` SET `secondIssn` = NULLIF(TRIM(`secondIssn`), '');
UPDATE `journalsScimago2` SET `thirdIssn` = NULLIF(TRIM(`thirdIssn`), '');
UPDATE `journalsScimago2` SET `firstIssn` = (REPLACE(`firstIssn`, '-', ''));
UPDATE `journalsScimago2` SET `firstIssn` = UPPER(`firstIssn`);
UPDATE `journalsScimago2` SET `firstIssn` = LPAD(`firstIssn`, 8, '0');
UPDATE `journalsScimago2` SET `secondIssn` = (REPLACE(`secondIssn`, '-', ''));
UPDATE `journalsScimago2` SET `secondIssn` = UPPER(`secondIssn`);
UPDATE `journalsScimago2` SET `secondIssn` = LPAD(`secondIssn`, 8, '0');
UPDATE `journalsScimago2` SET `thirdIssn` = (REPLACE(`thirdIssn`, '-', ''));
UPDATE `journalsScimago2` SET `thirdIssn` = UPPER(`thirdIssn`);
UPDATE `journalsScimago2` SET `thirdIssn` = LPAD(`thirdIssn`, 8, '0');
UPDATE `journalsScimago2` SET `firstIssn` = NULLIF(TRIM(`firstIssn`), '');
UPDATE `journalsScimago2` SET `secondIssn` = NULLIF(TRIM(`secondIssn`), `firstIssn`);
UPDATE `journalsScimago2` SET `thirdIssn` = NULL WHERE (`thirdIssn` = `secondIssn` OR `secondIssn` IS NULL);

ALTER TABLE `journalsScimago2` CHANGE `firstIssn` `firstIssn` VARCHAR(8) NULL DEFAULT NULL;
ALTER TABLE `journalsScimago2` CHANGE `secondIssn` `secondIssn` VARCHAR(8) NULL DEFAULT NULL;
ALTER TABLE `journalsScimago2` CHANGE `thirdIssn` `thirdIssn` VARCHAR(8) NULL DEFAULT NULL;

CREATE TABLE `journalsScimago` (KEY `titleControlIndx` (`titleControl`))
SELECT
    `journals`.`titleControl`,
    `journals`.`sfxIssn`,
    `journals`.`sfxEIssn`,
    `journalsScimago2`.*
FROM `journals`
LEFT JOIN `journalsScimago2`
ON `journals`.`sfxIssn` = `journalsScimago2`.`firstIssn`
WHERE `journalsScimago2`.`firstIssn` IS NOT NULL;

UPDATE `journalsScimago`
LEFT JOIN
	`journalsScimago2`
ON `journalsScimago`.`sfxEIssn` = `journalsScimago2`.`firstIssn`
SET
	`journalsScimago`.`rank` = `journalsScimago2`.`rank`,
	`journalsScimago`.`title` = `journalsScimago2`.`title`,
	`journalsScimago`.`type` = `journalsScimago2`.`type`,
	`journalsScimago`.`issn` = `journalsScimago2`.`issn`,
	`journalsScimago`.`sjr` = `journalsScimago2`.`sjr`,
	`journalsScimago`.`sjrBestQuartile` = `journalsScimago2`.`sjrBestQuartile`,
	`journalsScimago`.`hIndex` = `journalsScimago2`.`hIndex`,
	`journalsScimago`.`totalDocs2015` = `journalsScimago2`.`totalDocs2015`,
	`journalsScimago`.`totalDocs3Years` = `journalsScimago2`.`totalDocs3Years`,
	`journalsScimago`.`totalRefs` = `journalsScimago2`.`totalRefs`,
	`journalsScimago`.`totalCites3Years` = `journalsScimago2`.`totalCites3Years`,
	`journalsScimago`.`citableDocs3Years` = `journalsScimago2`.`citableDocs3Years`,
	`journalsScimago`.`citesPerDoc2Years` = `journalsScimago2`.`citesPerDoc2Years`,
	`journalsScimago`.`refsPerDoc` = `journalsScimago2`.`refsPerDoc`,
	`journalsScimago`.`country` = `journalsScimago2`.`country`,
	`journalsScimago`.`firstIssn` = `journalsScimago2`.`firstIssn`,
	`journalsScimago`.`secondIssn` = `journalsScimago2`.`secondIssn`,
	`journalsScimago`.`thirdIssn` = `journalsScimago2`.`thirdIssn`
WHERE `journalsScimago`.`sjr` IS NULL AND `journalsScimago`.`firstIssn` IS NOT NULL AND `journalsScimago`.`sfxEIssn` IS NOT NULL;

UPDATE `journalsScimago`
LEFT JOIN
	`journalsScimago2`
ON `journalsScimago`.`sfxIssn` = `journalsScimago2`.`secondIssn`
SET
	`journalsScimago`.`rank` = `journalsScimago2`.`rank`,
	`journalsScimago`.`title` = `journalsScimago2`.`title`,
	`journalsScimago`.`type` = `journalsScimago2`.`type`,
	`journalsScimago`.`issn` = `journalsScimago2`.`issn`,
	`journalsScimago`.`sjr` = `journalsScimago2`.`sjr`,
	`journalsScimago`.`sjrBestQuartile` = `journalsScimago2`.`sjrBestQuartile`,
	`journalsScimago`.`hIndex` = `journalsScimago2`.`hIndex`,
	`journalsScimago`.`totalDocs2015` = `journalsScimago2`.`totalDocs2015`,
	`journalsScimago`.`totalDocs3Years` = `journalsScimago2`.`totalDocs3Years`,
	`journalsScimago`.`totalRefs` = `journalsScimago2`.`totalRefs`,
	`journalsScimago`.`totalCites3Years` = `journalsScimago2`.`totalCites3Years`,
	`journalsScimago`.`citableDocs3Years` = `journalsScimago2`.`citableDocs3Years`,
	`journalsScimago`.`citesPerDoc2Years` = `journalsScimago2`.`citesPerDoc2Years`,
	`journalsScimago`.`refsPerDoc` = `journalsScimago2`.`refsPerDoc`,
	`journalsScimago`.`country` = `journalsScimago2`.`country`,
	`journalsScimago`.`firstIssn` = `journalsScimago2`.`firstIssn`,
	`journalsScimago`.`secondIssn` = `journalsScimago2`.`secondIssn`,
	`journalsScimago`.`thirdIssn` = `journalsScimago2`.`thirdIssn`
WHERE `journalsScimago`.`sjr` IS NULL AND `journalsScimago`.`secondIssn` IS NOT NULL AND `journalsScimago`.`sfxIssn` IS NOT NULL;

UPDATE `journalsScimago`
LEFT JOIN
	`journalsScimago2`
ON `journalsScimago`.`sfxEIssn` = `journalsScimago2`.`secondIssn`
SET
	`journalsScimago`.`rank` = `journalsScimago2`.`rank`,
	`journalsScimago`.`title` = `journalsScimago2`.`title`,
	`journalsScimago`.`type` = `journalsScimago2`.`type`,
	`journalsScimago`.`issn` = `journalsScimago2`.`issn`,
	`journalsScimago`.`sjr` = `journalsScimago2`.`sjr`,
	`journalsScimago`.`sjrBestQuartile` = `journalsScimago2`.`sjrBestQuartile`,
	`journalsScimago`.`hIndex` = `journalsScimago2`.`hIndex`,
	`journalsScimago`.`totalDocs2015` = `journalsScimago2`.`totalDocs2015`,
	`journalsScimago`.`totalDocs3Years` = `journalsScimago2`.`totalDocs3Years`,
	`journalsScimago`.`totalRefs` = `journalsScimago2`.`totalRefs`,
	`journalsScimago`.`totalCites3Years` = `journalsScimago2`.`totalCites3Years`,
	`journalsScimago`.`citableDocs3Years` = `journalsScimago2`.`citableDocs3Years`,
	`journalsScimago`.`citesPerDoc2Years` = `journalsScimago2`.`citesPerDoc2Years`,
	`journalsScimago`.`refsPerDoc` = `journalsScimago2`.`refsPerDoc`,
	`journalsScimago`.`country` = `journalsScimago2`.`country`,
	`journalsScimago`.`firstIssn` = `journalsScimago2`.`firstIssn`,
	`journalsScimago`.`secondIssn` = `journalsScimago2`.`secondIssn`,
	`journalsScimago`.`thirdIssn` = `journalsScimago2`.`thirdIssn`
WHERE `journalsScimago`.`sjr` IS NULL AND `journalsScimago`.`secondIssn` IS NOT NULL AND `journalsScimago`.`sfxEIssn` IS NOT NULL;

UPDATE `journalsScimago`
LEFT JOIN
	`journalsScimago2`
ON `journalsScimago`.`sfxIssn` = `journalsScimago2`.`thirdIssn`
SET
	`journalsScimago`.`rank` = `journalsScimago2`.`rank`,
	`journalsScimago`.`title` = `journalsScimago2`.`title`,
	`journalsScimago`.`type` = `journalsScimago2`.`type`,
	`journalsScimago`.`issn` = `journalsScimago2`.`issn`,
	`journalsScimago`.`sjr` = `journalsScimago2`.`sjr`,
	`journalsScimago`.`sjrBestQuartile` = `journalsScimago2`.`sjrBestQuartile`,
	`journalsScimago`.`hIndex` = `journalsScimago2`.`hIndex`,
	`journalsScimago`.`totalDocs2015` = `journalsScimago2`.`totalDocs2015`,
	`journalsScimago`.`totalDocs3Years` = `journalsScimago2`.`totalDocs3Years`,
	`journalsScimago`.`totalRefs` = `journalsScimago2`.`totalRefs`,
	`journalsScimago`.`totalCites3Years` = `journalsScimago2`.`totalCites3Years`,
	`journalsScimago`.`citableDocs3Years` = `journalsScimago2`.`citableDocs3Years`,
	`journalsScimago`.`citesPerDoc2Years` = `journalsScimago2`.`citesPerDoc2Years`,
	`journalsScimago`.`refsPerDoc` = `journalsScimago2`.`refsPerDoc`,
	`journalsScimago`.`country` = `journalsScimago2`.`country`,
	`journalsScimago`.`firstIssn` = `journalsScimago2`.`firstIssn`,
	`journalsScimago`.`secondIssn` = `journalsScimago2`.`secondIssn`,
	`journalsScimago`.`thirdIssn` = `journalsScimago2`.`thirdIssn`
WHERE `journalsScimago`.`sjr` IS NULL AND `journalsScimago`.`thirdIssn` IS NOT NULL AND `journalsScimago`.`sfxIssn` IS NOT NULL;

UPDATE `journalsScimago`
LEFT JOIN
	`journalsScimago2`
ON `journalsScimago`.`sfxEIssn` = `journalsScimago2`.`thirdIssn`
SET
	`journalsScimago`.`rank` = `journalsScimago2`.`rank`,
	`journalsScimago`.`title` = `journalsScimago2`.`title`,
	`journalsScimago`.`type` = `journalsScimago2`.`type`,
	`journalsScimago`.`issn` = `journalsScimago2`.`issn`,
	`journalsScimago`.`sjr` = `journalsScimago2`.`sjr`,
	`journalsScimago`.`sjrBestQuartile` = `journalsScimago2`.`sjrBestQuartile`,
	`journalsScimago`.`hIndex` = `journalsScimago2`.`hIndex`,
	`journalsScimago`.`totalDocs2015` = `journalsScimago2`.`totalDocs2015`,
	`journalsScimago`.`totalDocs3Years` = `journalsScimago2`.`totalDocs3Years`,
	`journalsScimago`.`totalRefs` = `journalsScimago2`.`totalRefs`,
	`journalsScimago`.`totalCites3Years` = `journalsScimago2`.`totalCites3Years`,
	`journalsScimago`.`citableDocs3Years` = `journalsScimago2`.`citableDocs3Years`,
	`journalsScimago`.`citesPerDoc2Years` = `journalsScimago2`.`citesPerDoc2Years`,
	`journalsScimago`.`refsPerDoc` = `journalsScimago2`.`refsPerDoc`,
	`journalsScimago`.`country` = `journalsScimago2`.`country`,
	`journalsScimago`.`firstIssn` = `journalsScimago2`.`firstIssn`,
	`journalsScimago`.`secondIssn` = `journalsScimago2`.`secondIssn`,
	`journalsScimago`.`thirdIssn` = `journalsScimago2`.`thirdIssn`
WHERE `journalsScimago`.`sjr` IS NULL AND `journalsScimago`.`thirdIssn` IS NOT NULL AND `journalsScimago`.`sfxEIssn` IS NOT NULL;

ALTER TABLE `journalsScimago` DROP `sfxIssn`;
ALTER TABLE `journalsScimago` DROP `sfxEIssn`;

DROP TABLE `journalsScimago2`;

CREATE TABLE `journalsTemp` (KEY `sfxIssnIndx` (`sfxIssn`), KEY `sfxEIssnIndx` (`sfxEIssn`))
SELECT
    `journals`.*,
    `journalsScimago`.`rank`,
    `journalsScimago`.`type`,
    `journalsScimago`.`sjrBestQuartile`,
    `journalsScimago`.`hIndex`,
    `journalsScimago`.`totalDocs2015`,
    `journalsScimago`.`totalDocs3Years`,
    `journalsScimago`.`totalRefs`,
    `journalsScimago`.`totalCites3Years`,
    `journalsScimago`.`citableDocs3Years`,
    `journalsScimago`.`citesPerDoc2Years`,
    `journalsScimago`.`refsPerDoc`,
    `journalsScimago`.`country`
FROM `journals`
LEFT JOIN `journalsScimago`
ON `journals`.`titleControl` = `journalsScimago`.`titleControl`;

DROP TABLE `journalsScimago`;
DROP TABLE `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

CREATE TABLE `journalsTemp` (KEY `titleControlIndx` (`titleControl`))
SELECT
    `journals`.`titleControl`,
    `rawSnip`.*
FROM `journals`
JOIN `rawSnip`
ON (`journals`.`sfxIssn` = `rawSnip`.`issn` OR `journals`.`sfxIssn` = `rawSnip`.`eIssn` OR `journals`.`sfxEIssn` = `rawSnip`.`issn` OR `journals`.`sfxEIssn` = `rawSnip`.`eIssn`);

CREATE TABLE `journalsFinal` (KEY `subAccountIndx` (`subAccount`), KEY `issnIndx` (`issn`), KEY `sfxIssnIndx` (`sfxIssn`), KEY `sfxEIssnIndx` (`sfxEIssn`))
SELECT
    `journals`.*,
    `journalsTemp`.`snip1999`,
    `journalsTemp`.`ipp1999`,
    `journalsTemp`.`sjr1999`,
    `journalsTemp`.`snip2000`,
    `journalsTemp`.`ipp2000`,
    `journalsTemp`.`sjr2000`,
    `journalsTemp`.`snip2001`,
    `journalsTemp`.`ipp2001`,
    `journalsTemp`.`sjr2001`,
    `journalsTemp`.`snip2002`,
    `journalsTemp`.`ipp2002`,
    `journalsTemp`.`sjr2002`,
    `journalsTemp`.`snip2003`,
    `journalsTemp`.`ipp2003`,
    `journalsTemp`.`sjr2003`,
    `journalsTemp`.`snip2004`,
    `journalsTemp`.`ipp2004`,
    `journalsTemp`.`sjr2004`,
    `journalsTemp`.`snip2005`,
    `journalsTemp`.`ipp2005`,
    `journalsTemp`.`sjr2005`,
    `journalsTemp`.`snip2006`,
    `journalsTemp`.`ipp2006`,
    `journalsTemp`.`sjr2006`,
    `journalsTemp`.`snip2007`,
    `journalsTemp`.`ipp2007`,
    `journalsTemp`.`sjr2007`,
    `journalsTemp`.`snip2008`,
    `journalsTemp`.`ipp2008`,
    `journalsTemp`.`sjr2008`,
    `journalsTemp`.`snip2009`,
    `journalsTemp`.`ipp2009`,
    `journalsTemp`.`sjr2009`,
    `journalsTemp`.`snip2010`,
    `journalsTemp`.`ipp2010`,
    `journalsTemp`.`sjr2010`,
    `journalsTemp`.`snip2011`,
    `journalsTemp`.`ipp2011`,
    `journalsTemp`.`sjr2011`,
    `journalsTemp`.`snip2012`,
    `journalsTemp`.`ipp2012`,
    `journalsTemp`.`sjr2012`,
    `journalsTemp`.`snip2013`,
    `journalsTemp`.`ipp2013`,
    `journalsTemp`.`sjr2013`,
    `journalsTemp`.`snip2014`,
    `journalsTemp`.`ipp2014`,
    `journalsTemp`.`sjr2014`,
    `journalsTemp`.`snip2015`,
    `journalsTemp`.`ipp2015`,
    `journalsTemp`.`sjr2015`,
    `journalsTemp`.`asjc`
FROM `journals`
LEFT JOIN `journalsTemp`
ON `journals`.`titleControl` = `journalsTemp`.`titleControl`;

DROP TABLE IF EXISTS `journals`;
DROP TABLE IF EXISTS `journalsTemp`;

RENAME TABLE `journalsFinal` TO `journals`;

UPDATE `journals`
SET `sfxSortableTitle` = UPPER(REPLACE(`title`, 'The ', ''))
WHERE `sfxSortableTitle` IS NULL;

UPDATE `journals`
SET `sfxTitle` = `title`
WHERE `sfxTitle` IS NULL;
