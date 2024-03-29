# Journals Overlap Database (ALPHA)

# Data Sources

## Required Data Tables

### 1. `rawScimago`: [Scimago Journal & Country Rank](http://www.scimagojr.com/journalrank.php?out=xls)

1. `rank`
2. `title`
3. `type`
4. `issn`
5. `sjr`
6. `sjrBestQuartile`
7. `hIndex`
8. `totalDocs2015`
9. `totalDocs3Years`
10. `totalRefs`
11. `totalCites3Years`
12. `citableDocs3Years`
13. `citesPerDoc2Years`
14. `refsPerDoc`
15. `country`

### 2. `rawSfx`: Two files

1. `sortableTitle`
2. `title`
3. `titleNonFilingCharacter`
4. `issn`
5. `objectId`
6. `targetPublicName`
7. `threshold`
8. `eIssn`
9. `abbreviatedTitle`
10. `targetServiceType`
11. `lccn`
12. `objectPortfolioId`
13. `856u`
14. `856y`
15. `856a`
16. `245h`
17. `localThreshold`
18. `globalThreshold`
19. `targetId`
20. `targetServiceId`
21. `objectPortfolioId2`
22. `categories`
23. `localAttribute`
24. `isbn`
25. `eIsbn`
26. `publisher`
27. `publicationLocation`
28. `publicationDate`
29. `objectType`
30. `activationStatus`
31. `instituteId`
32. `instituteName`
33. `instituteAvailability`
34. `language`
35. `mainTitleCjk`
36. `fullOriginalTitleCjk`
37. `additionalIsbns`
38. `additionalEIsbns`
39. `author`
40. `owner`
41. `thresholdLocal`
42. `parseParam`
43. `isFree`

### 3. `rawSnip`: [journalmetrics.com](https://www.journalmetrics.com/values.php)

1. `sourceRecordId`
2. `sourceTitle`
3. `issn`
4. `eIssn`
5. `publisher`
6. `publisherImprints`
7. `publicationLocation`
8. `snip1999`
9. `ipp1999`
10. `sjr1999`
11. `snip2000`
12. `ipp2000`
13. `sjr2000`
14. `snip2001`
15. `ipp2001`
16. `sjr2001`
17. `snip2002`
18. `ipp2002`
19. `sjr2002`
20. `snip2003`
21. `ipp2003`
22. `sjr2003`
23. `snip2004`
24. `ipp2004`
25. `sjr2004`
26. `snip2005`
27. `ipp2005`
28. `sjr2005`
29. `snip2006`
30. `ipp2006`
31. `sjr2006`
32. `snip2007`
33. `ipp2007`
34. `sjr2007`
35. `snip2008`
36. `ipp2008`
37. `sjr2008`
38. `snip2009`
39. `ipp2009`
40. `sjr2009`
41. `snip2010`
42. `ipp2010`
43. `sjr2010`
44. `snip2011`
45. `ipp2011`
46. `sjr2011`
47. `snip2012`
48. `ipp2012`
49. `sjr2012`
50. `snip2013`
51. `ipp2013`
52. `sjr2013`
53. `snip2014`
54. `ipp2014`
55. `sjr2014`
56. `snip2015`
57. `ipp2015`
58. `sjr2015`
59. `topLevelLifeSciences`
60. `topLevelSocialSciences`
61. `topLevelPhysicalSciences`
62. `topLevelHealthSciences`
63. `general`
64. `agriculturalBiologicalSciences`
65. `artsHumanities`
66. `biochemistryGeneticsMolecularBiology`
67. `businessManagementAccounting`
68. `chemicalEngineering`
69. `chemistry`
70. `computerScience`
71. `decisionSciences`
72. `earthPlanetarySciences`
73. `economicsEconometricsFinance`
74. `energy`
75. `engineering`
76. `environmentalScience`
77. `immunologyMicrobiology`
78. `materialsScience`
79. `mathematics`
80. `medicine`
81. `neuroscience`
82. `nursing`
83. `pharmacologyToxicologyPharmaceutics`
84. `physicsAstronomy`
85. `psychology`
86. `socialSciences`
87. `veterinary`
88. `dentistry`
89. `healthProfessions`
90. `asjc`

