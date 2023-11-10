-- Creation of dealership tables 

-- Employee table 
create table kl_employees(
	employee_id SERIAL primary key,
	last_name VARCHAR(25),
	first_name VARCHAR(25)
);

-- Service table
create table kl_service(
	service_id SERIAL primary key,
	service_type VARCHAR(20),
	service_rate NUMERIC(4,2)
);

-- Parts table
create table kl_parts(
	part_id SERIAL primary key,
	part_number VARCHAR(25),
	part_description VARCHAR(100),
	dealer_price NUMERIC(6,2),
	retail_price NUMERIC(6,2)
);

-- Customer table
create table kl_customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	address VARCHAR(100),
	city VARCHAR(50),
	state_province VARCHAR(20),
	postal_code VARCHAR(10),
	country VARCHAR(4),
	contact_number VARCHAR(10)
);

-- Vehicle table
create table kl_vehicle(
	vin VARCHAR(17) primary key,
	vehicle_make VARCHAR(10),
	vehicle_model VARCHAR(20),
	vehicle_trim VARCHAR(10),
	color VARCHAR(20),
	mileage NUMERIC(3,3),
	vehicle_year INTEGER,
	new_vehicle BOOL,
	used_vehicle BOOL,
	car_for_sale BOOL
);

alter table kl_vehicle
add vehicle_price NUMERIC(12,2)

alter table kl_invoice
add vehicle_price NUMERIC(12,2)

-- Invoice table
create table kl_invoice(
	invoide_id SERIAL primary key,
	invoice_number VARCHAR(8),
	date_of_sale DATE,
	vin VARCHAR(17) not null,
	customer_id INTEGER not null,
	employee_id INTEGER not null,
	foreign key(vin) references kl_vehicle(vin),
	foreign key(customer_id) references kl_customer(customer_id),
	foreign key(employee_id) references kl_employees(employee_id)
);

ALTER TABLE kl_invoice
RENAME invoide_id TO invoice_id;

-- Parts Used table
create table kl_parts_used(
	part_used_id SERIAL primary key,
	part_id INTEGER,
	quantity INTEGER,
	price NUMERIC(6,2),
	foreign key(part_id) references kl_parts(part_id)
);

-- Mechanic table
create table kl_mechanic(
	mechanic_id SERIAL primary key,
	employee_id INTEGER not null,
	service_id INTEGER not null,
	mechanic_hours VARCHAR(20),
	mechanic_rate NUMERIC(4,2),
	foreign key(employee_id) references kl_employees(employee_id),
	foreign key(service_id) references kl_service(service_id)
);

-- Service invoice table
create table kl_service_invoice(
	service_invoice SERIAL primary key,
	service_number INTEGER,
	vin VARCHAR(17),
	customer_id INTEGER,
	date_received DATE,
	date_returned DATE,
	mechanic_comments VARCHAR(300),
	part_used_id INTEGER,
	mechanic_id INTEGER,
	foreign key(vin) references kl_vehicle(vin),
	foreign key(customer_id) references kl_customer(customer_id),
	foreign key(mechanic_id) references kl_mechanic(mechanic_id),
	foreign key(part_used_id) references kl_parts_used(part_used_id)
);

alter table kl_service_invoice 
add total_cost NUMERIC(6,2)



