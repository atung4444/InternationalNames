%Alan Tung Zack Hannah
%actung@ncsu.edu zdhannah@ncsu.edu
%4/19/21
%Section 205 / 204
%Project 3: International Names, Spring 2021
function middleName = pickMiddleName(allNames,ChosenFirst)
%for american names, selects a middle name by ensuring that it is different
%than the person's chosen first name
%different than the person's chosen first name
%allNames: Cell array
%Chosenfirst is a cell array the person's first/given name
%output: middleName is a char array chosen at random from allNames

middleName = getRandomName(allNames);

middleNameString = string(middleName);

middleNameLogic = contains(allNames,ChosenFirst);

usedMiddleName1 = allNames(middleNameLogic); 

usedMiddleNameString = string(usedMiddleName1);

x = 0 ; 

while x ~= 1
    if strcmp(middleNameString,usedMiddleNameString) == 1
    middleName = getrandomName(allNames);
    middleNameString = string(middleName);
    else
    x = x + 1;   
    end
end

