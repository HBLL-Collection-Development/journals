-- About 3–4 minutes to run

--
-- ****** `rawScimago` ******
--

-- Trim white space from `rawScimago`
UPDATE `rawScimago` SET `rank` = NULLIF(TRIM(`rank`), '');
UPDATE `rawScimago` SET `title` = NULLIF(TRIM(`title`), '');
UPDATE `rawScimago` SET `type` = NULLIF(TRIM(`type`), '');
UPDATE `rawScimago` SET `issn` = NULLIF(TRIM(`issn`), '');
UPDATE `rawScimago` SET `sjr` = NULLIF(TRIM(`sjr`), '');
UPDATE `rawScimago` SET `sjrBestQuartile` = NULLIF(TRIM(`sjrBestQuartile`), '');
UPDATE `rawScimago` SET `hIndex` = NULLIF(TRIM(`hIndex`), '');
UPDATE `rawScimago` SET `totalDocs2015` = NULLIF(TRIM(`totalDocs2015`), '');
UPDATE `rawScimago` SET `totalDocs3Years` = NULLIF(TRIM(`totalDocs3Years`), '');
UPDATE `rawScimago` SET `totalRefs` = NULLIF(TRIM(`totalRefs`), '');
UPDATE `rawScimago` SET `totalCites3Years` = NULLIF(TRIM(`totalCites3Years`), '');
UPDATE `rawScimago` SET `citableDocs3Years` = NULLIF(TRIM(`citableDocs3Years`), '');
UPDATE `rawScimago` SET `citesPerDoc2Years` = NULLIF(TRIM(`citesPerDoc2Years`), '');
UPDATE `rawScimago` SET `refsPerDoc` = NULLIF(TRIM(`refsPerDoc`), '');
UPDATE `rawScimago` SET `country` = NULLIF(TRIM(`country`), '');
-- Clean up ISSN field in `rawScimago`
UPDATE `rawScimago` SET `issn` = (REPLACE(`issn`, '-', ''));
UPDATE `rawScimago` SET `issn` = (REPLACE(`issn`, 'ISSN', ''));
UPDATE `rawScimago` SET `issn` = (REPLACE(`issn`, ' ', ''));
UPDATE `rawScimago` SET `issn` = UPPER(REPLACE(`issn`, ',', '|'));

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

--
-- ****** `rawSfx` ******
--

