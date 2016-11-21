-- Trim white space from cells in `rawAsjc`
UPDATE `rawAsjc` SET `description` = TRIM(`description`);

UPDATE `rawAsjc` SET `code` = TRIM(`code`);

-- Clean up empty values in `asjc`
UPDATE `rawAsjc` SET `description` = NULL WHERE `description` LIKE '';

UPDATE `rawAsjc` SET `code` = NULL WHERE `code` LIKE '';

-- Trim white space from cells in `rawConferenceProceedings`
UPDATE `rawConferenceProceedings` SET `sourceRecordId` = TRIM(`sourceRecordId`);

UPDATE `rawConferenceProceedings` SET `sourceTitle` = TRIM(`sourceTitle`);

UPDATE `rawConferenceProceedings` SET `coverage` = TRIM(`coverage`);

UPDATE `rawConferenceProceedings` SET `issn` = TRIM(`issn`);

UPDATE `rawConferenceProceedings` SET `addedNovember2015` = TRIM(`addedNovember2015`);

UPDATE `rawConferenceProceedings` SET `snip2013` = TRIM(`snip2013`);

UPDATE `rawConferenceProceedings` SET `ipp2013` = TRIM(`ipp2013`);

UPDATE `rawConferenceProceedings` SET `sjr2013` = TRIM(`sjr2013`);

UPDATE `rawConferenceProceedings` SET `snip2014` = TRIM(`snip2014`);

UPDATE `rawConferenceProceedings` SET `ipp2014` = TRIM(`ipp2014`);

UPDATE `rawConferenceProceedings` SET `sjr2014` = TRIM(`sjr2014`);

UPDATE `rawConferenceProceedings` SET `snip2015` = TRIM(`snip2015`);

UPDATE `rawConferenceProceedings` SET `ipp2015` = TRIM(`ipp2015`);

UPDATE `rawConferenceProceedings` SET `sjr2015` = TRIM(`sjr2015`);

UPDATE `rawConferenceProceedings` SET `asjc` = TRIM(`asjc`);

-- Clean up empty values in `rawConferenceProceedings`
UPDATE `rawConferenceProceedings` SET `sourceRecordId` = NULL WHERE `sourceRecordId` LIKE '';

UPDATE `rawConferenceProceedings` SET `sourceTitle` = NULL WHERE `sourceTitle` LIKE '';

UPDATE `rawConferenceProceedings` SET `coverage` = NULL WHERE `coverage` LIKE '';

UPDATE `rawConferenceProceedings` SET `issn` = NULL WHERE `issn` LIKE '';

UPDATE `rawConferenceProceedings` SET `addedNovember2015` = NULL WHERE `addedNovember2015` LIKE '';

UPDATE `rawConferenceProceedings` SET `snip2013` = NULL WHERE `snip2013` LIKE '';

UPDATE `rawConferenceProceedings` SET `ipp2013` = NULL WHERE `ipp2013` LIKE '';

UPDATE `rawConferenceProceedings` SET `sjr2013` = NULL WHERE `sjr2013` LIKE '';

UPDATE `rawConferenceProceedings` SET `snip2014` = NULL WHERE `snip2014` LIKE '';

UPDATE `rawConferenceProceedings` SET `ipp2014` = NULL WHERE `ipp2014` LIKE '';

UPDATE `rawConferenceProceedings` SET `sjr2014` = NULL WHERE `sjr2014` LIKE '';

UPDATE `rawConferenceProceedings` SET `snip2015` = NULL WHERE `snip2015` LIKE '';

UPDATE `rawConferenceProceedings` SET `ipp2015` = NULL WHERE `ipp2015` LIKE '';

UPDATE `rawConferenceProceedings` SET `sjr2015` = NULL WHERE `sjr2015` LIKE '';

UPDATE `rawConferenceProceedings` SET `asjc` = NULL WHERE `asjc` LIKE '';

-- Clean up ASJC codes
UPDATE `rawConferenceProceedings` SET `asjc` = (REPLACE(`asjc`, ' ', ''));

UPDATE `rawConferenceProceedings` SET `asjc` = (REPLACE(`asjc`, ';', '|'));

-- Clean up ISSNs
UPDATE `rawConferenceProceedings` SET `issn` = (REPLACE(`issn`, '-', ''));

UPDATE `rawConferenceProceedings` SET `issn` = UPPER(`issn`);

UPDATE `rawConferenceProceedings` SET `issn` = LPAD(`issn`, 8, '0');

ALTER TABLE `rawConferenceProceedings` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;

-- Trim white space from cells
UPDATE `rawConferenceProceedingsBackfiles` SET `sourceRecordId` = TRIM(`sourceRecordId`);

UPDATE `rawConferenceProceedingsBackfiles` SET `sourceTitle` = TRIM(`sourceTitle`);

UPDATE `rawConferenceProceedingsBackfiles` SET `coverage` = TRIM(`coverage`);

UPDATE `rawConferenceProceedingsBackfiles` SET `issn` = TRIM(`issn`);

UPDATE `rawConferenceProceedingsBackfiles` SET `asjc` = TRIM(`asjc`);

-- Clean up empty values in `rawConferenceProceedingsBackfiles`
UPDATE `rawConferenceProceedingsBackfiles` SET `sourceRecordId` = NULL WHERE `sourceRecordId` LIKE '';

UPDATE `rawConferenceProceedingsBackfiles` SET `sourceTitle` = NULL WHERE `sourceTitle` LIKE '';

UPDATE `rawConferenceProceedingsBackfiles` SET `coverage` = NULL WHERE `coverage` LIKE '';

UPDATE `rawConferenceProceedingsBackfiles` SET `issn` = NULL WHERE `issn` LIKE '';

UPDATE `rawConferenceProceedingsBackfiles` SET `asjc` = NULL WHERE `asjc` LIKE '';

-- Clean up ASJC codes
UPDATE `rawConferenceProceedingsBackfiles` SET `asjc` = (REPLACE(`asjc`, ' ', ''));

UPDATE `rawConferenceProceedingsBackfiles` SET `asjc` = (REPLACE(`asjc`, ';', '|'));

-- Clean up ISSNs
UPDATE `rawConferenceProceedingsBackfiles` SET `issn` = (REPLACE(`issn`, '-', ''));

UPDATE `rawConferenceProceedingsBackfiles` SET `issn` = UPPER(`issn`);

UPDATE `rawConferenceProceedingsBackfiles` SET `issn` = LPAD(`issn`, 8, '0');

ALTER TABLE `rawConferenceProceedingsBackfiles` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;

-- Trim white space from cells
UPDATE `rawScimago` SET `rank` = TRIM(`rank`);

UPDATE `rawScimago` SET `title` = TRIM(`title`);

UPDATE `rawScimago` SET `type` = TRIM(`type`);

UPDATE `rawScimago` SET `issn` = TRIM(`issn`);

UPDATE `rawScimago` SET `sjr` = TRIM(`sjr`);

UPDATE `rawScimago` SET `sjrBestQuartile` = TRIM(`sjrBestQuartile`);

UPDATE `rawScimago` SET `hIndex` = TRIM(`hIndex`);

UPDATE `rawScimago` SET `totalDocs2015` = TRIM(`totalDocs2015`);

UPDATE `rawScimago` SET `totalDocs3Years` = TRIM(`totalDocs3Years`);

UPDATE `rawScimago` SET `totalRefs` = TRIM(`totalRefs`);

UPDATE `rawScimago` SET `totalCites3Years` = TRIM(`totalCites3Years`);

UPDATE `rawScimago` SET `citableDocs3Years` = TRIM(`citableDocs3Years`);

UPDATE `rawScimago` SET `citesPerDoc2Years` = TRIM(`citesPerDoc2Years`);

