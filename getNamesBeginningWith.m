%Alan Tung Zack Hannah
%actung@ncsu.edu zdhannah@ncsu.edu
%4/19/21
%Section 205 / 204
%Project 3: International Names, Spring 2021

function selectedNames = getNamesBeginningWith(allNames, firstLetter)
%searches throguh names and determines names that begin with a specific
%letter (A-Z)
%inputs: cell array of names stored as char array
%firstletter 1x1 char array
%returns: selectedNames a cell array of names that begin with first letter

isSameLetter = strncmpi(allNames,firstLetter,1);

selectedNames = allNames(isSameLetter);
