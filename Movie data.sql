#Analyzed superheroes data using SQL querying. Used skills such as Case statements, CTEs,Sub queries, Window functions and Aggregations to perform the analysis#

#Overview of the table#
SELECT 
    *
FROM
    Parks_and_Recreation.marvels;
    
#Getting total count of superheroes by their hometown#
SELECT 
    COUNT(*) AS totalcount, hometown
FROM
    marvels
GROUP BY hometown
ORDER BY totalcount DESC;

#Getting total count of superheroes by their hometown#
SELECT 
    COUNT(*) AS totalcount, alignment
FROM
    marvels
GROUP BY alignment
ORDER BY totalcount DESC;

#Superhero with the maximum popularity#

SELECT 
    name,popularity
FROM
    marvels
WHERE
    popularity IN (SELECT 
            MAX(popularity)
        FROM
            marvels);
            
#Superhero with the maximum popularity#

SELECT 
    name,`weight_kg`
FROM
    marvels
WHERE
    `weight_kg` IN (SELECT 
            MAX(`weight_kg`)
        FROM
            marvels);     

#Superhero with maximuk fighting skills#
            
SELECT 
    name,`fighting_skills`
FROM
    marvels
WHERE
    `fighting_skills` IN (SELECT 
            MAX(`fighting_skills`)
        FROM
            marvels);             
            
#Count and %  of Male and Female superheroes#alter

with cte as (SELECT 
    gender, COUNT(*) AS countofheroes
FROM
    marvels
GROUP BY gender)

#Percentage of male and female#
SELECT
  gender,
  COUNT(*) AS count,
  ROUND((COUNT(*) / (SELECT COUNT(*) FROM marvels)) * 100, 0) AS percentage
FROM
  marvels
GROUP BY
  gender;

#Percentage of alignment#
SELECT
  alignment,
 ROUND((COUNT(*) / (SELECT COUNT(*) FROM marvels)) * 100, 0) AS percentage
FROM
  marvels
GROUP BY
  alignment order by percentage desc;
  

#Top 3 popular heroes#
with cte as (select *, dense_rank()over(order by popularity desc) as drank from marvels)
select name ,popularity,drank from cte where drank<=3;

#Superheroes with more than the avg popularity#

SELECT 
    name, popularity
FROM
    marvels
WHERE
    popularity >= (SELECT 
            ROUND(AVG(popularity), 0)
        FROM
            marvels);
            
#Superheroes with more than the avg weight#

SELECT 
    name, `weight_kg`
FROM
    marvels
WHERE
     `weight_kg`>= (SELECT 
            ROUND(AVG(`weight_kg`), 0)
        FROM
            marvels);   
            
 #ALtering the table structure#
 
#Adding a new column named 'new_column' based on a CASE statement#
ALTER TABLE marvels
add column popularity_cadre varchar(50);

        
update marvels set popularity_cadre =  (CASE
        WHEN popularity<=20 then "Less popular" 
        WHEN popularity>21 and popularity<=50 then "Moderately popular" 
        WHEN popularity>50 then "More popular"
        end);
 
#Categorizing the heroes on popularity basis# 
 
SELECT 
    COUNT(*) as totalheroes, `popularity_cadre`
FROM
    marvels
GROUP BY `popularity_cadre`;



            
            
            
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
        
        
        
        
        
        






  
  




          




		
