-- Adding a new car sale to the dealership database

-- Employee table 
insert into kl_employees(
	employee_id,
	last_name,
	first_name
)values(
	1,
	'Jones',
	'Joshua'	
);

-- Customer table
insert into kl_customer(
	customer_id,
	first_name,
	last_name,
	address,
	city,
	state_province,
	postal_code,
	country,
	contact_number
)values(
	1,
	'Jessica',
	'Harlow',
	'1357 Old Willow Lane',
	'Frenchtown',
	'MT',
	59812,
	'USA',
	'4065490101'
);

-- Vehicle table
insert into kl_vehicle(
	vin,
	vehicle_make,
	vehicle_model,
	vehicle_trim,
	color,
	mileage,
	vehicle_year,
	new_vehicle,
	used_vehicle,
	car_for_sale
)values(
	'KM9DC35A9RK4312E',
	'Hyundai',
	'Elantra',
	'LX',
	'Red',
	000019,
	2024,
	true,
	false,
	true
);

-- Invoice table
insert into kl_invoice(
	invoice_id,
	invoice_number,
	date_of_sale,
	vin,
	customer_id,
	employee_id
)values(
	1,
	14,
	'2023-04-19',
	'KM9DC35A9RK4312E',
	1,
	1
);

-- Adding a service to the dealership table

-- Employee table 
insert into kl_employees(
	employee_id,
	last_name,
	first_name
)values(
	2,
	'Smith',
	'Malcolm'	
);

-- Service table
insert into kl_service(
	service_id,
	service_type,
	service_rate
)values(
	1,
	'Oil Change',
	74.99
);

-- Parts table
insert into kl_parts(
	part_id,
	part_number,
	part_description,
	dealer_price,
	retail_price
)values(
	1,
	1427,
	'Oil Filter for Hyundai Elantra, LX only',
	3.21,
	9.99
);

insert into kl_parts(
	part_id,
	part_number,
	part_description,
	dealer_price,
	retail_price
)values(
	2,
	'530HY',
	'Oil for Hyundai Elantra, LX only',
	8.21,
	17.99
);

-- Parts Used table
insert into kl_parts_used(
	part_used_id,
	part_id,
	quantity,
	price
)values(
	1,
	1,
	1,
	9.99
);

insert into kl_parts_used(
	part_used_id,
	part_id,
	quantity,
	price
)values(
	2,
	2,
	8,
	50.99
);

-- Mechanic table
insert into kl_mechanic(
	mechanic_id,
	employee_id,
	service_id,
	mechanic_hours,
	mechanic_rate
)values(
	1,
	2,
	1,
	'1.75',
	50.00
);

-- Service invoice table
insert into kl_service_invoice(
	service_invoice,
	service_number,
	vin,
	customer_id,
	date_received,
	date_returned,
	mechanic_comments,
	part_used_id,
	mechanic_id
)values(
	1,
	1,
	'KM9DC35A9RK4312E',
	1,
	'2023-11-03',
	'2023-11-03',
	'Changed oil filter, filled with 5w30, 8 qts',
	1,
	1
);

update kl_service_invoice 
set total_cost = 104.99
where customer_id = 1

-- Add to the employee table using a stored procedure
create or replace function add_employee(
	_employee_id INTEGER,
	_first_name VARCHAR(20),
	_last_name VARCHAR(20)
)
returns void
as $MAIN$
begin 
	insert into kl_employees(employee_id, first_name, last_name)
	values(_employee_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_employee(3, 'Monica', 'Alfred')

-- Add a discount using a stored procedure and adding an employee with the stored procedure add_employee
create or replace procedure veteran(
	customer INTEGER,
	cost_ DECIMAL,
	discount DECIMAL
)
language plpgsql
as $$
begin 
	-- add a discount to the service ticket
	update kl_service_invoice 
	set total_cost = cost_ - discount
	where customer_id = customer;
	
	-- commit the above statement inside of a transaction 
	commit;
end;
$$

-- Customer table
insert into kl_customer(
	customer_id,
	first_name,
	last_name,
	address,
	city,
	state_province,
	postal_code,
	country,
	contact_number
)values(
	2,
	'Leroy',
	'Kawolski',
	'1 New Willow Lane',
	'Huson',
	'MT',
	59842,
	'USA',
	'4067344141'
);

-- Employee table 
select add_employee(4,'Ellen', 'Parski')

-- Service table
insert into kl_service(
	service_id,
	service_type,
	service_rate
)values(
	2,
	'Oil Change',
	74.99
);

-- Parts table
insert into kl_parts(
	part_id,
	part_number,
	part_description,
	dealer_price,
	retail_price
)values(
	3,
	1432,
	'Oil Filter for Ford Ranger',
	1.75,
	9.99
);

insert into kl_parts(
	part_id,
	part_number,
	part_description,
	dealer_price,
	retail_price
)values(
	4,
	'1030FR',
	'Oil for Ford Ranger',
	8.21,
	17.99
);

-- Parts Used table
insert into kl_parts_used(
	part_used_id,
	part_id,
	quantity,
	price
)values(
	3,
	3,
	1,
	9.99
);

insert into kl_parts_used(
	part_used_id,
	part_id,
	quantity,
	price
)values(
	4,
	4,
	12,
	16.99
);

-- Mechanic table
insert into kl_mechanic(
	mechanic_id,
	employee_id,
	service_id,
	mechanic_hours,
	mechanic_rate
)values(
	2,
	4,
	2,
	'1.75',
	50.00
);

-- Vehicle table
insert into kl_vehicle(
	vin,
	vehicle_make,
	vehicle_model,
	vehicle_trim,
	color,
	mileage,
	vehicle_year,
	new_vehicle,
	used_vehicle,
	car_for_sale
)values(
	'1M9DC35Z3RK4982E',
	'Ford',
	'Ranger',
	'CRW',
	'Green',
	073429,
	2013,
	false,
	false,
	false
);

-- Service invoice table

insert into kl_service_invoice(
	service_invoice,
	service_number,
	vin,
	customer_id,
	date_received,
	date_returned,
	mechanic_comments,
	part_used_id,
	mechanic_id,
	total_cost
)values(
	2,
	2,
	'1M9DC35Z3RK4982E',
	2,
	'2023-11-03',
	'2023-11-03',
	'Changed oil filter, filled with 10w30, 12 qts',
	3,
	2,
	97.99
);

call veteran(2, 97.99, 17.83)










