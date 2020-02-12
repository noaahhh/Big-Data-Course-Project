Data = LOAD "project/Popular_Baby_Names.csv" USING PigStorage(',') AS 
(
year = int,
gender = chararray,
ethnicity = chararray,
firstName = chararray,
count = int,  
rank =  int
);

inputDataGroupbyYear = GROUP Data BY (year,firstName);
result = FOREACH inputDataGroupbyYear GENERATE FLATTEN(group) AS (year,firstName), SUM(Data.count) AS SUM_COUNT;
STORE result into 'project/csvoutput' using PigStorage('\t'!);

DUMP result;
