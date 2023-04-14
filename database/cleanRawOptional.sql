-- About 3–5 minutes to run

--
-- ****** `rawAsjc` ******
--

-- Trim white space from cells in `rawAsjc`
UPDATE `rawAsjc` SET `description` = NULLIF(TRIM(`description`), '');
UPDATE `rawAsjc` SET `code` = NULLIF(TRIM(`code`), '');
-- Clean up empty values in `rawAsjc`
UPDATE `rawAsjc` SET `description` = NULL WHERE `description` LIKE '';
UPDATE `rawAsjc` SET `code` = NULL WHERE `code` LIKE '';

--
-- ****** `rawCwts` ******
--

-- Trim white space from cells in `rawCwts`
UPDATE `rawCwts` SET `title` = (CASE WHEN (`title` = '' OR `title` = '-') THEN NULL ELSE `title` END);
UPDATE `rawCwts` SET `type` = (CASE WHEN (`type` = '' OR `type` = '-') THEN NULL ELSE `type` END);
UPDATE `rawCwts` SET `issn` = (CASE WHEN (`issn` = '' OR `issn` = '-') THEN NULL ELSE `issn` END);
UPDATE `rawCwts` SET `eIssn` = (CASE WHEN (`eIssn` = '' OR `eIssn` = '-') THEN NULL ELSE `eIssn` END);
UPDATE `rawCwts` SET `asjc` = (CASE WHEN (`asjc` = '' OR `asjc` = '-') THEN NULL ELSE `asjc` END);
UPDATE `rawCwts` SET `year` = (CASE WHEN (`year` = '' OR `year` = '-') THEN NULL ELSE `year` END);
UPDATE `rawCwts` SET `citingSource` = (CASE WHEN (`citingSource` = '' OR `citingSource` = '-') THEN NULL ELSE `citingSource` END);
UPDATE `rawCwts` SET `pValue` = (CASE WHEN (`pValue` = '' OR `pValue` = '-') THEN NULL ELSE `pValue` END);
UPDATE `rawCwts` SET `ipp` = (CASE WHEN (`ipp` = '' OR `ipp` = '-') THEN NULL ELSE `ipp` END);
UPDATE `rawCwts` SET `ippLowerBound` = (CASE WHEN (`ippLowerBound` = '' OR `ippLowerBound` = '-') THEN NULL ELSE `ippLowerBound` END);
UPDATE `rawCwts` SET `ippUpperBound` = (CASE WHEN (`ippUpperBound` = '' OR `ippUpperBound` = '-') THEN NULL ELSE `ippUpperBound` END);
UPDATE `rawCwts` SET `snip` = (CASE WHEN (`snip` = '' OR `snip` = '-') THEN NULL ELSE `snip` END);
UPDATE `rawCwts` SET `snipLowerBound` = (CASE WHEN (`snipLowerBound` = '' OR `snipLowerBound` = '-') THEN NULL ELSE `snipLowerBound` END);
UPDATE `rawCwts` SET `snipUpperBound` = (CASE WHEN (`snipUpperBound` = '' OR `snipUpperBound` = '-') THEN NULL ELSE `snipUpperBound` END);
UPDATE `rawCwts` SET `percentSelfCite` = (CASE WHEN (`percentSelfCite` = '' OR `percentSelfCite` = '-') THEN NULL ELSE `percentSelfCite` END);
-- Clean up ASJC codes in `rawCwts`
UPDATE `rawCwts` SET `asjc` = (REPLACE(`asjc`, ' ', ''));
UPDATE `rawCwts` SET `asjc` = (REPLACE(`asjc`, ';', '|'));
-- Clean up ISSNs in `rawCwts`
UPDATE `rawCwts` SET `issn` = (REPLACE(`issn`, '-', ''));
UPDATE `rawCwts` SET `issn` = UPPER(`issn`);
UPDATE `rawCwts` SET `issn` = LPAD(`issn`, 8, '0');
UPDATE `rawCwts` SET `eIssn` = (REPLACE(`eIssn`, '-', ''));
UPDATE `rawCwts` SET `eIssn` = UPPER(`eIssn`);
UPDATE `rawCwts` SET `eIssn` = LPAD(`eIssn`, 8, '0');
-- Remove percent from `rawCwts`
UPDATE `rawCwts` SET `percentSelfCite` = (REPLACE(`percentSelfCite`, '%', ''));

--
-- ****** `rawConferenceProceedings` ******
--

