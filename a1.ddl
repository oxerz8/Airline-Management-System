CREATE TABLE Airline(
	airline_code CHAR(20) PRIMARY KEY NOT NULL,
	name CHAR(20)
);

CREATE TABLE Airport(
	IATA_code CHAR(20) PRIMARY KEY NOT NULL,
	description CHAR(20),
	number_of_runways INT
);

CREATE TABLE Airline_belongs_to_Airport(
	airline_code CHAR(20) REFERENCES Airline(airline_code),
	IATA_code CHAR(20) REFERENCES Airport(IATA_code),
	PRIMARY KEY(airline_code, IATA_code)
);

CREATE TABLE Airplane(
	airplane_id CHAR(20) PRIMARY KEY NOT NULL,
	years_of_service INT,
	registration_number INT,
	cargo_capacity INT,
	number_of_passangers INT,
	type VARCHAR(20)
);

CREATE TABLE Airplane_owner(
	airplane_id CHAR(20) REFERENCES Airplane(airplane_id),
	airline_code CHAR(20) REFERENCES Airline(airline_code),
	PRIMARY KEY(airplane_id, airline_code)
);

CREATE TABLE Schedule(
	airline_code CHAR(20) REFERENCES Airline(airline_code) UNIQUE,
	airplane_id CHAR(20) REFERENCES Airplane(airplane_id) UNIQUE,
	IATA_code CHAR(20) REFERENCES Airport(IATA_code),
	departure_time TIMESTAMP,
	arrival_time TIMESTAMP,
	PRIMARY KEY(airline_code, airplane_id, departure_time, arrival_time)
);
CREATE TABLE Flight(
	airline_code CHAR(20) REFERENCES Schedule(airline_code),
	airplane_id CHAR(20) REFERENCES Schedule(airplane_id),
	flightnumber INT UNIQUE NOT NULL,
	depart CHAR(20) REFERENCES Airport(IATA_code),
	arrive CHAR(20) REFERENCES Airport(IATA_code),
	PRIMARY KEY(airline_code, airplane_id, flightnumber)
);


CREATE TABLE Flight_Schedule(
	airline_code CHAR(20) REFERENCES Schedule(airline_code),
	airplane_id CHAR(20) REFERENCES Schedule(airplane_id),
	flightnumber INT REFERENCES Flight(flightnumber) NOT NULL,
	PRIMARY KEY(airline_code, airplane_id, flightnumber)
);

CREATE TABLE Person(
	person_id CHAR(20) PRIMARY KEY,
	contact_information INT,
	last_name CHAR(20),
	first_name CHAR(20)
);

CREATE TABLE Staff(
	employee_id CHAR(20) REFERENCES Person(person_id) UNIQUE NOT NULL,
	security_clearance BOOLEAN
);

CREATE TABLE Airport_staff(
	employee_id CHAR(20) REFERENCES Staff(employee_id),
	airline_code CHAR(20) REFERENCES Airline(airline_code)
);

CREATE TABLE Customer(
	customer_id CHAR(20) REFERENCES Person(person_id) UNIQUE NOT NULL,
	status VARCHAR
	CONSTRAINT chk_status CHECK (status in ('Non-Member', 'Bronze', 'Silver', 'Gold'))
);

CREATE TABLE Ticket(
	ticket_id CHAR(20) PRIMARY KEY,
	flight_number INT,
	base_price INT,
	baggage BOOLEAN,
	person_id CHAR(20),
	assigned_seat CHAR(3)
);

CREATE TABLE Airline_ticket(
	ticket_id CHAR(20) REFERENCES Ticket(ticket_id),
	airline_code CHAR(20) REFERENCES Airline(airline_code),
	PRIMARY KEY(ticket_id, airline_code)
);

CREATE TABLE Receipt(
	airline_code CHAR(20) REFERENCES Airline(airline_code),
	payment_method CHAR(20),
	time TIMESTAMP,
	amount INT,
	receipt_number INT PRIMARY KEY
);

CREATE TABLE Customer_purchase(
	ticket_id CHAR(20) REFERENCES Ticket(ticket_id),
	receipt_number INT REFERENCES Receipt(receipt_number),
	customer_id CHAR(20) REFERENCES Customer(customer_id),
	PRIMARY KEY(ticket_id, receipt_number, customer_id)
);

CREATE TABLE Role(
	employee_id CHAR(20) REFERENCES Staff(employee_id),
	PRIMARY KEY(employee_id)
);

CREATE TABLE Manager(
	employee_id CHAR(20) REFERENCES Role(employee_id) UNIQUE NOT NULL
);
CREATE TABLE Pilot(
	employee_id CHAR(20) REFERENCES Role(employee_id) UNIQUE NOT NULL
);
CREATE TABLE Kiosk_staff(
	employee_id CHAR(20) REFERENCES Role(employee_id) UNIQUE NOT NULL
);
CREATE TABLE Flight_attendant(
	employee_id CHAR(20) REFERENCES Role(employee_id) UNIQUE NOT NULL
);
CREATE TABLE Baggage_handler(
	employee_id CHAR(20) REFERENCES Role(employee_id) UNIQUE NOT NULL
);
CREATE TABLE License(
	license_id CHAR(20) PRIMARY KEY,
	name CHAR(20),
	type CHAR(20),
	issue_date DATE,
	expiry_date DATE
);
CREATE TABLE Manager_license(
	employee_id CHAR(20) REFERENCES Manager(employee_id),
	license_id CHAR(20) REFERENCES License(license_id),
	PRIMARY KEY(employee_id, license_id)
);
CREATE TABLE Pilot_license(
	employee_id CHAR(20) REFERENCES Pilot(employee_id),
	license_id CHAR(20) REFERENCES License(license_id),
	PRIMARY KEY(employee_id, license_id)
);