UPDATE `rawScimago` SET `refsPerDoc` = TRIM(`refsPerDoc`);

UPDATE `rawScimago` SET `country` = TRIM(`country`);

-- Clean up empty values in `rawScimago`
UPDATE `rawScimago` SET `rank` = NULL WHERE `rank` LIKE '';

UPDATE `rawScimago` SET `title` = NULL WHERE `title` LIKE '';

UPDATE `rawScimago` SET `type` = NULL WHERE `type` LIKE '';

UPDATE `rawScimago` SET `issn` = NULL WHERE `issn` LIKE '';

UPDATE `rawScimago` SET `sjr` = NULL WHERE `sjr` LIKE '';

UPDATE `rawScimago` SET `sjrBestQuartile` = NULL WHERE `sjrBestQuartile` LIKE '';

UPDATE `rawScimago` SET `hIndex` = NULL WHERE `hIndex` LIKE '';

UPDATE `rawScimago` SET `totalDocs2015` = NULL WHERE `totalDocs2015` LIKE '';

UPDATE `rawScimago` SET `totalDocs3Years` = NULL WHERE `totalDocs3Years` LIKE '';

UPDATE `rawScimago` SET `totalRefs` = NULL WHERE `totalRefs` LIKE '';

UPDATE `rawScimago` SET `totalCites3Years` = NULL WHERE `totalCites3Years` LIKE '';

UPDATE `rawScimago` SET `citableDocs3Years` = NULL WHERE `citableDocs3Years` LIKE '';

UPDATE `rawScimago` SET `citesPerDoc2Years` = NULL WHERE `citesPerDoc2Years` LIKE '';

UPDATE `rawScimago` SET `refsPerDoc` = NULL WHERE `refsPerDoc` LIKE '';

UPDATE `rawScimago` SET `country` = NULL WHERE `country` LIKE '';

-- Clean up ISSN field
UPDATE `rawScimago` SET `issn` = (REPLACE(`issn`, '-', ''));

UPDATE `rawScimago` SET `issn` = (REPLACE(`issn`, 'ISSN', ''));

UPDATE `rawScimago` SET `issn` = (REPLACE(`issn`, ' ', ''));

UPDATE `rawScimago` SET `issn` = UPPER(REPLACE(`issn`, ',', '|'));

-- Trim white space from cells
UPDATE `rawScopusSources` SET `sourceRecordId` = TRIM(`sourceRecordId`);

UPDATE `rawScopusSources` SET `sourceTitle` = TRIM(`sourceTitle`);

UPDATE `rawScopusSources` SET `issn` = TRIM(`issn`);

UPDATE `rawScopusSources` SET `eIssn` = TRIM(`eIssn`);

UPDATE `rawScopusSources` SET `coverage` = TRIM(`coverage`);

UPDATE `rawScopusSources` SET `status` = TRIM(`status`);

UPDATE `rawScopusSources` SET `snip2013` = TRIM(`snip2013`);

UPDATE `rawScopusSources` SET `ipp2013` = TRIM(`ipp2013`);

UPDATE `rawScopusSources` SET `sjr2013` = TRIM(`sjr2013`);

UPDATE `rawScopusSources` SET `snip2014` = TRIM(`snip2014`);

UPDATE `rawScopusSources` SET `ipp2014` = TRIM(`ipp2014`);

UPDATE `rawScopusSources` SET `sjr2014` = TRIM(`sjr2014`);

UPDATE `rawScopusSources` SET `snip2015` = TRIM(`snip2015`);

UPDATE `rawScopusSources` SET `ipp2015` = TRIM(`ipp2015`);

UPDATE `rawScopusSources` SET `sjr2015` = TRIM(`sjr2015`);

UPDATE `rawScopusSources` SET `medlineSourced` = TRIM(`medlineSourced`);

UPDATE `rawScopusSources` SET `openAccess` = TRIM(`openAccess`);

UPDATE `rawScopusSources` SET `articlesInPress` = TRIM(`articlesInPress`);

UPDATE `rawScopusSources` SET `addedMay2016` = TRIM(`addedMay2016`);

UPDATE `rawScopusSources` SET `sourceType` = TRIM(`sourceType`);

UPDATE `rawScopusSources` SET `titleHistoryIndication` = TRIM(`titleHistoryIndication`);

UPDATE `rawScopusSources` SET `relatedTitle1` = TRIM(`relatedTitle1`);

UPDATE `rawScopusSources` SET `relatedTitle2` = TRIM(`relatedTitle2`);

UPDATE `rawScopusSources` SET `relatedTitle3` = TRIM(`relatedTitle3`);

UPDATE `rawScopusSources` SET `relatedTitle4` = TRIM(`relatedTitle4`);

UPDATE `rawScopusSources` SET `publisher` = TRIM(`publisher`);

UPDATE `rawScopusSources` SET `publisherImprints` = TRIM(`publisherImprints`);

UPDATE `rawScopusSources` SET `publicationLocation` = TRIM(`publicationLocation`);

UPDATE `rawScopusSources` SET `asjc` = TRIM(`asjc`);

UPDATE `rawScopusSources` SET `topLevelLifeSciences` = TRIM(`topLevelLifeSciences`);

UPDATE `rawScopusSources` SET `topLevelSocialSciences` = TRIM(`topLevelSocialSciences`);

UPDATE `rawScopusSources` SET `topLevelPhysicalSciences` = TRIM(`topLevelPhysicalSciences`);

UPDATE `rawScopusSources` SET `topLevelHealthSciences` = TRIM(`topLevelHealthSciences`);

UPDATE `rawScopusSources` SET `general` = TRIM(`general`);

UPDATE `rawScopusSources` SET `agriculturalBiologicalSciences` = TRIM(`agriculturalBiologicalSciences`);

UPDATE `rawScopusSources` SET `artsHumanities` = TRIM(`artsHumanities`);

UPDATE `rawScopusSources` SET `biochemistryGeneticsMolecularBiology` = TRIM(`biochemistryGeneticsMolecularBiology`);

UPDATE `rawScopusSources` SET `businessManagementAccounting` = TRIM(`businessManagementAccounting`);

UPDATE `rawScopusSources` SET `chemicalEngineering` = TRIM(`chemicalEngineering`);

UPDATE `rawScopusSources` SET `chemistry` = TRIM(`chemistry`);

UPDATE `rawScopusSources` SET `computerScience` = TRIM(`computerScience`);

UPDATE `rawScopusSources` SET `decisionSciences` = TRIM(`decisionSciences`);

UPDATE `rawScopusSources` SET `earthPlanetarySciences` = TRIM(`earthPlanetarySciences`);

UPDATE `rawScopusSources` SET `economicsEconometricsFinance` = TRIM(`economicsEconometricsFinance`);

UPDATE `rawScopusSources` SET `energy` = TRIM(`energy`);

UPDATE `rawScopusSources` SET `engineering` = TRIM(`engineering`);

UPDATE `rawScopusSources` SET `environmentalScience` = TRIM(`environmentalScience`);

UPDATE `rawScopusSources` SET `immunologyMicrobiology` = TRIM(`immunologyMicrobiology`);

UPDATE `rawScopusSources` SET `materialsScience` = TRIM(`materialsScience`);

UPDATE `rawScopusSources` SET `mathematics` = TRIM(`mathematics`);

UPDATE `rawScopusSources` SET `medicine` = TRIM(`medicine`);

UPDATE `rawScopusSources` SET `neuroscience` = TRIM(`neuroscience`);

UPDATE `rawScopusSources` SET `nursing` = TRIM(`nursing`);

UPDATE `rawScopusSources` SET `pharmacologyToxicologyPharmaceutics` = TRIM(`pharmacologyToxicologyPharmaceutics`);

UPDATE `rawScopusSources` SET `physicsAstronomy` = TRIM(`physicsAstronomy`);

