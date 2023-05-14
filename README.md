# Airline-Management-System
## Entity-Relationship Diagram
![image](https://github.com/oxerz8/Airline-Management-System/assets/23288977/452cc404-eab3-4d9e-bddf-109d4e2682c8)

## Update
* Expanded upon the project by adding a DML file that consisted of the following queries(self-composed):
* Return a table containing number of flights scheduled between February 1st, 23 and March 1st, 23

  in descending order of departure place, grouped by airline code 

  Methods used: Subqueries, grouping, aggregation, sorting
* Return a table containing information on only the airplanes that are

  scheduled for a trip

  Note that Schedule and Airplane are in an optional relationship
 
  hence we can have airplanes that are registered but not in use currently,

  Eg. Some may be under maintenance
  Methods used: Schedule RIGHT JOIN Airplane 
* Returns all the columns in Customer, Ticket and Receipt table 

  Observation: Trisection relationship between Customer, Receipt, Ticket

  Method used: Theta join (or Conditional Full outer Join)  

## Summary
* This project was a part of the assignment coursework for CSC343: Introduction to Databases.
* The project required the students to design an airline management system using an ER diagram and then implementing it in PostgreSQL, given the details in the assignment.

### Features

Following are the Entity sets and their corrosponding attributes and relationships with each other:
* Airline(airline_code, name)
* Airplane(airplane_id, years_of_service, registration_no, cargo_cap, passangers, type)
* Airport(IATA_code, description, number_of_runways)
* Airline - belongs to - Airport - has - Airplane***
* Person(id, first, last, contact)
* Staff(security_clearance) - is a - Person****
* Customer(status) - is a - Person****
* Airline - have - Customer***
* Airline - have - Staff
* Ticket(ticket_id, flight_num, base_price, baggage, person_id, assigned_seat)
* Receipt(receipt_num, amt, timestamp, payment_meth, airline_code)
* Customer - purchase - Ticket AND Receipt
* Airline - sell - Ticket
* Schedule(airline_code, airplane_id, departure time, arrival time)**
* Airplane and Airline and Staff - have - Schedule
* Schedule - have - Flight
* Flight(flight_num, arrival, departure)**

** Weak Attributes

*** Entity-set relationships

**** IS-A relationships
