%Alan Tung Zack Hannah
%actung@ncsu.edu zdhannah@ncsu.edu
%4/19/21
%Section 205 / 204
%Project 3: International Names, Spring 2021

fprintf('----------------------------------------------------------\n')
fprintf('Welcome to the International Name Generator\n')
fprintf('----------------------------------------------------------\n')
% Ask user for input
validLetter = getValidLetter();

firstLetter = validLetter;

%Go through and read all the excel files for names
spanishGiven = readcell('SpanishGiven.xlsx'); 
spanishFamily = readcell('SpanishFamily.xlsx');
chineseGiven = readcell('ChineseGiven.xlsx');
chineseGiven1 = chineseGiven(:,1);
chineseFamily = readcell('ChineseFamily.xlsx');
chineseFamily1 = chineseFamily(:,2);
americanGirlNames = readcell('AmericanGirlNames.xlsx');
americanBoyNames = readcell('AmericanBoyNames.xlsx');
americanFamily = readcell('AmericanFamily.xlsx');
americanFamily1 = americanFamily(:,1);

%concat all the names 
allNames = [spanishGiven ; spanishFamily ; chineseGiven1 ; chineseFamily1 ;americanGirlNames ;americanBoyNames; americanFamily1];

%Use function to get all given names starting with the user input
namesForGivenSpanish = getNamesBeginningWith(spanishGiven,firstLetter);
namesForGivenChinese = getNamesBeginningWith(chineseGiven1,firstLetter);
namesForGivenAmericanGirl = getNamesBeginningWith(americanGirlNames,firstLetter);
namesForGivenAmericanBoy = getNamesBeginningWith(americanBoyNames,firstLetter);

%Combine american boys and girls
americanNames = [namesForGivenAmericanGirl;namesForGivenAmericanBoy];

%Concat all the first names to get a countof how many total names were
%generated
allGeneratedNames =[namesForGivenSpanish;namesForGivenChinese;americanNames];

%Check the size of each cell array to see if the columns are greater than 0
j = size(namesForGivenSpanish,1);
k = size(namesForGivenChinese,1);
l = size(americanNames,1);

%If the column size is greater than zero for the given names then generate
%family names randomly with getrandomname

if j > 0
for i=1:length(namesForGivenSpanish)
    randomFamilyNameSF = getRandomName(spanishFamily);
    randomFamilyTableSF(i) = {randomFamilyNameSF{:}};
    randomFamilyTableSF2 = randomFamilyTableSF';
end

for i=1:length(namesForGivenSpanish)
    randomFamilyNameSM = getRandomName(spanishFamily);
    randomFamilyTableSM(i) = {randomFamilyNameSM{:}};
    randomFamilyTableSM2 = randomFamilyTableSM';
end


for i=1:length(namesForGivenSpanish)
    tableSpanishDistinguish(i) = {'spanish'};
    tableSpanishDistinguish2 = tableSpanishDistinguish';
end
end

if  k > 0
for i=1:length(namesForGivenChinese)
    randomFamilyNameC = getRandomName(chineseFamily1);
    randomFamilyTableC(i) = {randomFamilyNameC{:}};
    randomFamilyTableC2 = randomFamilyTableC';
end

for i=1:length(namesForGivenChinese)
    tableChineseDistinguish(i) = {'chinese'};
    tableChineseDistinguish2 = tableChineseDistinguish';
end
end

if  l > 0
for i=1:length(americanNames)
    randomFamilyNameA = getRandomName(americanFamily1);
    randomFamilyTableA(i) = {randomFamilyNameA{:}};
    randomFamilyTableA2 = randomFamilyTableA';
end

%For american Names generate a middle name with function
for i=1:length(americanNames)
    middleName = pickMiddleName(allNames,americanNames);
    middleNameTable(i) = {middleName{:}};
    middleNameTable2 = middleNameTable';
end

for i=1:length(americanNames)
    tableAmericanDistinguish(i) = {'american'};
    tableAmericanDistinguish2 = tableAmericanDistinguish';
end
end

%use function construct name to make the the seperate cell arrays
for i=1:length(allGeneratedNames)
    if j > 0
   fullNamesS = constructName(tableSpanishDistinguish2(:,1), namesForGivenSpanish, randomFamilyTableSF2, randomFamilyTableSM2);
    end
    if l > 0
   fullNamesA = constructName(tableAmericanDistinguish2(:,1), americanNames, randomFamilyTableA2);
    end
    if k > 0
   fullNamesC = constructName(tableChineseDistinguish(:,1), namesForGivenChinese, randomFamilyTableC2);
    end
end



%Write each generated string array into a txt file and open it for viewing
spanishFile = 'spanish.txt';
fid = fopen(spanishFile,'w');
fprintf(fid,'Spanish Names Report \n **************************************** \n %d kids names beginning with %s \n',length(namesForGivenSpanish),firstLetter); 
if j > 0
    sF = string(fullNamesS);
    sF1 = splitlines(sF);
    fprintf(fid,'%s \n',sF1);
end
fclose(fid);
open(spanishFile)

chineseFile = 'chinese.txt';
fid1 = fopen(chineseFile,'w');
fprintf(fid1,'Chinese Names Report \n **************************************** \n %d kids names beginning with %s \n',length(namesForGivenChinese),firstLetter); 
if k > 0
    cF = string(fullNamesC);
    cF1 = splitlines(cF);
    fprintf(fid1,'%s \n',cF1);
end
fclose(fid1);
open(chineseFile)

americanFile = 'american.txt';
fid2 = fopen(americanFile,'w');
fprintf(fid1,'American Names Report \n **************************************** \n %d kids names beginning with %s \n',length(americanNames),firstLetter); 
if l > 0
    aF = string(fullNamesA);
    aF1 = splitlines(aF);
    fprintf(fid2,'%s \n',aF1);
end
fclose(fid2);
open(americanFile)

fprintf('Spanish Report: %s \n Generated %d names.\n',spanishFile,j);
fprintf('Chinese Report: %s\n Generated %d names.\n',chineseFile,k);
fprintf('American Report: %s\n Generated %d names.\n',americanFile,l);

%after code runs clear clc using next section to try another letter
%%
clear;clc