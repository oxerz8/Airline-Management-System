# Airline-Management-System
## Entity-Relationship Diagram
![image](https://github.com/oxerz8/Airline-Management-System/assets/23288977/452cc404-eab3-4d9e-bddf-109d4e2682c8)

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
