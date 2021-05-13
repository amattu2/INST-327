-- Average Age at Election
DROP VIEW IF EXISTS average_president_age;
CREATE VIEW average_president_age AS 
        SELECT ROUND(AVG(YEAR(first_elected) - YEAR(birth_date)), 1) AS "Average Age at Election"
    FROM presidents;


-- Top political parties with name
DROP VIEW IF EXISTS top_political_parties;
CREATE VIEW top_political_parties AS 
    SELECT p.party_id as "Political Party", b.name as "Party Name", COUNT(p.party_id) as "Number of Presidents (Est.)"
    FROM presidents p
    INNER JOIN political_parties b ON (p.party_id = b.party_id)
    GROUP BY p.party_id
    ORDER BY COUNT(p.party_id) DESC;


-- Top 3 Oldest Presidents at election
DROP VIEW IF EXISTS top_oldest_presidents;
CREATE VIEW top_oldest_presidents AS 
SELECT YEAR(first_elected) - YEAR(birth_date) AS "Age at Election", CONCAT(first_name, " ", last_name) AS "President Name" FROM presidents
ORDER BY YEAR(first_elected) - YEAR(birth_date) DESC
LIMIT 0, 3;


-- Top Presidential birth states
DROP VIEW IF EXISTS top_birth_states;
CREATE VIEW top_birth_states AS 
SELECT b.name AS "Birth State", COUNT(birth_state_id) AS "Number of Presidents Born in State"
FROM presidents
INNER JOIN us_states b ON (birth_state_id = b.state_id)
GROUP BY birth_state_id
ORDER BY COUNT(birth_state_id) DESC;


-- Top 3 youngest presidents at election
DROP VIEW IF EXISTS top_youngest_presidents;
CREATE VIEW top_youngest_presidents AS 
SELECT YEAR(first_elected) - YEAR(birth_date) AS "Age at Election", CONCAT(first_name, " ", last_name) AS "President Name" FROM presidents
ORDER BY YEAR(first_elected) - YEAR(birth_date) ASC
LIMIT 0, 3;


-- Top 10 State of Union addresses in length
DROP VIEW IF EXISTS top_presidential_union_addresses;
CREATE VIEW top_presidential_union_addresses AS 
SELECT CONCAT(b.first_name, " ", b.last_name) AS "President Name",
        FORMAT(OCTET_LENGTH(a.speech), 2) AS "State of Union Length",
    YEAR(date) AS "Speech Year"
FROM state_of_unions a
INNER JOIN presidents b ON (a.president_id = b.president_id)
ORDER BY OCTET_LENGTH(a.speech) DESC
LIMIT 0, 10;


-- Presidents born within the current century (dynamic)
DROP VIEW IF EXISTS presidents_born_within_a_century;
CREATE VIEW presidents_born_within_a_century AS 
    SELECT CONCAT(a.first_name, " ", a.last_name) as "President Name", DATE_FORMAT(a.birth_date, "%b %D, %Y") as "Birth Day"
    FROM presidents a
    WHERE YEAR(a.birth_date) > (YEAR(NOW()) - 100);


-- Top Presidential birth month
SET GLOBAL sql_mode = "";
    
DROP VIEW IF EXISTS top_birth_month;
CREATE VIEW top_birth_month AS 
    SELECT DATE_FORMAT(birth_date, "%M") AS "Month", COUNT(MONTH(birth_date)) AS "Number of Presidents"
    FROM presidents
    GROUP BY MONTH(birth_date)
    ORDER BY COUNT(MONTH(birth_date)) DESC;


-- 1984 Analysis of the Presidential Election
DROP VIEW IF EXISTS presidential_election_1984;
CREATE VIEW presidential_election_1984 AS 
SELECT CONCAT(p.first_name, " ", p.last_name) AS "President Name",
        s.name as "Voting State",
    pp.name as "Representative Party",
    ev.year as "Voting Year",
    FORMAT(ev.candidatevotes, 0) as "Received Votes in State"
FROM election_votes ev
INNER JOIN presidents p ON (p.president_id = ev.president_id)
INNER JOIN us_states s ON (s.state_id = ev.state_id)
INNER JOIN political_parties pp ON (pp.party_id = pp.party_id)
WHERE year = 1984
GROUP BY ev.state_id, ev.party_id;


-- Excerpt of the Presidents with their Vice Presidents
DROP VIEW IF EXISTS president_with_vice_presidents_excerpt;
CREATE VIEW president_with_vice_presidents_excerpt AS 
        SELECT CONCAT(p.first_name, " ", p.last_name) AS "President Name",
        CONCAT(vp.first_name, " ", vp.last_name) AS "Vice President Name",
        DATE_FORMAT(p.first_elected, "%Y") AS "Serving Term Started",
        pp.name AS "Serving Party"
    FROM presidents p
    INNER JOIN vice_presidents vp ON (vp.president_id = p.president_id)
    INNER JOIN political_parties pp ON (p.party_id = pp.party_id)
    ORDER BY first_elected ASC
    LIMIT 0,10;