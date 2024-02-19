%Alan Tung Zack Hannah
%actung@ncsu.edu zdhannah@ncsu.edu
%4/19/21
%Section 205 / 204
%Project 3: International Names, Spring 2021
function validLetter = getValidLetter()
%ensure user entered a letter (A-Z) by continously asking until they enter
%a valid letter
%Prints to get input 
%Returns: 1x1 array from A-Z

validLetter = input('Names with what letter (A-Z) would you like to explore:','s');

numberConvert=double(validLetter);

x = 0;

while x~= 1;
    
if strlength(validLetter) == 1 && numberConvert>= 65 && numberConvert<= 122
    fprintf('Generating names that begin with  %s \n',validLetter)
    x = x+1;
else
    fprintf('Letter has to be between (A-Z) \n')
    validLetter = input('Names with what letter (A-Z) would you like to explore:','s');
    numberConvert=double(validLetter);
end

end
