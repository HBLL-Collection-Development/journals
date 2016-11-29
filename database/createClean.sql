DROP TABLE IF EXISTS `usage`;

CREATE TABLE IF NOT EXISTS `usage`
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

ALTER TABLE `usage` ADD INDEX `issnIndx` (`issn`);

ALTER TABLE `usage` ADD INDEX `eIssnIndx` (`eIssn`);

ALTER TABLE `usage` ADD INDEX `yearIndx` (`year`);

DROP TABLE IF EXISTS `sfxJournals`;

CREATE TABLE IF NOT EXISTS `sfxJournals`
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

ALTER TABLE `sfxJournals` ADD INDEX `titleControlIndx` (`titleControl`);

DROP TABLE IF EXISTS `journals`;

CREATE TABLE IF NOT EXISTS `journals`
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

ALTER TABLE `journals` ADD INDEX `titleControlIndx` (`titleControl`);

ALTER TABLE `journals` ADD INDEX `yearIndx` (`year`);

DROP TABLE IF EXISTS `sfxJournals`;

CREATE TABLE IF NOT EXISTS `journalsTemp`
SELECT
    *,
    COUNT(`titleControl`) AS `copies`
FROM `journals`
GROUP BY `titleControl`, `year`;

DROP TABLE IF EXISTS `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

DROP TABLE IF EXISTS `journalsTemp`;

CREATE TABLE IF NOT EXISTS `journalsTemp`
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

DROP TABLE IF EXISTS `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

ALTER TABLE `journals` ADD INDEX `objectIdIndx` (`objectId`);

DROP TABLE IF EXISTS `journalsTemp`;

CREATE TABLE IF NOT EXISTS `journalsTemp`
SELECT
    `journals`.*,
    GROUP_CONCAT(`rawSfx`.`targetPublicName`, ': ', `rawSfx`.`threshold` ORDER BY `rawSfx`.`targetPublicName` SEPARATOR '|') AS `platforms`
FROM `journals`
LEFT JOIN `rawSfx`
ON `journals`.`objectId` = `rawSfx`.`objectId`
GROUP BY `journals`.`titleControl`;

DROP TABLE IF EXISTS `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

ALTER TABLE `journals` ADD INDEX `sfxIssnIndx` (`sfxIssn`);

ALTER TABLE `journals` ADD INDEX `sfxEIssnIndx` (`sfxEIssn`);

DROP TABLE IF EXISTS `usageTemp`;

CREATE TABLE IF NOT EXISTS `usageTemp`
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

ALTER TABLE `usageTemp` ADD INDEX `titleControlIndx` (`titleControl`);

DROP TABLE IF EXISTS `journalsTemp`;

CREATE TABLE IF NOT EXISTS `journalsTemp`
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

DROP TABLE IF EXISTS `usageTemp`;

DROP TABLE IF EXISTS `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

ALTER TABLE `journals` ADD INDEX `sfxIssnIndx` (`sfxIssn`);

ALTER TABLE `journals` ADD INDEX `sfxEIssnIndx` (`sfxEIssn`);

DROP TABLE IF EXISTS `journalsScimago`;

CREATE TABLE IF NOT EXISTS `journalsScimago`
SELECT
	`journals`.`titleControl`,
	`rawScimago`.*
FROM `journals`
JOIN `rawScimago`
ON (`journals`.`sfxIssn` REGEXP `rawScimago`.`issn` OR `journals`.`sfxEIssn` REGEXP `rawScimago`.`issn`);

ALTER TABLE `journalsScimago` ADD INDEX `titleControlIndx` (`titleControl`);

DROP TABLE IF EXISTS `journalsTemp`;

CREATE TABLE IF NOT EXISTS `journalsTemp`
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

DROP TABLE IF EXISTS `journalsScimago`;

DROP TABLE IF EXISTS `journals`;

RENAME TABLE `journalsTemp` TO `journals`;

ALTER TABLE `journals` ADD INDEX `sfxIssnIndx` (`sfxIssn`);

ALTER TABLE `journals` ADD INDEX `sfxEIssnIndx` (`sfxEIssn`);

DROP TABLE IF EXISTS `journalsTemp`;

CREATE TABLE IF NOT EXISTS `journalsTemp`
SELECT
    `journals`.`titleControl`,
    `rawSnip`.*
FROM `journals`
JOIN `rawSnip`
ON (`journals`.`sfxIssn` = `rawSnip`.`issn` OR `journals`.`sfxIssn` = `rawSnip`.`eIssn` OR `journals`.`sfxEIssn` = `rawSnip`.`issn` OR `journals`.`sfxEIssn` = `rawSnip`.`eIssn`);

ALTER TABLE `journalsTemp` ADD INDEX `titleControlIndx` (`titleControl`);

DROP TABLE IF EXISTS `journalsFinal`;

CREATE TABLE IF NOT EXISTS `journalsFinal`
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

ALTER TABLE `journals` ADD INDEX `subAccountIndx` (`subAccount`);

ALTER TABLE `journals` ADD INDEX `issnIndx` (`issn`);

ALTER TABLE `journals` ADD INDEX `sfxIssnIndx` (`sfxIssn`);

ALTER TABLE `journals` ADD INDEX `sfxEIssnIndx` (`sfxEIssn`);

UPDATE `journals` SET `sfxSortableTitle` = UPPER(REPLACE(`title`, 'The ', '')) WHERE `sfxSortableTitle` IS NULL;

UPDATE `journals` SET `sfxTitle` = `title` WHERE `sfxTitle` IS NULL;