UPDATE `rawScopusSources` SET `psychology` = TRIM(`psychology`);

UPDATE `rawScopusSources` SET `socialSciences` = TRIM(`socialSciences`);

UPDATE `rawScopusSources` SET `veterinary` = TRIM(`veterinary`);

UPDATE `rawScopusSources` SET `dentistry` = TRIM(`dentistry`);

UPDATE `rawScopusSources` SET `healthProfessions` = TRIM(`healthProfessions`);

-- Clean up empty values in `rawScopusSources`
UPDATE `rawScopusSources` SET `sourceRecordId` = NULL WHERE `sourceRecordId` LIKE '';

UPDATE `rawScopusSources` SET `sourceTitle` = NULL WHERE `sourceTitle` LIKE '';

UPDATE `rawScopusSources` SET `issn` = NULL WHERE `issn` LIKE '';

UPDATE `rawScopusSources` SET `eIssn` = NULL WHERE `eIssn` LIKE '';

UPDATE `rawScopusSources` SET `coverage` = NULL WHERE `coverage` LIKE '';

UPDATE `rawScopusSources` SET `status` = NULL WHERE `status` LIKE '';

UPDATE `rawScopusSources` SET `snip2013` = NULL WHERE `snip2013` LIKE '';

UPDATE `rawScopusSources` SET `ipp2013` = NULL WHERE `ipp2013` LIKE '';

UPDATE `rawScopusSources` SET `sjr2013` = NULL WHERE `sjr2013` LIKE '';

UPDATE `rawScopusSources` SET `snip2014` = NULL WHERE `snip2014` LIKE '';

UPDATE `rawScopusSources` SET `ipp2014` = NULL WHERE `ipp2014` LIKE '';

UPDATE `rawScopusSources` SET `sjr2014` = NULL WHERE `sjr2014` LIKE '';

UPDATE `rawScopusSources` SET `snip2015` = NULL WHERE `snip2015` LIKE '';

UPDATE `rawScopusSources` SET `ipp2015` = NULL WHERE `ipp2015` LIKE '';

UPDATE `rawScopusSources` SET `sjr2015` = NULL WHERE `sjr2015` LIKE '';

UPDATE `rawScopusSources` SET `medlineSourced` = NULL WHERE `medlineSourced` LIKE '';

UPDATE `rawScopusSources` SET `openAccess` = NULL WHERE `openAccess` LIKE '';

UPDATE `rawScopusSources` SET `articlesInPress` = NULL WHERE `articlesInPress` LIKE '';

UPDATE `rawScopusSources` SET `addedMay2016` = NULL WHERE `addedMay2016` LIKE '';

UPDATE `rawScopusSources` SET `sourceType` = NULL WHERE `sourceType` LIKE '';

UPDATE `rawScopusSources` SET `titleHistoryIndication` = NULL WHERE `titleHistoryIndication` LIKE '';

UPDATE `rawScopusSources` SET `relatedTitle1` = NULL WHERE `relatedTitle1` LIKE '';

UPDATE `rawScopusSources` SET `relatedTitle2` = NULL WHERE `relatedTitle2` LIKE '';

UPDATE `rawScopusSources` SET `relatedTitle3` = NULL WHERE `relatedTitle3` LIKE '';

UPDATE `rawScopusSources` SET `relatedTitle4` = NULL WHERE `relatedTitle4` LIKE '';

UPDATE `rawScopusSources` SET `publisher` = NULL WHERE `publisher` LIKE '';

UPDATE `rawScopusSources` SET `publisherImprints` = NULL WHERE `publisherImprints` LIKE '';

UPDATE `rawScopusSources` SET `publicationLocation` = NULL WHERE `publicationLocation` LIKE '';

UPDATE `rawScopusSources` SET `asjc` = NULL WHERE `asjc` LIKE '';

UPDATE `rawScopusSources` SET `topLevelLifeSciences` = NULL WHERE `topLevelLifeSciences` LIKE '';

UPDATE `rawScopusSources` SET `topLevelSocialSciences` = NULL WHERE `topLevelSocialSciences` LIKE '';

UPDATE `rawScopusSources` SET `topLevelPhysicalSciences` = NULL WHERE `topLevelPhysicalSciences` LIKE '';

UPDATE `rawScopusSources` SET `topLevelHealthSciences` = NULL WHERE `topLevelHealthSciences` LIKE '';

UPDATE `rawScopusSources` SET `general` = NULL WHERE `general` LIKE '';

UPDATE `rawScopusSources` SET `agriculturalBiologicalSciences` = NULL WHERE `agriculturalBiologicalSciences` LIKE '';

UPDATE `rawScopusSources` SET `artsHumanities` = NULL WHERE `artsHumanities` LIKE '';

UPDATE `rawScopusSources` SET `biochemistryGeneticsMolecularBiology` = NULL WHERE `biochemistryGeneticsMolecularBiology` LIKE '';

UPDATE `rawScopusSources` SET `businessManagementAccounting` = NULL WHERE `businessManagementAccounting` LIKE '';

UPDATE `rawScopusSources` SET `chemicalEngineering` = NULL WHERE `chemicalEngineering` LIKE '';

UPDATE `rawScopusSources` SET `chemistry` = NULL WHERE `chemistry` LIKE '';

UPDATE `rawScopusSources` SET `computerScience` = NULL WHERE `computerScience` LIKE '';

UPDATE `rawScopusSources` SET `decisionSciences` = NULL WHERE `decisionSciences` LIKE '';

UPDATE `rawScopusSources` SET `earthPlanetarySciences` = NULL WHERE `earthPlanetarySciences` LIKE '';

UPDATE `rawScopusSources` SET `economicsEconometricsFinance` = NULL WHERE `economicsEconometricsFinance` LIKE '';

UPDATE `rawScopusSources` SET `energy` = NULL WHERE `energy` LIKE '';

UPDATE `rawScopusSources` SET `engineering` = NULL WHERE `engineering` LIKE '';

UPDATE `rawScopusSources` SET `environmentalScience` = NULL WHERE `environmentalScience` LIKE '';

UPDATE `rawScopusSources` SET `immunologyMicrobiology` = NULL WHERE `immunologyMicrobiology` LIKE '';

UPDATE `rawScopusSources` SET `materialsScience` = NULL WHERE `materialsScience` LIKE '';

UPDATE `rawScopusSources` SET `mathematics` = NULL WHERE `mathematics` LIKE '';

UPDATE `rawScopusSources` SET `medicine` = NULL WHERE `medicine` LIKE '';

UPDATE `rawScopusSources` SET `neuroscience` = NULL WHERE `neuroscience` LIKE '';

UPDATE `rawScopusSources` SET `nursing` = NULL WHERE `nursing` LIKE '';

UPDATE `rawScopusSources` SET `pharmacologyToxicologyPharmaceutics` = NULL WHERE `pharmacologyToxicologyPharmaceutics` LIKE '';

UPDATE `rawScopusSources` SET `physicsAstronomy` = NULL WHERE `physicsAstronomy` LIKE '';

UPDATE `rawScopusSources` SET `psychology` = NULL WHERE `psychology` LIKE '';

UPDATE `rawScopusSources` SET `socialSciences` = NULL WHERE `socialSciences` LIKE '';

UPDATE `rawScopusSources` SET `veterinary` = NULL WHERE `veterinary` LIKE '';

UPDATE `rawScopusSources` SET `dentistry` = NULL WHERE `dentistry` LIKE '';

UPDATE `rawScopusSources` SET `healthProfessions` = NULL WHERE `healthProfessions` LIKE '';

-- Clean up ASJC codes
UPDATE `rawScopusSources` SET `asjc` = (REPLACE(`asjc`, ' ', ''));

