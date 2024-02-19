%Alan Tung Zack Hannah
%actung@ncsu.edu zdhannah@ncsu.edu
%4/19/21
%Section 205 / 204
%Project 3: International Names, Spring 2021
function randomName = getRandomName(allNames)

sizeNames = size(allNames);

sizeNames1 = sizeNames(1,1);

randomNumber = randi([1 sizeNames1],1,1);

randomName = allNames(randomNumber,1);