-- Trim white space from cells from `rawSfx`
UPDATE `rawSfx` SET `sortableTitle` = NULLIF(TRIM(`sortableTitle`), '');
UPDATE `rawSfx` SET `title` = NULLIF(TRIM(`title`), '');
UPDATE `rawSfx` SET `titleNonFilingCharacter` = NULLIF(TRIM(`titleNonFilingCharacter`), '');
UPDATE `rawSfx` SET `issn` = NULLIF(TRIM(`issn`), '');
UPDATE `rawSfx` SET `objectId` = NULLIF(TRIM(`objectId`), '');
UPDATE `rawSfx` SET `targetPublicName` = NULLIF(TRIM(`targetPublicName`), '');
UPDATE `rawSfx` SET `threshold` = NULLIF(TRIM(`threshold`), '');
UPDATE `rawSfx` SET `eIssn` = NULLIF(TRIM(`eIssn`), '');
UPDATE `rawSfx` SET `abbreviatedTitle` = NULLIF(TRIM(`abbreviatedTitle`), '');
UPDATE `rawSfx` SET `targetServiceType` = NULLIF(TRIM(`targetServiceType`), '');
UPDATE `rawSfx` SET `lccn` = NULLIF(TRIM(`lccn`), '');
UPDATE `rawSfx` SET `objectPortfolioId` = NULLIF(TRIM(`objectPortfolioId`), '');
UPDATE `rawSfx` SET `856u` = NULLIF(TRIM(`856u`), '');
UPDATE `rawSfx` SET `856y` = NULLIF(TRIM(`856y`), '');
UPDATE `rawSfx` SET `856a` = NULLIF(TRIM(`856a`), '');
UPDATE `rawSfx` SET `245h` = NULLIF(TRIM(`245h`), '');
UPDATE `rawSfx` SET `localThreshold` = NULLIF(TRIM(`localThreshold`), '');
UPDATE `rawSfx` SET `globalThreshold` = NULLIF(TRIM(`globalThreshold`), '');
UPDATE `rawSfx` SET `targetId` = NULLIF(TRIM(`targetId`), '');
UPDATE `rawSfx` SET `targetServiceId` = NULLIF(TRIM(`targetServiceId`), '');
UPDATE `rawSfx` SET `objectPortfolioId2` = NULLIF(TRIM(`objectPortfolioId2`), '');
UPDATE `rawSfx` SET `categories` = NULLIF(TRIM(`categories`), '');
UPDATE `rawSfx` SET `localAttribute` = NULLIF(TRIM(`localAttribute`), '');
UPDATE `rawSfx` SET `isbn` = NULLIF(TRIM(`isbn`), '');
UPDATE `rawSfx` SET `eIsbn` = NULLIF(TRIM(`eIsbn`), '');
UPDATE `rawSfx` SET `publisher` = NULLIF(TRIM(`publisher`), '');
UPDATE `rawSfx` SET `publicationLocation` = NULLIF(TRIM(`publicationLocation`), '');
UPDATE `rawSfx` SET `publicationDate` = NULLIF(TRIM(`publicationDate`), '');
UPDATE `rawSfx` SET `objectType` = NULLIF(TRIM(`objectType`), '');
UPDATE `rawSfx` SET `activationStatus` = NULLIF(TRIM(`activationStatus`), '');
UPDATE `rawSfx` SET `instituteId` = NULLIF(TRIM(`instituteId`), '');
UPDATE `rawSfx` SET `instituteName` = NULLIF(TRIM(`instituteName`), '');
UPDATE `rawSfx` SET `instituteAvailability` = NULLIF(TRIM(`instituteAvailability`), '');
UPDATE `rawSfx` SET `language` = NULLIF(TRIM(`language`), '');
UPDATE `rawSfx` SET `mainTitleCjk` = NULLIF(TRIM(`mainTitleCjk`), '');
UPDATE `rawSfx` SET `fullOriginalTitleCjk` = NULLIF(TRIM(`fullOriginalTitleCjk`), '');
UPDATE `rawSfx` SET `additionalIsbns` = NULLIF(TRIM(`additionalIsbns`), '');
UPDATE `rawSfx` SET `additionalEIsbns` = NULLIF(TRIM(`additionalEIsbns`), '');
UPDATE `rawSfx` SET `author` = NULLIF(TRIM(`author`), '');
UPDATE `rawSfx` SET `owner` = NULLIF(TRIM(`owner`), '');
UPDATE `rawSfx` SET `thresholdLocal` = NULLIF(TRIM(`thresholdLocal`), '');
UPDATE `rawSfx` SET `parseParam` = NULLIF(TRIM(`parseParam`), '');
UPDATE `rawSfx` SET `isFree` = NULLIF(TRIM(`isFree`), '');
-- Replace weird delimiters with pipe delimiters from `rawSfx`
UPDATE `rawSfx` SET `lccn` = (REPLACE(`lccn`, ' ', ''));
UPDATE `rawSfx` SET `lccn` = (REPLACE(`lccn`, ',', '|'));
UPDATE `rawSfx` SET `abbreviatedTitle` = (REPLACE(`abbreviatedTitle`, '/%/', '|'));
UPDATE `rawSfx` SET `categories` = (REPLACE(`categories`, ' | ', '|'));
-- Remove hyphens from ISSNs and eISSNs and make sure all `X` check digits are capitalized in `rawSfx`
UPDATE `rawSfx` SET `issn` = UPPER(REPLACE(`issn`, '-', ''));
UPDATE `rawSfx` SET `eIssn` = UPPER(REPLACE(`eIssn`, '-', ''));
UPDATE `rawSfx` SET `issn` = LPAD(`issn`, 8, '0');
UPDATE `rawSfx` SET `eIssn` = LPAD(`eIssn`, 8, '0');
-- Remove hyphens from LCCN in `rawSfx`
UPDATE `rawSfx` SET `lccn` = REPLACE(`lccn`, '-', '');
-- Clean up publication data for consistency in `rawSfx`
UPDATE `rawSfx` SET `publicationLocation` = (REPLACE(`publicationLocation`, '[', ''));
UPDATE `rawSfx` SET `publicationLocation` = (REPLACE(`publicationLocation`, ']', ''));
UPDATE `rawSfx` SET `publisher` = (REPLACE(`publisher`, '[', ''));
UPDATE `rawSfx` SET `publisher` = (REPLACE(`publisher`, ']', ''));
UPDATE `rawSfx` SET `publisher` = (REPLACE(`publisher`, ' :', ''));