UPDATE `rawScopusSources` SET `asjc` = (REPLACE(`asjc`, ';', '|'));

-- Clean up ISSNs
UPDATE `rawScopusSources` SET `issn` = (REPLACE(`issn`, '-', ''));

UPDATE `rawScopusSources` SET `issn` = UPPER(`issn`);

UPDATE `rawScopusSources` SET `issn` = LPAD(`issn`, 8, '0');

UPDATE `rawScopusSources` SET `eIssn` = (REPLACE(`eIssn`, '-', ''));

UPDATE `rawScopusSources` SET `eIssn` = UPPER(`eIssn`);

UPDATE `rawScopusSources` SET `eIssn` = LPAD(`eIssn`, 8, '0');

ALTER TABLE `rawScopusSources` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;

ALTER TABLE `rawScopusSources` CHANGE `eIssn` `eIssn` VARCHAR(8) NULL DEFAULT NULL;

-- Trim white space from cells
UPDATE `rawSfx` SET `sortableTitle` = TRIM(`sortableTitle`);

UPDATE `rawSfx` SET `title` = TRIM(`title`);

UPDATE `rawSfx` SET `titleNonFilingCharacter` = TRIM(`titleNonFilingCharacter`);

UPDATE `rawSfx` SET `issn` = TRIM(`issn`);

UPDATE `rawSfx` SET `objectId` = TRIM(`objectId`);

UPDATE `rawSfx` SET `targetPublicName` = TRIM(`targetPublicName`);

UPDATE `rawSfx` SET `threshold` = TRIM(`threshold`);

UPDATE `rawSfx` SET `eIssn` = TRIM(`eIssn`);

UPDATE `rawSfx` SET `abbreviatedTitle` = TRIM(`abbreviatedTitle`);

UPDATE `rawSfx` SET `targetServiceType` = TRIM(`targetServiceType`);

UPDATE `rawSfx` SET `lccn` = TRIM(`lccn`);

UPDATE `rawSfx` SET `objectPortfolioId` = TRIM(`objectPortfolioId`);

UPDATE `rawSfx` SET `856u` = TRIM(`856u`);

UPDATE `rawSfx` SET `856y` = TRIM(`856y`);

UPDATE `rawSfx` SET `856a` = TRIM(`856a`);

UPDATE `rawSfx` SET `245h` = TRIM(`245h`);

UPDATE `rawSfx` SET `localThreshold` = TRIM(`localThreshold`);

UPDATE `rawSfx` SET `globalThreshold` = TRIM(`globalThreshold`);

UPDATE `rawSfx` SET `targetId` = TRIM(`targetId`);

UPDATE `rawSfx` SET `targetServiceId` = TRIM(`targetServiceId`);

UPDATE `rawSfx` SET `objectPortfolioId2` = TRIM(`objectPortfolioId2`);

UPDATE `rawSfx` SET `categories` = TRIM(`categories`);

UPDATE `rawSfx` SET `localAttribute` = TRIM(`localAttribute`);

UPDATE `rawSfx` SET `isbn` = TRIM(`isbn`);

UPDATE `rawSfx` SET `eIsbn` = TRIM(`eIsbn`);

UPDATE `rawSfx` SET `publisher` = TRIM(`publisher`);

UPDATE `rawSfx` SET `publicationLocation` = TRIM(`publicationLocation`);

UPDATE `rawSfx` SET `publicationDate` = TRIM(`publicationDate`);

UPDATE `rawSfx` SET `objectType` = TRIM(`objectType`);

UPDATE `rawSfx` SET `activationStatus` = TRIM(`activationStatus`);

UPDATE `rawSfx` SET `instituteId` = TRIM(`instituteId`);

UPDATE `rawSfx` SET `instituteName` = TRIM(`instituteName`);

UPDATE `rawSfx` SET `instituteAvailability` = TRIM(`instituteAvailability`);

UPDATE `rawSfx` SET `language` = TRIM(`language`);

UPDATE `rawSfx` SET `mainTitleCjk` = TRIM(`mainTitleCjk`);

UPDATE `rawSfx` SET `fullOriginalTitleCjk` = TRIM(`fullOriginalTitleCjk`);

UPDATE `rawSfx` SET `additionalIsbns` = TRIM(`additionalIsbns`);

UPDATE `rawSfx` SET `additionalEIsbns` = TRIM(`additionalEIsbns`);

UPDATE `rawSfx` SET `author` = TRIM(`author`);

UPDATE `rawSfx` SET `owner` = TRIM(`owner`);

UPDATE `rawSfx` SET `thresholdLocal` = TRIM(`thresholdLocal`);

UPDATE `rawSfx` SET `parseParam` = TRIM(`parseParam`);

UPDATE `rawSfx` SET `isFree` = TRIM(`isFree`);

-- Clean up empty values
UPDATE `rawSfx` SET `sortableTitle` = NULL WHERE `sortableTitle` LIKE '';

UPDATE `rawSfx` SET `title` = NULL WHERE `title` LIKE '';

UPDATE `rawSfx` SET `titleNonFilingCharacter` = NULL WHERE `titleNonFilingCharacter` LIKE '';

UPDATE `rawSfx` SET `issn` = NULL WHERE `issn` LIKE '';

UPDATE `rawSfx` SET `objectId` = NULL WHERE `objectId` LIKE '';

UPDATE `rawSfx` SET `targetPublicName` = NULL WHERE `targetPublicName` LIKE '';

UPDATE `rawSfx` SET `threshold` = NULL WHERE `threshold` LIKE '';

UPDATE `rawSfx` SET `eIssn` = NULL WHERE `eIssn` LIKE '';

UPDATE `rawSfx` SET `abbreviatedTitle` = NULL WHERE `abbreviatedTitle` LIKE '';

UPDATE `rawSfx` SET `targetServiceType` = NULL WHERE `targetServiceType` LIKE '';

UPDATE `rawSfx` SET `lccn` = NULL WHERE `lccn` LIKE '';

UPDATE `rawSfx` SET `objectPortfolioId` = NULL WHERE `objectPortfolioId` LIKE '';

UPDATE `rawSfx` SET `856u` = NULL WHERE `856u` LIKE '';

UPDATE `rawSfx` SET `856y` = NULL WHERE `856y` LIKE '';

UPDATE `rawSfx` SET `856a` = NULL WHERE `856a` LIKE '';

UPDATE `rawSfx` SET `245h` = NULL WHERE `245h` LIKE '';

UPDATE `rawSfx` SET `localThreshold` = NULL WHERE `localThreshold` LIKE '';

UPDATE `rawSfx` SET `globalThreshold` = NULL WHERE `globalThreshold` LIKE '';

UPDATE `rawSfx` SET `targetId` = NULL WHERE `targetId` LIKE '';

UPDATE `rawSfx` SET `targetServiceId` = NULL WHERE `targetServiceId` LIKE '';

UPDATE `rawSfx` SET `objectPortfolioId2` = NULL WHERE `objectPortfolioId2` LIKE '';

UPDATE `rawSfx` SET `categories` = NULL WHERE `categories` LIKE '';

UPDATE `rawSfx` SET `localAttribute` = NULL WHERE `localAttribute` LIKE '';

UPDATE `rawSfx` SET `isbn` = NULL WHERE `isbn` LIKE '';

UPDATE `rawSfx` SET `eIsbn` = NULL WHERE `eIsbn` LIKE '';

UPDATE `rawSfx` SET `publisher` = NULL WHERE `publisher` LIKE '';

UPDATE `rawSfx` SET `publicationLocation` = NULL WHERE `publicationLocation` LIKE '';

UPDATE `rawSfx` SET `publicationDate` = NULL WHERE `publicationDate` LIKE '';

UPDATE `rawSfx` SET `objectType` = NULL WHERE `objectType` LIKE '';

