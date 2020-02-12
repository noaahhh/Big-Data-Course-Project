Data = LOAD "project/csvoutput.csv" USING PigStorage('\t') AS 
(
year = int,
firstName = chararray,
count = int,  

);

inputDataGroupbyYear = GROUP Data BY year;
result = FOREACH inputDataGroupbyYear {
orered = ORDER Data BY count desc;
lim = LIM ordered 1;
GENERATE FLATTEN(lim);

}
STORE result into 'project/csvoutput3' using PigStorage('\t');
DUMP result;