--
-- ****** `rawSnip` ******
--

-- Trim white space from cells from `rawSnip`
UPDATE `rawSnip` SET `sourceRecordId` = NULLIF(TRIM(`sourceRecordId`), '');
UPDATE `rawSnip` SET `sourceTitle` = NULLIF(TRIM(`sourceTitle`), '');
UPDATE `rawSnip` SET `issn` = NULLIF(TRIM(`issn`), '');
UPDATE `rawSnip` SET `eIssn` = NULLIF(TRIM(`eIssn`), '');
UPDATE `rawSnip` SET `publisher` = NULLIF(TRIM(`publisher`), '');
UPDATE `rawSnip` SET `publisherImprints` = NULLIF(TRIM(`publisherImprints`), '');
UPDATE `rawSnip` SET `publicationLocation` = NULLIF(TRIM(`publicationLocation`), '');
UPDATE `rawSnip` SET `snip1999` = NULLIF(TRIM(`snip1999`), '');
UPDATE `rawSnip` SET `ipp1999` = NULLIF(TRIM(`ipp1999`), '');
UPDATE `rawSnip` SET `sjr1999` = NULLIF(TRIM(`sjr1999`), '');
UPDATE `rawSnip` SET `snip2000` = NULLIF(TRIM(`snip2000`), '');
UPDATE `rawSnip` SET `ipp2000` = NULLIF(TRIM(`ipp2000`), '');
UPDATE `rawSnip` SET `sjr2000` = NULLIF(TRIM(`sjr2000`), '');
UPDATE `rawSnip` SET `snip2001` = NULLIF(TRIM(`snip2001`), '');
UPDATE `rawSnip` SET `ipp2001` = NULLIF(TRIM(`ipp2001`), '');
UPDATE `rawSnip` SET `sjr2001` = NULLIF(TRIM(`sjr2001`), '');
UPDATE `rawSnip` SET `snip2002` = NULLIF(TRIM(`snip2002`), '');
UPDATE `rawSnip` SET `ipp2002` = NULLIF(TRIM(`ipp2002`), '');
UPDATE `rawSnip` SET `sjr2002` = NULLIF(TRIM(`sjr2002`), '');
UPDATE `rawSnip` SET `snip2003` = NULLIF(TRIM(`snip2003`), '');
UPDATE `rawSnip` SET `ipp2003` = NULLIF(TRIM(`ipp2003`), '');
UPDATE `rawSnip` SET `sjr2003` = NULLIF(TRIM(`sjr2003`), '');
UPDATE `rawSnip` SET `snip2004` = NULLIF(TRIM(`snip2004`), '');
UPDATE `rawSnip` SET `ipp2004` = NULLIF(TRIM(`ipp2004`), '');
UPDATE `rawSnip` SET `sjr2004` = NULLIF(TRIM(`sjr2004`), '');
UPDATE `rawSnip` SET `snip2005` = NULLIF(TRIM(`snip2005`), '');
UPDATE `rawSnip` SET `ipp2005` = NULLIF(TRIM(`ipp2005`), '');
UPDATE `rawSnip` SET `sjr2005` = NULLIF(TRIM(`sjr2005`), '');
UPDATE `rawSnip` SET `snip2006` = NULLIF(TRIM(`snip2006`), '');
UPDATE `rawSnip` SET `ipp2006` = NULLIF(TRIM(`ipp2006`), '');
UPDATE `rawSnip` SET `sjr2006` = NULLIF(TRIM(`sjr2006`), '');
UPDATE `rawSnip` SET `snip2007` = NULLIF(TRIM(`snip2007`), '');
UPDATE `rawSnip` SET `ipp2007` = NULLIF(TRIM(`ipp2007`), '');
UPDATE `rawSnip` SET `sjr2007` = NULLIF(TRIM(`sjr2007`), '');
UPDATE `rawSnip` SET `snip2008` = NULLIF(TRIM(`snip2008`), '');
UPDATE `rawSnip` SET `ipp2008` = NULLIF(TRIM(`ipp2008`), '');
UPDATE `rawSnip` SET `sjr2008` = NULLIF(TRIM(`sjr2008`), '');
UPDATE `rawSnip` SET `snip2009` = NULLIF(TRIM(`snip2009`), '');
UPDATE `rawSnip` SET `ipp2009` = NULLIF(TRIM(`ipp2009`), '');
UPDATE `rawSnip` SET `sjr2009` = NULLIF(TRIM(`sjr2009`), '');
UPDATE `rawSnip` SET `snip2010` = NULLIF(TRIM(`snip2010`), '');
UPDATE `rawSnip` SET `ipp2010` = NULLIF(TRIM(`ipp2010`), '');
UPDATE `rawSnip` SET `sjr2010` = NULLIF(TRIM(`sjr2010`), '');
UPDATE `rawSnip` SET `snip2011` = NULLIF(TRIM(`snip2011`), '');
UPDATE `rawSnip` SET `ipp2011` = NULLIF(TRIM(`ipp2011`), '');
UPDATE `rawSnip` SET `sjr2011` = NULLIF(TRIM(`sjr2011`), '');
UPDATE `rawSnip` SET `snip2012` = NULLIF(TRIM(`snip2012`), '');
UPDATE `rawSnip` SET `ipp2012` = NULLIF(TRIM(`ipp2012`), '');
UPDATE `rawSnip` SET `sjr2012` = NULLIF(TRIM(`sjr2012`), '');
UPDATE `rawSnip` SET `snip2013` = NULLIF(TRIM(`snip2013`), '');
UPDATE `rawSnip` SET `ipp2013` = NULLIF(TRIM(`ipp2013`), '');
UPDATE `rawSnip` SET `sjr2013` = NULLIF(TRIM(`sjr2013`), '');
UPDATE `rawSnip` SET `snip2014` = NULLIF(TRIM(`snip2014`), '');
UPDATE `rawSnip` SET `ipp2014` = NULLIF(TRIM(`ipp2014`), '');
UPDATE `rawSnip` SET `sjr2014` = NULLIF(TRIM(`sjr2014`), '');
UPDATE `rawSnip` SET `snip2015` = NULLIF(TRIM(`snip2015`), '');
UPDATE `rawSnip` SET `ipp2015` = NULLIF(TRIM(`ipp2015`), '');
UPDATE `rawSnip` SET `sjr2015` = NULLIF(TRIM(`sjr2015`), '');
UPDATE `rawSnip` SET `topLevelLifeSciences` = NULLIF(TRIM(`topLevelLifeSciences`), '');
UPDATE `rawSnip` SET `topLevelSocialSciences` = NULLIF(TRIM(`topLevelSocialSciences`), '');
UPDATE `rawSnip` SET `topLevelPhysicalSciences` = NULLIF(TRIM(`topLevelPhysicalSciences`), '');
UPDATE `rawSnip` SET `topLevelHealthSciences` = NULLIF(TRIM(`topLevelHealthSciences`), '');
UPDATE `rawSnip` SET `general` = NULLIF(TRIM(`general`), '');
UPDATE `rawSnip` SET `agriculturalBiologicalSciences` = NULLIF(TRIM(`agriculturalBiologicalSciences`), '');
UPDATE `rawSnip` SET `artsHumanities` = NULLIF(TRIM(`artsHumanities`), '');
UPDATE `rawSnip` SET `biochemistryGeneticsMolecularBiology` = NULLIF(TRIM(`biochemistryGeneticsMolecularBiology`), '');
UPDATE `rawSnip` SET `businessManagementAccounting` = NULLIF(TRIM(`businessManagementAccounting`), '');
UPDATE `rawSnip` SET `chemicalEngineering` = NULLIF(TRIM(`chemicalEngineering`), '');
UPDATE `rawSnip` SET `chemistry` = NULLIF(TRIM(`chemistry`), '');
UPDATE `rawSnip` SET `computerScience` = NULLIF(TRIM(`computerScience`), '');
UPDATE `rawSnip` SET `decisionSciences` = NULLIF(TRIM(`decisionSciences`), '');
UPDATE `rawSnip` SET `earthPlanetarySciences` = NULLIF(TRIM(`earthPlanetarySciences`), '');
UPDATE `rawSnip` SET `economicsEconometricsFinance` = NULLIF(TRIM(`economicsEconometricsFinance`), '');
UPDATE `rawSnip` SET `energy` = NULLIF(TRIM(`energy`), '');
UPDATE `rawSnip` SET `engineering` = NULLIF(TRIM(`engineering`), '');
UPDATE `rawSnip` SET `environmentalScience` = NULLIF(TRIM(`environmentalScience`), '');
UPDATE `rawSnip` SET `immunologyMicrobiology` = NULLIF(TRIM(`immunologyMicrobiology`), '');
UPDATE `rawSnip` SET `materialsScience` = NULLIF(TRIM(`materialsScience`), '');
UPDATE `rawSnip` SET `mathematics` = NULLIF(TRIM(`mathematics`), '');
UPDATE `rawSnip` SET `medicine` = NULLIF(TRIM(`medicine`), '');
UPDATE `rawSnip` SET `neuroscience` = NULLIF(TRIM(`neuroscience`), '');
UPDATE `rawSnip` SET `nursing` = NULLIF(TRIM(`nursing`), '');
UPDATE `rawSnip` SET `pharmacologyToxicologyPharmaceutics` = NULLIF(TRIM(`pharmacologyToxicologyPharmaceutics`), '');
UPDATE `rawSnip` SET `physicsAstronomy` = NULLIF(TRIM(`physicsAstronomy`), '');
UPDATE `rawSnip` SET `psychology` = NULLIF(TRIM(`psychology`), '');
UPDATE `rawSnip` SET `socialSciences` = NULLIF(TRIM(`socialSciences`), '');
UPDATE `rawSnip` SET `veterinary` = NULLIF(TRIM(`veterinary`), '');
UPDATE `rawSnip` SET `dentistry` = NULLIF(TRIM(`dentistry`), '');
UPDATE `rawSnip` SET `healthProfessions` = NULLIF(TRIM(`healthProfessions`), '');
UPDATE `rawSnip` SET `asjc` = NULLIF(TRIM(`asjc`), '');
-- Clean up ASJC codes in `rawSnip`
UPDATE `rawSnip` SET `asjc` = TRIM(TRAILING "\r" FROM `asjc`); -- Remove trailing line breaks
UPDATE `rawSnip` SET `asjc` = (REPLACE(`asjc`, ' ', ''));
UPDATE `rawSnip` SET `asjc` = (REPLACE(`asjc`, ';', '|'));
-- Clean up ISSNs in `rawSnip`
UPDATE `rawSnip` SET `issn` = (REPLACE(`issn`, '-', ''));
UPDATE `rawSnip` SET `issn` = UPPER(`issn`);
UPDATE `rawSnip` SET `issn` = LPAD(`issn`, 8, '0');
UPDATE `rawSnip` SET `eIssn` = (REPLACE(`eIssn`, '-', ''));
UPDATE `rawSnip` SET `eIssn` = UPPER(`eIssn`);
UPDATE `rawSnip` SET `eIssn` = LPAD(`eIssn`, 8, '0');