UPDATE `rawSfx` SET `activationStatus` = NULL WHERE `activationStatus` LIKE '';

UPDATE `rawSfx` SET `instituteId` = NULL WHERE `instituteId` LIKE '';

UPDATE `rawSfx` SET `instituteName` = NULL WHERE `instituteName` LIKE '';

UPDATE `rawSfx` SET `instituteAvailability` = NULL WHERE `instituteAvailability` LIKE '';

UPDATE `rawSfx` SET `language` = NULL WHERE `language` LIKE '';

UPDATE `rawSfx` SET `mainTitleCjk` = NULL WHERE `mainTitleCjk` LIKE '';

UPDATE `rawSfx` SET `fullOriginalTitleCjk` = NULL WHERE `fullOriginalTitleCjk` LIKE '';

UPDATE `rawSfx` SET `additionalIsbns` = NULL WHERE `additionalIsbns` LIKE '';

UPDATE `rawSfx` SET `additionalEIsbns` = NULL WHERE `additionalEIsbns` LIKE '';

UPDATE `rawSfx` SET `author` = NULL WHERE `author` LIKE '';

UPDATE `rawSfx` SET `owner` = NULL WHERE `owner` LIKE '';

UPDATE `rawSfx` SET `thresholdLocal` = NULL WHERE `thresholdLocal` LIKE '';

UPDATE `rawSfx` SET `parseParam` = NULL WHERE `parseParam` LIKE '';

UPDATE `rawSfx` SET `isFree` = NULL WHERE `isFree` LIKE '';

-- Replace weird delimiters with pipe delimiters
UPDATE `rawSfx` SET `lccn` = (REPLACE(`lccn`, ' ', ''));

UPDATE `rawSfx` SET `lccn` = (REPLACE(`lccn`, ',', '|'));

UPDATE `rawSfx` SET `abbreviatedTitle` = (REPLACE(`abbreviatedTitle`, '/%/', '|'));

UPDATE `rawSfx` SET `categories` = (REPLACE(`categories`, ' | ', '|'));

-- Remove hyphens from ISSNs and eISSNs and make sure all `X` check digits are capitalized
UPDATE `rawSfx` SET `issn` = UPPER(REPLACE(`issn`, '-', ''));

UPDATE `rawSfx` SET `eIssn` = UPPER(REPLACE(`eIssn`, '-', ''));

UPDATE `rawSfx` SET `issn` = LPAD(`issn`, 8, '0');

UPDATE `rawSfx` SET `eIssn` = LPAD(`eIssn`, 8, '0');

ALTER TABLE `rawSfx` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;

ALTER TABLE `rawSfx` CHANGE `eIssn` `eIssn` VARCHAR(8) NULL DEFAULT NULL;

-- Remove hyphens from LCCN
UPDATE `rawSfx` SET `lccn` = REPLACE(`lccn`, '-', '');

ALTER TABLE `rawSfx` CHANGE `lccn` `lccn` VARCHAR(10) NULL DEFAULT NULL;

-- Clean up publication data for consistency
UPDATE `rawSfx` SET `publicationLocation` = (REPLACE(`publicationLocation`, '[', ''));

UPDATE `rawSfx` SET `publicationLocation` = (REPLACE(`publicationLocation`, ']', ''));

UPDATE `rawSfx` SET `publisher` = (REPLACE(`publisher`, '[', ''));

UPDATE `rawSfx` SET `publisher` = (REPLACE(`publisher`, ']', ''));

UPDATE `rawSfx` SET `publisher` = (REPLACE(`publisher`, ' :', ''));

-- Trim white space from cells
UPDATE `rawSnip` SET `sourceRecordId` = TRIM(`sourceRecordId`);

UPDATE `rawSnip` SET `sourceTitle` = TRIM(`sourceTitle`);

UPDATE `rawSnip` SET `issn` = TRIM(`issn`);

UPDATE `rawSnip` SET `eIssn` = TRIM(`eIssn`);

UPDATE `rawSnip` SET `publisher` = TRIM(`publisher`);

UPDATE `rawSnip` SET `publisherImprints` = TRIM(`publisherImprints`);

UPDATE `rawSnip` SET `publicationLocation` = TRIM(`publicationLocation`);

UPDATE `rawSnip` SET `snip1999` = TRIM(`snip1999`);

UPDATE `rawSnip` SET `ipp1999` = TRIM(`ipp1999`);

UPDATE `rawSnip` SET `sjr1999` = TRIM(`sjr1999`);

UPDATE `rawSnip` SET `snip2000` = TRIM(`snip2000`);

UPDATE `rawSnip` SET `ipp2000` = TRIM(`ipp2000`);

UPDATE `rawSnip` SET `sjr2000` = TRIM(`sjr2000`);

UPDATE `rawSnip` SET `snip2001` = TRIM(`snip2001`);

UPDATE `rawSnip` SET `ipp2001` = TRIM(`ipp2001`);

UPDATE `rawSnip` SET `sjr2001` = TRIM(`sjr2001`);

UPDATE `rawSnip` SET `snip2002` = TRIM(`snip2002`);

UPDATE `rawSnip` SET `ipp2002` = TRIM(`ipp2002`);

UPDATE `rawSnip` SET `sjr2002` = TRIM(`sjr2002`);

UPDATE `rawSnip` SET `snip2003` = TRIM(`snip2003`);

UPDATE `rawSnip` SET `ipp2003` = TRIM(`ipp2003`);

UPDATE `rawSnip` SET `sjr2003` = TRIM(`sjr2003`);

UPDATE `rawSnip` SET `snip2004` = TRIM(`snip2004`);

UPDATE `rawSnip` SET `ipp2004` = TRIM(`ipp2004`);

UPDATE `rawSnip` SET `sjr2004` = TRIM(`sjr2004`);

UPDATE `rawSnip` SET `snip2005` = TRIM(`snip2005`);

UPDATE `rawSnip` SET `ipp2005` = TRIM(`ipp2005`);

UPDATE `rawSnip` SET `sjr2005` = TRIM(`sjr2005`);

UPDATE `rawSnip` SET `snip2006` = TRIM(`snip2006`);

UPDATE `rawSnip` SET `ipp2006` = TRIM(`ipp2006`);

UPDATE `rawSnip` SET `sjr2006` = TRIM(`sjr2006`);

UPDATE `rawSnip` SET `snip2007` = TRIM(`snip2007`);

UPDATE `rawSnip` SET `ipp2007` = TRIM(`ipp2007`);

UPDATE `rawSnip` SET `sjr2007` = TRIM(`sjr2007`);

UPDATE `rawSnip` SET `snip2008` = TRIM(`snip2008`);

UPDATE `rawSnip` SET `ipp2008` = TRIM(`ipp2008`);

UPDATE `rawSnip` SET `sjr2008` = TRIM(`sjr2008`);

UPDATE `rawSnip` SET `snip2009` = TRIM(`snip2009`);

UPDATE `rawSnip` SET `ipp2009` = TRIM(`ipp2009`);

UPDATE `rawSnip` SET `sjr2009` = TRIM(`sjr2009`);

UPDATE `rawSnip` SET `snip2010` = TRIM(`snip2010`);

UPDATE `rawSnip` SET `ipp2010` = TRIM(`ipp2010`);

UPDATE `rawSnip` SET `sjr2010` = TRIM(`sjr2010`);

UPDATE `rawSnip` SET `snip2011` = TRIM(`snip2011`);

UPDATE `rawSnip` SET `ipp2011` = TRIM(`ipp2011`);

UPDATE `rawSnip` SET `sjr2011` = TRIM(`sjr2011`);

UPDATE `rawSnip` SET `snip2012` = TRIM(`snip2012`);

