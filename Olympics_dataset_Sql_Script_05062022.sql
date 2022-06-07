# Sql Wala G h o l

#select * from athlete_events;
#select * from noc_regions;
#select * from athlete_events as a inner join noc_regions as b on a.NOC = b.NOC;
#select a.Games, count(distinct b.region) as participation from athlete_events as a inner join noc_regions as b on a.NOC = b.NOC group by a.Games order by participation;

# Q4. Which year saw the highest and lowest no of countries participating in olympics
#select a.Games, count(distinct b.region) as participation from athlete_events as a inner join noc_regions as b on a.NOC = b.NOC group by Game_Year order by 2 limit 1;
#select a.Games, count(distinct b.region) as participation from athlete_events as a inner join noc_regions as b on a.NOC = b.NOC group by Game_Year order by 2 desc limit 1;
#SELECT CONCAT(M.GAMES,"-", M.TOTAL_COUNTRIES) as Most_countries FROM (
#SELECT concat(A.GAMES,'-',COUNT(DISTINCT(B.REGION))) AS PARTICIPATION FROM athlete_events A INNER JOIN NOC_REGIONS B ON A.NOC=B.NOC GROUP BY A.GAMES ORDER BY PARTICIPATION desc LIMIT 1

# Q3. Mention the total no of nations who participated in each olympics game?
# select a.Games, count(distinct b.region) as participation from athlete_events as a inner join noc_regions as b on a.NOC = b.NOC group by Games;

# Q5. Which nation has participated in all of the olympic games
# select b.region, count(distinct a.Games) as participated_games from athlete_events as a inner join noc_regions as b on a.NOC = b.NOC group by region order by 2 desc limit 4;

#select * from 
#(select b.region, count(distinct a.Games) as participated_games from athlete_events as a inner join noc_regions as b on a.NOC = b.NOC group by b.region) as M
#where M.participated_games = (select count(distinct Games) from athlete_events)


# Q6. Identify the sport which was played in all summer olympics.
 #select Sport, M.dg from (select Sport, count(distinct Games) as dg  from athlete_events where season = 'Summer' group by Sport order by 2 desc) as M
# where M.dg = (select count(distinct Games) from athlete_events where season = 'Summer')

# SELECT M.REGION, COUNT(MEDAL) FROM (SELECT A.*,B.REGION FROM athlete_events A INNER JOIN noc_regions B ON A.NOC=B.NOC WHERE MEDAL IN ('Gold', 'Silver', 'Bronze'))M GROUP BY M.REGION ORDER BY COUNT(MEDAL) DESC LIMIT 5;

# SELECT ATH_NAME, TEAM, COUNT(MEDAL) FROM
# (
# SELECT * FROM athlete_events WHERE MEDAL IN ('Gold', 'Silver', 'Bronze')
# ) M GROUP BY ATH_NAME ORDER BY COUNT(MEDAL) DESC LIMIT 5

# Q7 Which Sports were just played only once in the olympics?
#select * from
#(select Sport, count(Sport) as number_of_Sport from (select distinct Games, Sport from athlete_events)as M group by Sport) as t2
#where number_of_Sport = 1 order by Sport

# Q8. Fetch the total no of sports played in each olympic games.
# select distinct Games, COUNT(DISTINCT Sport) from athlete_events group by 1 ORDER BY 2 DESC;

# Q9. Fetch oldest athletes to win a gold medal
#select * from 
#(select Ath_Name, Age, Medal from athlete_events where Medal = 'Gold' and AGE != 'NA') as M
#where M.Age = (select max(Age) from athlete_events where age != 'NA' and Medal = 'Gold')

# Q10 Find the Ratio of male and female athletes participated in all olympic games.
(select Count(Sex) as Males from athlete_events where Sex = 'M')
(select Count(Sex) Females from athlete_events where Sex = 'F')






