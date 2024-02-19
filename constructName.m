%Alan Tung Zack Hannah
%actung@ncsu.edu zdhannah@ncsu.edu
%4/19/21
%Section 205 / 204
%Project 3: International Names, Spring 2021
function fullName = constructName(culture, givenNames, varargin)
%construction the full name of a person based on their culture
%Inputs; culture is a char array: 'spanish', chinese or american
%        givenNames is a char array of the given names
%        varargin depends on the culture
%        for spanish- the father's and mother's family names
%        for chinese and american - just the family name
% returns; fullName is a char array of the properly constructed name
          % spanish: given names followed by fater last name followed by
          % mother last name
          %chinese family name followed by given
          %american given names already has the middle name followed by
          %family name
          %if incorrect usage the function returns empty char array ''
Spanish = 'spanish';
Chinese = 'chinese';
American = 'american';         

if strcmp(culture,Spanish) == 1
    
  fullName = char(strcat(givenNames," ",varargin{1} ," ",varargin{2}," "));

elseif strcmp(culture,Chinese) == 1
  fullName =  char(strcat(varargin{1}," ", givenNames," "));

elseif strcmp(culture,American) == 1
  fullName = char(strcat(givenNames," ",varargin{1}," "));
else
   fprintf('')
end