UPDATE `rawSnip` SET `ipp2012` = TRIM(`ipp2012`);

UPDATE `rawSnip` SET `sjr2012` = TRIM(`sjr2012`);

UPDATE `rawSnip` SET `snip2013` = TRIM(`snip2013`);

UPDATE `rawSnip` SET `ipp2013` = TRIM(`ipp2013`);

UPDATE `rawSnip` SET `sjr2013` = TRIM(`sjr2013`);

UPDATE `rawSnip` SET `snip2014` = TRIM(`snip2014`);

UPDATE `rawSnip` SET `ipp2014` = TRIM(`ipp2014`);

UPDATE `rawSnip` SET `sjr2014` = TRIM(`sjr2014`);

UPDATE `rawSnip` SET `snip2015` = TRIM(`snip2015`);

UPDATE `rawSnip` SET `ipp2015` = TRIM(`ipp2015`);

UPDATE `rawSnip` SET `sjr2015` = TRIM(`sjr2015`);

UPDATE `rawSnip` SET `topLevelLifeSciences` = TRIM(`topLevelLifeSciences`);

UPDATE `rawSnip` SET `topLevelSocialSciences` = TRIM(`topLevelSocialSciences`);

UPDATE `rawSnip` SET `topLevelPhysicalSciences` = TRIM(`topLevelPhysicalSciences`);

UPDATE `rawSnip` SET `topLevelHealthSciences` = TRIM(`topLevelHealthSciences`);

UPDATE `rawSnip` SET `general` = TRIM(`general`);

UPDATE `rawSnip` SET `agriculturalBiologicalSciences` = TRIM(`agriculturalBiologicalSciences`);

UPDATE `rawSnip` SET `artsHumanities` = TRIM(`artsHumanities`);

UPDATE `rawSnip` SET `biochemistryGeneticsMolecularBiology` = TRIM(`biochemistryGeneticsMolecularBiology`);

UPDATE `rawSnip` SET `businessManagementAccounting` = TRIM(`businessManagementAccounting`);

UPDATE `rawSnip` SET `chemicalEngineering` = TRIM(`chemicalEngineering`);

UPDATE `rawSnip` SET `chemistry` = TRIM(`chemistry`);

UPDATE `rawSnip` SET `computerScience` = TRIM(`computerScience`);

UPDATE `rawSnip` SET `decisionSciences` = TRIM(`decisionSciences`);

UPDATE `rawSnip` SET `earthPlanetarySciences` = TRIM(`earthPlanetarySciences`);

UPDATE `rawSnip` SET `economicsEconometricsFinance` = TRIM(`economicsEconometricsFinance`);

UPDATE `rawSnip` SET `energy` = TRIM(`energy`);

UPDATE `rawSnip` SET `engineering` = TRIM(`engineering`);

UPDATE `rawSnip` SET `environmentalScience` = TRIM(`environmentalScience`);

UPDATE `rawSnip` SET `immunologyMicrobiology` = TRIM(`immunologyMicrobiology`);

UPDATE `rawSnip` SET `materialsScience` = TRIM(`materialsScience`);

UPDATE `rawSnip` SET `mathematics` = TRIM(`mathematics`);

UPDATE `rawSnip` SET `medicine` = TRIM(`medicine`);

UPDATE `rawSnip` SET `neuroscience` = TRIM(`neuroscience`);

UPDATE `rawSnip` SET `nursing` = TRIM(`nursing`);

UPDATE `rawSnip` SET `pharmacologyToxicologyPharmaceutics` = TRIM(`pharmacologyToxicologyPharmaceutics`);

UPDATE `rawSnip` SET `physicsAstronomy` = TRIM(`physicsAstronomy`);

UPDATE `rawSnip` SET `psychology` = TRIM(`psychology`);

UPDATE `rawSnip` SET `socialSciences` = TRIM(`socialSciences`);

UPDATE `rawSnip` SET `veterinary` = TRIM(`veterinary`);

UPDATE `rawSnip` SET `dentistry` = TRIM(`dentistry`);

UPDATE `rawSnip` SET `healthProfessions` = TRIM(`healthProfessions`);

UPDATE `rawSnip` SET `asjc` = TRIM(`asjc`);

-- Clean up empty values in `rawSnip`
UPDATE `rawSnip` SET `sourceRecordId` = NULL WHERE `sourceRecordId` LIKE '';

UPDATE `rawSnip` SET `sourceTitle` = NULL WHERE `sourceTitle` LIKE '';

UPDATE `rawSnip` SET `issn` = NULL WHERE `issn` LIKE '';

UPDATE `rawSnip` SET `eIssn` = NULL WHERE `eIssn` LIKE '';

UPDATE `rawSnip` SET `publisher` = NULL WHERE `publisher` LIKE '';

UPDATE `rawSnip` SET `publisherImprints` = NULL WHERE `publisherImprints` LIKE '';

UPDATE `rawSnip` SET `publicationLocation` = NULL WHERE `publicationLocation` LIKE '';

UPDATE `rawSnip` SET `snip1999` = NULL WHERE `snip1999` LIKE '';

UPDATE `rawSnip` SET `ipp1999` = NULL WHERE `ipp1999` LIKE '';

UPDATE `rawSnip` SET `sjr1999` = NULL WHERE `sjr1999` LIKE '';

UPDATE `rawSnip` SET `snip2000` = NULL WHERE `snip2000` LIKE '';

UPDATE `rawSnip` SET `ipp2000` = NULL WHERE `ipp2000` LIKE '';

UPDATE `rawSnip` SET `sjr2000` = NULL WHERE `sjr2000` LIKE '';

UPDATE `rawSnip` SET `snip2001` = NULL WHERE `snip2001` LIKE '';

UPDATE `rawSnip` SET `ipp2001` = NULL WHERE `ipp2001` LIKE '';

UPDATE `rawSnip` SET `sjr2001` = NULL WHERE `sjr2001` LIKE '';

UPDATE `rawSnip` SET `snip2002` = NULL WHERE `snip2002` LIKE '';

UPDATE `rawSnip` SET `ipp2002` = NULL WHERE `ipp2002` LIKE '';

UPDATE `rawSnip` SET `sjr2002` = NULL WHERE `sjr2002` LIKE '';

UPDATE `rawSnip` SET `snip2003` = NULL WHERE `snip2003` LIKE '';

UPDATE `rawSnip` SET `ipp2003` = NULL WHERE `ipp2003` LIKE '';

UPDATE `rawSnip` SET `sjr2003` = NULL WHERE `sjr2003` LIKE '';

UPDATE `rawSnip` SET `snip2004` = NULL WHERE `snip2004` LIKE '';

UPDATE `rawSnip` SET `ipp2004` = NULL WHERE `ipp2004` LIKE '';

UPDATE `rawSnip` SET `sjr2004` = NULL WHERE `sjr2004` LIKE '';

UPDATE `rawSnip` SET `snip2005` = NULL WHERE `snip2005` LIKE '';

UPDATE `rawSnip` SET `ipp2005` = NULL WHERE `ipp2005` LIKE '';

UPDATE `rawSnip` SET `sjr2005` = NULL WHERE `sjr2005` LIKE '';

UPDATE `rawSnip` SET `snip2006` = NULL WHERE `snip2006` LIKE '';

UPDATE `rawSnip` SET `ipp2006` = NULL WHERE `ipp2006` LIKE '';

UPDATE `rawSnip` SET `sjr2006` = NULL WHERE `sjr2006` LIKE '';

UPDATE `rawSnip` SET `snip2007` = NULL WHERE `snip2007` LIKE '';

UPDATE `rawSnip` SET `ipp2007` = NULL WHERE `ipp2007` LIKE '';

UPDATE `rawSnip` SET `sjr2007` = NULL WHERE `sjr2007` LIKE '';

