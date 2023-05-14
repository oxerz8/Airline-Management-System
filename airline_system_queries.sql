-- Natural and theta joins, 3 way relations, subqueries, rename, duplicate,
-- union, intersection, cartisan, grouping agg,
-- case, with as

-- Returns the id and registration num of all airplanes that have been 
-- in service for more than 9 years
-- Basic SELECT-FROM-WHERE clause
SELECT airplane_id, registration_number 
FROM Airplane
WHERE years_of_service > 9;


-- Returns all the columns in Customer, Ticket and Receipt table 
-- 3 way relationship between Customer, Receipt, Ticket
-- Theta join
SELECT * 
FROM Customer as C, Ticket as T, Receipt as R, Customer_purchase as Cp
WHERE C.person_id = Cp.customer_id
AND T.ticket_id = Cp.ticket_id
AND R.receipt_number = Cp.receipt_number;

-- Return a table containing information on only the airplanes that are
-- scheduled for a trip
-- Note that Schedule and Airplane are in an optional relationship
-- hence we can have airplanes that are registered but not in use currently,
-- Eg. Some may be under maintenance
--  Schedule and Airplane left outer join
SELECT Ap.number_of_passangers, Ap.airplane_id, S.departure_time, S.arrival_time
FROM Schedule S
RIGHT JOIN Airplane Ap
ON Ap.airplane_id = S.airplane_id

-- Return a table containing number of flights scheduled between 2 times
-- in desc order of departure place, grouped by airline code 
-- Subqueries, grouping, aggregation, sorting
SELECT COUNT(F.flightnumber), S.airline_code
FROM Schedule as S, Flight_Schedule as Fs
(SELECT DISTINCT(flightnumber), depart
FROM Flight
WHERE depart = 'YYZ') AS F
WHERE S.departure_time BETWEEN '2023-02-01' AND '2023-03-01'
AND S.airline_code = Fs.airline_code
AND Fs.flightnumber = F.flightnumber
GROUP BY S.airline_code
ORDER BY F.depart DESC