--
-- ****** `rawUsage` ******
--

-- Trim white space from cells from `rawUsage`
UPDATE `rawUsage` SET `title` = NULLIF(TRIM(`title`), '');
UPDATE `rawUsage` SET `publisher` = NULLIF(TRIM(`publisher`), '');
UPDATE `rawUsage` SET `platform` = NULLIF(TRIM(`platform`), '');
UPDATE `rawUsage` SET `doi` = NULLIF(TRIM(`doi`), '');
UPDATE `rawUsage` SET `identifier` = NULLIF(TRIM(`identifier`), '');
UPDATE `rawUsage` SET `issn` = NULLIF(TRIM(`issn`), '');
UPDATE `rawUsage` SET `eIssn` = NULLIF(TRIM(`eIssn`), '');
UPDATE `rawUsage` SET `reportingPeriodTotal` = NULLIF(TRIM(`reportingPeriodTotal`), '');
UPDATE `rawUsage` SET `reportingPeriodHtml` = NULLIF(TRIM(`reportingPeriodHtml`), '');
UPDATE `rawUsage` SET `reportingPeriodPdf` = NULLIF(TRIM(`reportingPeriodPdf`), '');
UPDATE `rawUsage` SET `jan` = NULLIF(TRIM(`jan`), '');
UPDATE `rawUsage` SET `feb` = NULLIF(TRIM(`feb`), '');
UPDATE `rawUsage` SET `mar` = NULLIF(TRIM(`mar`), '');
UPDATE `rawUsage` SET `apr` = NULLIF(TRIM(`apr`), '');
UPDATE `rawUsage` SET `may` = NULLIF(TRIM(`may`), '');
UPDATE `rawUsage` SET `jun` = NULLIF(TRIM(`jun`), '');
UPDATE `rawUsage` SET `jul` = NULLIF(TRIM(`jul`), '');
UPDATE `rawUsage` SET `aug` = NULLIF(TRIM(`aug`), '');
UPDATE `rawUsage` SET `sep` = NULLIF(TRIM(`sep`), '');
UPDATE `rawUsage` SET `oct` = NULLIF(TRIM(`oct`), '');
UPDATE `rawUsage` SET `nov` = NULLIF(TRIM(`nov`), '');
UPDATE `rawUsage` SET `dec` = NULLIF(TRIM(`dec`), '');
UPDATE `rawUsage` SET `year` = NULLIF(TRIM(`year`), '');
-- Clean up ISSNs and eISSNs in `rawUsage`
UPDATE `rawUsage` SET `issn` = UPPER(REPLACE(`issn`, '-', ''));
UPDATE `rawUsage` SET `issn` = LPAD(`issn`, 8, '0');
UPDATE `rawUsage` SET `eIssn` = UPPER(REPLACE(`eIssn`, '-', ''));
UPDATE `rawUsage` SET `eIssn` = LPAD(`eIssn`, 8, '0');
-- Clean up publisher data in `rawUsage`
UPDATE `rawUsage` SET `publisher` = (REPLACE(`publisher`, 'Unspecified', ''));
UPDATE `rawUsage` SET `publisher` = NULL WHERE `publisher` LIKE '';

