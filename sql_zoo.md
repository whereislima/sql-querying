For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.

people table schema
id
name
age

select table schema
age [group by]
people_count (people count)

SELECT
  age,
  COUNT(*) people_count
FROM
  people
GROUP BY
  age

For this challenge you need to create a simple HAVING statement, you want to count how many people have the same age and return the groups with 10 or more people who have that age.

people table schema
id
name
age
return table schema
age
total_people

SELECT age, COUNT(*) as total_people
FROM people
GROUP BY age
HAVING COUNT(*) >= 10



This tutorial uses the LIKE operator to check names. We will be using the SELECT command on the table world:

9.
Lesotho and Moldova both have two o characters separated by two other characters.

Find the countries that have two "o" characters separated by two others.

SELECT name FROM world
 WHERE name LIKE '%o__o%'

10.
Cuba and Togo have four characters names.

Find the countries that have exactly four characters.

SELECT name FROM world
 WHERE name LIKE '____'

11.
The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country

Find the country where the name is the capital city.

SELECT name 
  FROM world
 WHERE name LIKE capital 

12.
The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City".

Find the country where the capital is the country plus "City".

The concat function
The function concat is short for concatenate - you can use it to combine two or more strings.

SELECT name
  FROM world 
 WHERE capital LIKE concat(name, ' City') 

13.
Find the capital and the name where the capital includes the name of the country.

SELECT capital, name
  FROM world
 WHERE capital LIKE concat(name, '%')


14.
Find the capital and the name where the capital is an extension of name of the country.

You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country.

SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%_')


15.
For Monaco-Ville the name is Monaco and the extension is -Ville.

Show the name and the extension where the capital is an extension of name of the country.

You can use the SQL function REPLACE.
?????????

In this tutorial you will use the SELECT command on the table world:


4.
Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000
FROM world
WHERE continent IN ('South America')

6.
Show the countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE 'United%'

7.
Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

8.
Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.

8.
Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.

SELECT name, population, area
FROM world 
WHERE population > 250000000 AND area < 3000000 OR population < 250000000 AND area > 3000000


9.
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
FROM world
WHERE continent = 'South America'

10.
Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(GDP/population, -3)
FROM world
WHERE GDP > 1000000000000

11.
Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

You can use the LENGTH function to find the number of characters in a string

SELECT name, capital 
  FROM world
 WHERE LEN(name) = LEN(capital)

12.
The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

 
13.
Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.

You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'

SELECT name
FROM world
WHERE name LIKE '%u%' 
  and name LIKE '%a%' 
  and name LIKE '%o%' 
  and name LIKE '%i%'
  and name LIKE '%e%'
  and name NOT LIKE '% %'

11.
Find all details of the prize won by PETER GRÜNBERG

Non-ASCII characters
The u in his name has an umlaut. You may find this link useful

SELECT yr, subject, winner
FROM nobel
WHERE winner = 'PETER GRÜNBERG'

12.
Find all details of the prize won by EUGENE O'NEILL

Escaping single quotes
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'

13.
Knights in order

List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr desc, winner

14.
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY 
CASE WHEN subject IN ('Physics','Chemistry')THEN 1 ELSE 0 END,
 subject, winner
