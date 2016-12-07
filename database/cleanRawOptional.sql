-- About 1–2 minutes to run

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
ALTER TABLE `rawConferenceProceedings` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;

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
ALTER TABLE `rawConferenceProceedingsBackfiles` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;

--
-- ****** `rawScopusSources` ******
--

-- Trim white space from cells in `rawScopusSources`
UPDATE `rawScopusSources` SET `sourceRecordId` = NULLIF(TRIM(`sourceRecordId`), '');
UPDATE `rawScopusSources` SET `sourceTitle` = NULLIF(TRIM(`sourceTitle`), '');
UPDATE `rawScopusSources` SET `issn` = NULLIF(TRIM(`issn`), '');
UPDATE `rawScopusSources` SET `eIssn` = NULLIF(TRIM(`eIssn`), '');
UPDATE `rawScopusSources` SET `coverage` = NULLIF(TRIM(`coverage`), '');
UPDATE `rawScopusSources` SET `status` = NULLIF(TRIM(`status`), '');
UPDATE `rawScopusSources` SET `snip2013` = NULLIF(TRIM(`snip2013`), '');
UPDATE `rawScopusSources` SET `ipp2013` = NULLIF(TRIM(`ipp2013`), '');
UPDATE `rawScopusSources` SET `sjr2013` = NULLIF(TRIM(`sjr2013`), '');
UPDATE `rawScopusSources` SET `snip2014` = NULLIF(TRIM(`snip2014`), '');
UPDATE `rawScopusSources` SET `ipp2014` = NULLIF(TRIM(`ipp2014`), '');
UPDATE `rawScopusSources` SET `sjr2014` = NULLIF(TRIM(`sjr2014`), '');
UPDATE `rawScopusSources` SET `snip2015` = NULLIF(TRIM(`snip2015`), '');
UPDATE `rawScopusSources` SET `ipp2015` = NULLIF(TRIM(`ipp2015`), '');
UPDATE `rawScopusSources` SET `sjr2015` = NULLIF(TRIM(`sjr2015`), '');
UPDATE `rawScopusSources` SET `medlineSourced` = NULLIF(TRIM(`medlineSourced`), '');
UPDATE `rawScopusSources` SET `openAccess` = NULLIF(TRIM(`openAccess`), '');
UPDATE `rawScopusSources` SET `articlesInPress` = NULLIF(TRIM(`articlesInPress`), '');
UPDATE `rawScopusSources` SET `addedMay2016` = NULLIF(TRIM(`addedMay2016`), '');
UPDATE `rawScopusSources` SET `sourceType` = NULLIF(TRIM(`sourceType`), '');
UPDATE `rawScopusSources` SET `titleHistoryIndication` = NULLIF(TRIM(`titleHistoryIndication`), '');
UPDATE `rawScopusSources` SET `relatedTitle1` = NULLIF(TRIM(`relatedTitle1`), '');
UPDATE `rawScopusSources` SET `relatedTitle2` = NULLIF(TRIM(`relatedTitle2`), '');
UPDATE `rawScopusSources` SET `relatedTitle3` = NULLIF(TRIM(`relatedTitle3`), '');
UPDATE `rawScopusSources` SET `relatedTitle4` = NULLIF(TRIM(`relatedTitle4`), '');
UPDATE `rawScopusSources` SET `publisher` = NULLIF(TRIM(`publisher`), '');
UPDATE `rawScopusSources` SET `publisherImprints` = NULLIF(TRIM(`publisherImprints`), '');
UPDATE `rawScopusSources` SET `publicationLocation` = NULLIF(TRIM(`publicationLocation`), '');
UPDATE `rawScopusSources` SET `asjc` = NULLIF(TRIM(`asjc`), '');
UPDATE `rawScopusSources` SET `topLevelLifeSciences` = NULLIF(TRIM(`topLevelLifeSciences`), '');
UPDATE `rawScopusSources` SET `topLevelSocialSciences` = NULLIF(TRIM(`topLevelSocialSciences`), '');
UPDATE `rawScopusSources` SET `topLevelPhysicalSciences` = NULLIF(TRIM(`topLevelPhysicalSciences`), '');
UPDATE `rawScopusSources` SET `topLevelHealthSciences` = NULLIF(TRIM(`topLevelHealthSciences`), '');
UPDATE `rawScopusSources` SET `general` = NULLIF(TRIM(`general`), '');
UPDATE `rawScopusSources` SET `agriculturalBiologicalSciences` = NULLIF(TRIM(`agriculturalBiologicalSciences`), '');
UPDATE `rawScopusSources` SET `artsHumanities` = NULLIF(TRIM(`artsHumanities`), '');
UPDATE `rawScopusSources` SET `biochemistryGeneticsMolecularBiology` = NULLIF(TRIM(`biochemistryGeneticsMolecularBiology`), '');
UPDATE `rawScopusSources` SET `businessManagementAccounting` = NULLIF(TRIM(`businessManagementAccounting`), '');
UPDATE `rawScopusSources` SET `chemicalEngineering` = NULLIF(TRIM(`chemicalEngineering`), '');
UPDATE `rawScopusSources` SET `chemistry` = NULLIF(TRIM(`chemistry`), '');
UPDATE `rawScopusSources` SET `computerScience` = NULLIF(TRIM(`computerScience`), '');
UPDATE `rawScopusSources` SET `decisionSciences` = NULLIF(TRIM(`decisionSciences`), '');
UPDATE `rawScopusSources` SET `earthPlanetarySciences` = NULLIF(TRIM(`earthPlanetarySciences`), '');
UPDATE `rawScopusSources` SET `economicsEconometricsFinance` = NULLIF(TRIM(`economicsEconometricsFinance`), '');
UPDATE `rawScopusSources` SET `energy` = NULLIF(TRIM(`energy`), '');
UPDATE `rawScopusSources` SET `engineering` = NULLIF(TRIM(`engineering`), '');
UPDATE `rawScopusSources` SET `environmentalScience` = NULLIF(TRIM(`environmentalScience`), '');
UPDATE `rawScopusSources` SET `immunologyMicrobiology` = NULLIF(TRIM(`immunologyMicrobiology`), '');
UPDATE `rawScopusSources` SET `materialsScience` = NULLIF(TRIM(`materialsScience`), '');
UPDATE `rawScopusSources` SET `mathematics` = NULLIF(TRIM(`mathematics`), '');
UPDATE `rawScopusSources` SET `medicine` = NULLIF(TRIM(`medicine`), '');
UPDATE `rawScopusSources` SET `neuroscience` = NULLIF(TRIM(`neuroscience`), '');
UPDATE `rawScopusSources` SET `nursing` = NULLIF(TRIM(`nursing`), '');
UPDATE `rawScopusSources` SET `pharmacologyToxicologyPharmaceutics` = NULLIF(TRIM(`pharmacologyToxicologyPharmaceutics`), '');
UPDATE `rawScopusSources` SET `physicsAstronomy` = NULLIF(TRIM(`physicsAstronomy`), '');
UPDATE `rawScopusSources` SET `psychology` = NULLIF(TRIM(`psychology`), '');
UPDATE `rawScopusSources` SET `socialSciences` = NULLIF(TRIM(`socialSciences`), '');
UPDATE `rawScopusSources` SET `veterinary` = NULLIF(TRIM(`veterinary`), '');
UPDATE `rawScopusSources` SET `dentistry` = NULLIF(TRIM(`dentistry`), '');
UPDATE `rawScopusSources` SET `healthProfessions` = NULLIF(TRIM(`healthProfessions`), '');
-- Clean up ASJC codes in `rawScopusSources`
UPDATE `rawScopusSources` SET `asjc` = (REPLACE(`asjc`, ' ', ''));
UPDATE `rawScopusSources` SET `asjc` = (REPLACE(`asjc`, ';', '|'));
-- Clean up ISSNs in `rawScopusSources`
UPDATE `rawScopusSources` SET `issn` = (REPLACE(`issn`, '-', ''));
UPDATE `rawScopusSources` SET `issn` = UPPER(`issn`);
UPDATE `rawScopusSources` SET `issn` = LPAD(`issn`, 8, '0');
UPDATE `rawScopusSources` SET `eIssn` = (REPLACE(`eIssn`, '-', ''));
UPDATE `rawScopusSources` SET `eIssn` = UPPER(`eIssn`);
UPDATE `rawScopusSources` SET `eIssn` = LPAD(`eIssn`, 8, '0');
ALTER TABLE `rawScopusSources` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `eIssn` `eIssn` VARCHAR(8) NULL DEFAULT NULL;