--
-- ****** `rawWorkflows` ******
--

-- Trim white space from cells in `rawWorkflows`
UPDATE `rawWorkflows` SET `account` = NULLIF(TRIM(`account`), '');
UPDATE `rawWorkflows` SET `subAccount` = NULLIF(TRIM(`subAccount`), '');
UPDATE `rawWorkflows` SET `title` = NULLIF(TRIM(`title`), '');
UPDATE `rawWorkflows` SET `year` = NULLIF(TRIM(`year`), '');
UPDATE `rawWorkflows` SET `price` = NULLIF(TRIM(`price`), '');
UPDATE `rawWorkflows` SET `orderNumber` = NULLIF(TRIM(`orderNumber`), '');
UPDATE `rawWorkflows` SET `titleControl` = NULLIF(TRIM(`titleControl`), '');
UPDATE `rawWorkflows` SET `extra` = NULLIF(TRIM(`extra`), '');
UPDATE `rawWorkflows` SET `issn` = NULLIF(TRIM(`issn`), '');
UPDATE `rawWorkflows` SET `callNumber` = NULLIF(TRIM(`callNumber`), '');
UPDATE `rawWorkflows` SET `notes` = NULLIF(TRIM(`notes`), '');
-- Remove hyphens and zero-pad ISSNs and make sure all `X` check digits are capitalized in `rawWorkflows`
UPDATE `rawWorkflows` SET `issn` = UPPER(REPLACE(`issn`, '-', ''));
UPDATE `rawWorkflows` SET `issn` = LPAD(`issn`, 8, '0');
-- Clean up price data so that we can make the `price` field of type `decimal` in `rawWorkflows`
UPDATE `rawWorkflows` SET `price` = (REPLACE(`price`, '$', ''));
UPDATE `rawWorkflows` SET `price` = (REPLACE(`price`, ',', ''));
UPDATE `rawWorkflows` SET `price` = (REPLACE(`price`, '(', '-'));
UPDATE `rawWorkflows` SET `price` = (REPLACE(`price`, ')', ''));