UPDATE `rawSnip` SET `snip2008` = NULL WHERE `snip2008` LIKE '';

UPDATE `rawSnip` SET `ipp2008` = NULL WHERE `ipp2008` LIKE '';

UPDATE `rawSnip` SET `sjr2008` = NULL WHERE `sjr2008` LIKE '';

UPDATE `rawSnip` SET `snip2009` = NULL WHERE `snip2009` LIKE '';

UPDATE `rawSnip` SET `ipp2009` = NULL WHERE `ipp2009` LIKE '';

UPDATE `rawSnip` SET `sjr2009` = NULL WHERE `sjr2009` LIKE '';

UPDATE `rawSnip` SET `snip2010` = NULL WHERE `snip2010` LIKE '';

UPDATE `rawSnip` SET `ipp2010` = NULL WHERE `ipp2010` LIKE '';

UPDATE `rawSnip` SET `sjr2010` = NULL WHERE `sjr2010` LIKE '';

UPDATE `rawSnip` SET `snip2011` = NULL WHERE `snip2011` LIKE '';

UPDATE `rawSnip` SET `ipp2011` = NULL WHERE `ipp2011` LIKE '';

UPDATE `rawSnip` SET `sjr2011` = NULL WHERE `sjr2011` LIKE '';

UPDATE `rawSnip` SET `snip2012` = NULL WHERE `snip2012` LIKE '';

UPDATE `rawSnip` SET `ipp2012` = NULL WHERE `ipp2012` LIKE '';

UPDATE `rawSnip` SET `sjr2012` = NULL WHERE `sjr2012` LIKE '';

UPDATE `rawSnip` SET `snip2013` = NULL WHERE `snip2013` LIKE '';

UPDATE `rawSnip` SET `ipp2013` = NULL WHERE `ipp2013` LIKE '';

UPDATE `rawSnip` SET `sjr2013` = NULL WHERE `sjr2013` LIKE '';

UPDATE `rawSnip` SET `snip2014` = NULL WHERE `snip2014` LIKE '';

UPDATE `rawSnip` SET `ipp2014` = NULL WHERE `ipp2014` LIKE '';

UPDATE `rawSnip` SET `sjr2014` = NULL WHERE `sjr2014` LIKE '';

UPDATE `rawSnip` SET `snip2015` = NULL WHERE `snip2015` LIKE '';

UPDATE `rawSnip` SET `ipp2015` = NULL WHERE `ipp2015` LIKE '';

UPDATE `rawSnip` SET `sjr2015` = NULL WHERE `sjr2015` LIKE '';

UPDATE `rawSnip` SET `topLevelLifeSciences` = NULL WHERE `topLevelLifeSciences` LIKE '';

UPDATE `rawSnip` SET `topLevelSocialSciences` = NULL WHERE `topLevelSocialSciences` LIKE '';

UPDATE `rawSnip` SET `topLevelPhysicalSciences` = NULL WHERE `topLevelPhysicalSciences` LIKE '';

UPDATE `rawSnip` SET `topLevelHealthSciences` = NULL WHERE `topLevelHealthSciences` LIKE '';

UPDATE `rawSnip` SET `general` = NULL WHERE `general` LIKE '';

UPDATE `rawSnip` SET `agriculturalBiologicalSciences` = NULL WHERE `agriculturalBiologicalSciences` LIKE '';

UPDATE `rawSnip` SET `artsHumanities` = NULL WHERE `artsHumanities` LIKE '';

UPDATE `rawSnip` SET `biochemistryGeneticsMolecularBiology` = NULL WHERE `biochemistryGeneticsMolecularBiology` LIKE '';

UPDATE `rawSnip` SET `businessManagementAccounting` = NULL WHERE `businessManagementAccounting` LIKE '';

UPDATE `rawSnip` SET `chemicalEngineering` = NULL WHERE `chemicalEngineering` LIKE '';

UPDATE `rawSnip` SET `chemistry` = NULL WHERE `chemistry` LIKE '';

UPDATE `rawSnip` SET `computerScience` = NULL WHERE `computerScience` LIKE '';

UPDATE `rawSnip` SET `decisionSciences` = NULL WHERE `decisionSciences` LIKE '';

UPDATE `rawSnip` SET `earthPlanetarySciences` = NULL WHERE `earthPlanetarySciences` LIKE '';

UPDATE `rawSnip` SET `economicsEconometricsFinance` = NULL WHERE `economicsEconometricsFinance` LIKE '';

UPDATE `rawSnip` SET `energy` = NULL WHERE `energy` LIKE '';

UPDATE `rawSnip` SET `engineering` = NULL WHERE `engineering` LIKE '';

UPDATE `rawSnip` SET `environmentalScience` = NULL WHERE `environmentalScience` LIKE '';

UPDATE `rawSnip` SET `immunologyMicrobiology` = NULL WHERE `immunologyMicrobiology` LIKE '';

UPDATE `rawSnip` SET `materialsScience` = NULL WHERE `materialsScience` LIKE '';

UPDATE `rawSnip` SET `mathematics` = NULL WHERE `mathematics` LIKE '';

UPDATE `rawSnip` SET `medicine` = NULL WHERE `medicine` LIKE '';

UPDATE `rawSnip` SET `neuroscience` = NULL WHERE `neuroscience` LIKE '';

UPDATE `rawSnip` SET `nursing` = NULL WHERE `nursing` LIKE '';

UPDATE `rawSnip` SET `pharmacologyToxicologyPharmaceutics` = NULL WHERE `pharmacologyToxicologyPharmaceutics` LIKE '';

UPDATE `rawSnip` SET `physicsAstronomy` = NULL WHERE `physicsAstronomy` LIKE '';

UPDATE `rawSnip` SET `psychology` = NULL WHERE `psychology` LIKE '';

UPDATE `rawSnip` SET `socialSciences` = NULL WHERE `socialSciences` LIKE '';

UPDATE `rawSnip` SET `veterinary` = NULL WHERE `veterinary` LIKE '';

UPDATE `rawSnip` SET `dentistry` = NULL WHERE `dentistry` LIKE '';

UPDATE `rawSnip` SET `healthProfessions` = NULL WHERE `healthProfessions` LIKE '';

UPDATE `rawSnip` SET `asjc` = NULL WHERE `asjc` LIKE '';

-- Clean up ASJC codes
UPDATE `rawSnip` SET `asjc` = TRIM(TRAILING "\r" FROM `asjc`); -- Remove trailing line breaks

UPDATE `rawSnip` SET `asjc` = (REPLACE(`asjc`, ' ', ''));

UPDATE `rawSnip` SET `asjc` = (REPLACE(`asjc`, ';', '|'));

-- Clean up ISSNs
UPDATE `rawSnip` SET `issn` = (REPLACE(`issn`, '-', ''));

UPDATE `rawSnip` SET `issn` = UPPER(`issn`);

UPDATE `rawSnip` SET `issn` = LPAD(`issn`, 8, '0');

UPDATE `rawSnip` SET `eIssn` = (REPLACE(`eIssn`, '-', ''));

UPDATE `rawSnip` SET `eIssn` = UPPER(`eIssn`);

UPDATE `rawSnip` SET `eIssn` = LPAD(`eIssn`, 8, '0');

ALTER TABLE `rawSnip` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;

ALTER TABLE `rawSnip` CHANGE `eIssn` `eIssn` VARCHAR(8) NULL DEFAULT NULL;

-- Trim white space from cells
UPDATE `rawUsage` SET `title` = TRIM(`title`);

UPDATE `rawUsage` SET `publisher` = TRIM(`publisher`);

UPDATE `rawUsage` SET `platform` = TRIM(`platform`);

UPDATE `rawUsage` SET `doi` = TRIM(`doi`);