-- Trim white space from cells in `rawConferenceProceedings`
UPDATE `rawConferenceProceedings` SET `sourceRecordId` = NULLIF(TRIM(`sourceRecordId`), '');
UPDATE `rawConferenceProceedings` SET `sourceTitle` = NULLIF(TRIM(`sourceTitle`), '');
UPDATE `rawConferenceProceedings` SET `coverage` = NULLIF(TRIM(`coverage`), '');
UPDATE `rawConferenceProceedings` SET `issn` = NULLIF(TRIM(`issn`), '');
UPDATE `rawConferenceProceedings` SET `addedNovember2015` = NULLIF(TRIM(`addedNovember2015`), '');
UPDATE `rawConferenceProceedings` SET `snip2013` = NULLIF(TRIM(`snip2013`), '');
UPDATE `rawConferenceProceedings` SET `ipp2013` = NULLIF(TRIM(`ipp2013`), '');
UPDATE `rawConferenceProceedings` SET `sjr2013` = NULLIF(TRIM(`sjr2013`), '');
UPDATE `rawConferenceProceedings` SET `snip2014` = NULLIF(TRIM(`snip2014`), '');
UPDATE `rawConferenceProceedings` SET `ipp2014` = NULLIF(TRIM(`ipp2014`), '');
UPDATE `rawConferenceProceedings` SET `sjr2014` = NULLIF(TRIM(`sjr2014`), '');
UPDATE `rawConferenceProceedings` SET `snip2015` = NULLIF(TRIM(`snip2015`), '');
UPDATE `rawConferenceProceedings` SET `ipp2015` = NULLIF(TRIM(`ipp2015`), '');
UPDATE `rawConferenceProceedings` SET `sjr2015` = NULLIF(TRIM(`sjr2015`), '');
UPDATE `rawConferenceProceedings` SET `asjc` = NULLIF(TRIM(`asjc`), '');
-- Clean up ASJC codes in `rawConferenceProceedings`
UPDATE `rawConferenceProceedings` SET `asjc` = (REPLACE(`asjc`, ' ', ''));
UPDATE `rawConferenceProceedings` SET `asjc` = (REPLACE(`asjc`, ';', '|'));
-- Clean up ISSNs in `rawConferenceProceedings`
UPDATE `rawConferenceProceedings` SET `issn` = (REPLACE(`issn`, '-', ''));
UPDATE `rawConferenceProceedings` SET `issn` = UPPER(`issn`);
UPDATE `rawConferenceProceedings` SET `issn` = LPAD(`issn`, 8, '0');

--
-- ****** `rawConferenceProceedingsBackfiles` ******
--

-- Trim white space from cells in `rawConferenceProceedingsBackfiles`
UPDATE `rawConferenceProceedingsBackfiles` SET `sourceRecordId` = NULLIF(TRIM(`sourceRecordId`), '');
UPDATE `rawConferenceProceedingsBackfiles` SET `sourceTitle` = NULLIF(TRIM(`sourceTitle`), '');
UPDATE `rawConferenceProceedingsBackfiles` SET `coverage` = NULLIF(TRIM(`coverage`), '');
UPDATE `rawConferenceProceedingsBackfiles` SET `issn` = NULLIF(TRIM(`issn`), '');
UPDATE `rawConferenceProceedingsBackfiles` SET `asjc` = NULLIF(TRIM(`asjc`), '');
-- Clean up ASJC codes in `rawConferenceProceedingsBackfiles`
UPDATE `rawConferenceProceedingsBackfiles` SET `asjc` = (REPLACE(`asjc`, ' ', ''));
UPDATE `rawConferenceProceedingsBackfiles` SET `asjc` = (REPLACE(`asjc`, ';', '|'));
-- Clean up ISSNs in `rawConferenceProceedingsBackfiles`
UPDATE `rawConferenceProceedingsBackfiles` SET `issn` = (REPLACE(`issn`, '-', ''));
UPDATE `rawConferenceProceedingsBackfiles` SET `issn` = UPPER(`issn`);
UPDATE `rawConferenceProceedingsBackfiles` SET `issn` = LPAD(`issn`, 8, '0');

ALTER TABLE `rawAsjc` CHANGE `code` `code` int(11) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `issn` `issn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `eIssn` `eIssn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `citingSource` `citingSource` tinyint(1) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `pValue` `pValue` INT(11) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `ipp` `ipp` decimal(10,2) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `ippLowerBound` `ippLowerBound` decimal(10,2) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `ippUpperBound` `ippUpperBound` decimal(10,2) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `snip` `snip` decimal(10,2) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `snipLowerBound` `snipLowerBound` decimal(10,2) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `snipUpperBound` `snipUpperBound` decimal(10,2) DEFAULT NULL;
ALTER TABLE `rawCwts` CHANGE `percentSelfCite` `percentSelfCite` decimal(10,1) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `sourceRecordId` `sourceRecordId` bigint(11) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `coverage` `coverage` int(11) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `issn` `issn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `snip2013` `snip2013` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `ipp2013` `ipp2013` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `sjr2013` `sjr2013` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `snip2014` `snip2014` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `ipp2014` `ipp2014` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `sjr2014` `sjr2014` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `snip2015` `snip2015` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `ipp2015` `ipp2015` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedings` CHANGE `sjr2015` `sjr2015` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedingsBackfiles` CHANGE `sourceRecordId` `sourceRecordId` bigint(11) DEFAULT NULL;
ALTER TABLE `rawConferenceProceedingsBackfiles` CHANGE `issn` `issn` varchar(8) DEFAULT NULL;