-- Convert fields to appropriate type after data is cleaned
ALTER TABLE `rawScimago` CHANGE `rank` `rank` int(11) DEFAULT NULL;
ALTER TABLE `rawScimago` CHANGE `sjr` `sjr` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawScimago` CHANGE `hIndex` `hIndex` int(11) DEFAULT NULL;
ALTER TABLE `rawScimago` CHANGE `totalDocs2015` `totalDocs2015` int(11) DEFAULT NULL;
ALTER TABLE `rawScimago` CHANGE `totalDocs3Years` `totalDocs3Years` int(11) DEFAULT NULL;
ALTER TABLE `rawScimago` CHANGE `totalRefs` `totalRefs` int(11) DEFAULT NULL;
ALTER TABLE `rawScimago` CHANGE `totalCites3Years` `totalCites3Years` int(11) DEFAULT NULL;
ALTER TABLE `rawScimago` CHANGE `citableDocs3Years` `citableDocs3Years` int(11) DEFAULT NULL;
ALTER TABLE `rawScimago` CHANGE `citesPerDoc2Years` `citesPerDoc2Years` decimal(10,2) DEFAULT NULL;
ALTER TABLE `rawScimago` CHANGE `refsPerDoc` `refsPerDoc` decimal(10,2) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `sourceRecordId` `sourceRecordId` bigint(11) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `issn` `issn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `eIssn` `eIssn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `snip2013` `snip2013` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `ipp2013` `ipp2013` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `sjr2013` `sjr2013` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `snip2014` `snip2014` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `ipp2014` `ipp2014` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `sjr2014` `sjr2014` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `snip2015` `snip2015` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `ipp2015` `ipp2015` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawScopusSources` CHANGE `sjr2015` `sjr2015` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `titleNonFilingCharacter` `titleNonFilingCharacter` int(11) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `issn` `issn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `objectId` `objectId` bigint(30) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `eIssn` `eIssn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `abbreviatedTitle` `abbreviatedTitle` mediumtext;
ALTER TABLE `rawSfx` CHANGE `lccn` `lccn` varchar(10) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `objectPortfolioId` `objectPortfolioId` bigint(30) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `targetId` `targetId` bigint(11) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `targetServiceId` `targetServiceId` bigint(11) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `objectPortfolioId2` `objectPortfolioId2` bigint(30) DEFAULT NULL;
ALTER TABLE `rawSfx` CHANGE `categories` `categories` mediumtext;
ALTER TABLE `rawSnip` CHANGE `sourceRecordId` `sourceRecordId` bigint(11) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sourceTitle` `sourceTitle` varchar(255) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `issn` `issn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `eIssn` `eIssn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip1999` `snip1999` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp1999` `ipp1999` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr1999` `sjr1999` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2000` `snip2000` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2000` `ipp2000` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2000` `sjr2000` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2001` `snip2001` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2001` `ipp2001` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2001` `sjr2001` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2002` `snip2002` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2002` `ipp2002` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2002` `sjr2002` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2003` `snip2003` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2003` `ipp2003` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2003` `sjr2003` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2004` `snip2004` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2004` `ipp2004` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2004` `sjr2004` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2005` `snip2005` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2005` `ipp2005` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2005` `sjr2005` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2006` `snip2006` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2006` `ipp2006` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2006` `sjr2006` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2007` `snip2007` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2007` `ipp2007` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2007` `sjr2007` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2008` `snip2008` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2008` `ipp2008` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2008` `sjr2008` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2009` `snip2009` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2009` `ipp2009` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2009` `sjr2009` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2010` `snip2010` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2010` `ipp2010` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2010` `sjr2010` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2011` `snip2011` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2011` `ipp2011` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2011` `sjr2011` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2012` `snip2012` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2012` `ipp2012` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2012` `sjr2012` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2013` `snip2013` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2013` `ipp2013` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2013` `sjr2013` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2014` `snip2014` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2014` `ipp2014` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2014` `sjr2014` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `snip2015` `snip2015` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `ipp2015` `ipp2015` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawSnip` CHANGE `sjr2015` `sjr2015` decimal(10,3) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `issn` `issn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `eIssn` `eIssn` varchar(8) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `jan` `jan` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `feb` `feb` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `mar` `mar` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `apr` `apr` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `may` `may` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `jun` `jun` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `jul` `jul` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `aug` `aug` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `sep` `sep` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `oct` `oct` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `nov` `nov` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `dec` `dec` int(11) DEFAULT NULL;
ALTER TABLE `rawUsage` CHANGE `year` `year` year(4) DEFAULT NULL;
ALTER TABLE `rawWorkflows` CHANGE `account` `account` bigint(17) DEFAULT NULL;
ALTER TABLE `rawWorkflows` CHANGE `subAccount` `subAccount` int(5) DEFAULT NULL;
ALTER TABLE `rawWorkflows` CHANGE `year` `year` year(4) DEFAULT NULL;
ALTER TABLE `rawWorkflows` CHANGE `price` `price` decimal(10,2)  NULL  DEFAULT NULL;
ALTER TABLE `rawWorkflows` CHANGE `issn` `issn` varchar(8) DEFAULT NULL;