UPDATE `rawUsage` SET `identifier` = TRIM(`identifier`);

UPDATE `rawUsage` SET `issn` = TRIM(`issn`);

UPDATE `rawUsage` SET `eIssn` = TRIM(`eIssn`);

UPDATE `rawUsage` SET `reportingPeriodTotal` = TRIM(`reportingPeriodTotal`);

UPDATE `rawUsage` SET `reportingPeriodHtml` = TRIM(`reportingPeriodHtml`);

UPDATE `rawUsage` SET `reportingPeriodPdf` = TRIM(`reportingPeriodPdf`);

UPDATE `rawUsage` SET `jan` = TRIM(`jan`);

UPDATE `rawUsage` SET `feb` = TRIM(`feb`);

UPDATE `rawUsage` SET `mar` = TRIM(`mar`);

UPDATE `rawUsage` SET `apr` = TRIM(`apr`);

UPDATE `rawUsage` SET `may` = TRIM(`may`);

UPDATE `rawUsage` SET `jun` = TRIM(`jun`);

UPDATE `rawUsage` SET `jul` = TRIM(`jul`);

UPDATE `rawUsage` SET `aug` = TRIM(`aug`);

UPDATE `rawUsage` SET `sep` = TRIM(`sep`);

UPDATE `rawUsage` SET `oct` = TRIM(`oct`);

UPDATE `rawUsage` SET `nov` = TRIM(`nov`);

UPDATE `rawUsage` SET `dec` = TRIM(`dec`);

UPDATE `rawUsage` SET `year` = TRIM(`year`);

-- Clean up empty values in `rawSnip`
UPDATE `rawUsage` SET `title` = NULL WHERE `title` LIKE '';

UPDATE `rawUsage` SET `publisher` = NULL WHERE `publisher` LIKE '';

UPDATE `rawUsage` SET `platform` = NULL WHERE `platform` LIKE '';

UPDATE `rawUsage` SET `doi` = NULL WHERE `doi` LIKE '';

UPDATE `rawUsage` SET `identifier` = NULL WHERE `identifier` LIKE '';

UPDATE `rawUsage` SET `issn` = NULL WHERE `issn` LIKE '';

UPDATE `rawUsage` SET `eIssn` = NULL WHERE `eIssn` LIKE '';

UPDATE `rawUsage` SET `reportingPeriodTotal` = NULL WHERE `reportingPeriodTotal` LIKE '';

UPDATE `rawUsage` SET `reportingPeriodHtml` = NULL WHERE `reportingPeriodHtml` LIKE '';

UPDATE `rawUsage` SET `reportingPeriodPdf` = NULL WHERE `reportingPeriodPdf` LIKE '';

UPDATE `rawUsage` SET `jan` = NULL WHERE `jan` LIKE '';

UPDATE `rawUsage` SET `feb` = NULL WHERE `feb` LIKE '';

UPDATE `rawUsage` SET `mar` = NULL WHERE `mar` LIKE '';

UPDATE `rawUsage` SET `apr` = NULL WHERE `apr` LIKE '';

UPDATE `rawUsage` SET `may` = NULL WHERE `may` LIKE '';

UPDATE `rawUsage` SET `jun` = NULL WHERE `jun` LIKE '';

UPDATE `rawUsage` SET `jul` = NULL WHERE `jul` LIKE '';

UPDATE `rawUsage` SET `aug` = NULL WHERE `aug` LIKE '';

UPDATE `rawUsage` SET `sep` = NULL WHERE `sep` LIKE '';

UPDATE `rawUsage` SET `oct` = NULL WHERE `oct` LIKE '';

UPDATE `rawUsage` SET `nov` = NULL WHERE `nov` LIKE '';

UPDATE `rawUsage` SET `dec` = NULL WHERE `dec` LIKE '';

UPDATE `rawUsage` SET `year` = NULL WHERE `year` LIKE '';

-- Clean up ISSNs and eISSNs
UPDATE `rawUsage` SET `issn` = UPPER(REPLACE(`issn`, '-', ''));

UPDATE `rawUsage` SET `issn` = LPAD(`issn`, 8, '0');

UPDATE `rawUsage` SET `eIssn` = UPPER(REPLACE(`eIssn`, '-', ''));

UPDATE `rawUsage` SET `eIssn` = LPAD(`eIssn`, 8, '0');

ALTER TABLE `rawUsage` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;

ALTER TABLE `rawUsage` CHANGE `eIssn` `eIssn` VARCHAR(8) NULL DEFAULT NULL;

-- Clean up publisher data
UPDATE `rawUsage` SET `publisher` = (REPLACE(`publisher`, 'Unspecified', ''));

UPDATE `rawUsage` SET `publisher` = NULL WHERE `publisher` LIKE '';

-- Trim white space from cells
UPDATE `rawWorkflows` SET `account` = TRIM(`account`);

UPDATE `rawWorkflows` SET `subAccount` = TRIM(`subAccount`);

UPDATE `rawWorkflows` SET `title` = TRIM(`title`);

UPDATE `rawWorkflows` SET `year` = TRIM(`year`);

UPDATE `rawWorkflows` SET `price` = TRIM(`price`);

UPDATE `rawWorkflows` SET `orderNumber` = TRIM(`orderNumber`);

UPDATE `rawWorkflows` SET `titleControl` = TRIM(`titleControl`);

UPDATE `rawWorkflows` SET `extra` = TRIM(`extra`);

UPDATE `rawWorkflows` SET `issn` = TRIM(`issn`);

UPDATE `rawWorkflows` SET `callNumber` = TRIM(`callNumber`);

UPDATE `rawWorkflows` SET `notes` = TRIM(`notes`);

-- Clean up empty values
UPDATE `rawWorkflows` SET `account` = NULL WHERE `account` LIKE '';

UPDATE `rawWorkflows` SET `subAccount` = NULL WHERE `subAccount` LIKE '';

UPDATE `rawWorkflows` SET `title` = NULL WHERE `title` LIKE '';

UPDATE `rawWorkflows` SET `year` = NULL WHERE `year` LIKE '';

UPDATE `rawWorkflows` SET `price` = NULL WHERE `price` LIKE '';

UPDATE `rawWorkflows` SET `orderNumber` = NULL WHERE `orderNumber` LIKE '';

UPDATE `rawWorkflows` SET `titleControl` = NULL WHERE `titleControl` LIKE '';

UPDATE `rawWorkflows` SET `extra` = NULL WHERE `extra` LIKE '';

UPDATE `rawWorkflows` SET `issn` = NULL WHERE `issn` LIKE '';

UPDATE `rawWorkflows` SET `callNumber` = NULL WHERE `callNumber` LIKE '';

UPDATE `rawWorkflows` SET `notes` = NULL WHERE `notes` LIKE '';

-- Remove hyphens and zero-pad ISSNs and make sure all `X` check digits are capitalized
UPDATE `rawWorkflows` SET `issn` = UPPER(REPLACE(`issn`, '-', ''));

UPDATE `rawWorkflows` SET `issn` = LPAD(`issn`, 8, '0');

ALTER TABLE `rawWorkflows` CHANGE `issn` `issn` VARCHAR(8) NULL DEFAULT NULL;

-- Clean up price data so that we can make the `price` field of type `DECIMAL`
UPDATE `rawWorkflows` SET `price` = (REPLACE(`price`, '$', ''));

UPDATE `rawWorkflows` SET `price` = (REPLACE(`price`, ',', ''));

UPDATE `rawWorkflows` SET `price` = (REPLACE(`price`, '(', '-'));

UPDATE `rawWorkflows` SET `price` = (REPLACE(`price`, ')', ''));

ALTER TABLE `rawWorkflows` CHANGE `price` `price` DECIMAL(10,2)  NULL  DEFAULT NULL;