### 4. `rawUsage`

1. `title`
2. `publisher`
3. `platform`
4. `doi`
5. `identifier`
6. `issn`
7. `eIssn`
8. `reportingPeriodTotal`
9. `reportingPeriodHtml`
10. `reportingPeriodPdf`
11. `jan`
12. `feb`
13. `mar`
14. `apr`
15. `may`
16. `jun`
17. `jul`
18. `aug`
19. `sep`
20. `oct`
21. `nov`
22. `dec`
23. `year`

### 5. `rawWorkflows`: Report from Lee Richards

1. `account`
2. `subAccount`
3. `title`
4. `year`
5. `price`
6. `orderNumber`
7. `titleControl`
8. `extra`
9. `issn`
10. `callNumber`
11. `notes`

## Optional Data Tables

### 1. `rawAsjc`: [Scopus Sources](https://www.elsevier.com/solutions/scopus/content)

1. `description`
2. `code`

### 2. `rawConferenceProceedings`: [Scopus Sources](https://www.elsevier.com/solutions/scopus/content)

1. `sourceRecordId`
2. `sourceTitle`
3. `coverage`
4. `issn`
5. `addedNovember2015`
6. `snip2013`
7. `ipp2013`
8. `sjr2013`
9. `snip2014`
10. `ipp2014`
11. `sjr2014`
12. `snip2015`
13. `ipp2015`
14. `sjr2015`
15. `asjc`

### 3. `rawConferenceProceedingsBackfiles`: [Scopus Sources](https://www.elsevier.com/solutions/scopus/content)

1. `sourceRecordId`
2. `sourceTitle`
3. `coverage`
4. `issn`
5. `asjc`

### 4. `rawScopusSources`: [Scopus Sources](https://www.elsevier.com/solutions/scopus/content)

1. `sourceRecordId`
2. `sourceTitle`
3. `issn`
4. `eIssn`
5. `coverage`
6. `status`
7. `snip2013`
8. `ipp2013`
9. `sjr2013`
10. `snip2014`
11. `ipp2014`
12. `sjr2014`
13. `snip2015`
14. `ipp2015`
15. `sjr2015`
16. `medlineSourced`
17. `openAccess`
18. `articlesInPress`
19. `addedMay2016`
20. `sourceType`
21. `titleHistoryIndication`
22. `relatedTitle1`
23. `relatedTitle2`
24. `relatedTitle3`
25. `relatedTitle4`
26. `publisher`
27. `publisherImprints`
28. `publicationLocation`
29. `asjc`
30. `topLevelLifeSciences`
31. `topLevelSocialSciences`
32. `topLevelPhysicalSciences`
33. `topLevelHealthSciences`
34. `general`
35. `agriculturalBiologicalSciences`
36. `artsHumanities`
37. `biochemistryGeneticsMolecularBiology`
38. `businessManagementAccounting`
39. `chemicalEngineering`
40. `chemistry`
41. `computerScience`
42. `decisionSciences`
43. `earthPlanetarySciences`
44. `economicsEconometricsFinance`
45. `energy`
46. `engineering`
47. `environmentalScience`
48. `immunologyMicrobiology`
49. `materialsScience`
50. `mathematics`
51. `medicine`
52. `neuroscience`
53. `nursing`
54. `pharmacologyToxicologyPharmaceutics`
55. `physicsAstronomy`
56. `psychology`
57. `socialSciences`
58. `veterinary`
59. `dentistry`
60. `healthProfessions`

## Possible Future Data Sources

1. [journalindicators.com](http://www.journalindicators.com/methodology)
