CREATE SCHEMA DEALERSHIP;

USE DEALERSHIP;

# Create tables 
CREATE TABLE company (
    company_id CHAR(5) NOT NULL,
    company_name VARCHAR(20),
    PRIMARY KEY (company_id)
);

CREATE TABLE car (
    car_id CHAR(5) NOT NULL,
    car_price DOUBLE,
    car_model VARCHAR(20) NOT NULL,
    car_description VARCHAR(100),
    car_type VARCHAR(10) NOT NULL,
    cost INT,
    company_id CHAR(5) NOT NULL,
    PRIMARY KEY (car_id),
    FOREIGN KEY (company_id)
        REFERENCES company (company_id)
);

CREATE TABLE inventory (
    car_id CHAR(5) NOT NULL,
    quantity_on_hand INT,
    quantity_on_order INT,
    recommended_quantity INT,
    FOREIGN KEY (car_id)
        REFERENCES car (car_id)
);

CREATE TABLE order_info (
    order_id CHAR(5) NOT NULL,
    quantity INT,
    total_price DOUBLE,
    order_date DATE,
    car_id CHAR(5) NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (car_id)
        REFERENCES car (car_id)
);

CREATE TABLE address (
    address_id CHAR(5) NOT NULL,
    street_address VARCHAR(40),
    city VARCHAR(30),
    state CHAR(2),
    zipcode CHAR(5),
    PRIMARY KEY (address_id)
);

CREATE TABLE person (
    person_id CHAR(5) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id CHAR(5) NOT NULL,
    phone VARCHAR(10),
    PRIMARY KEY (person_id),
    FOREIGN KEY (address_id)
        REFERENCES address (address_id)
);

CREATE TABLE dealership (
    dealership_id CHAR(5) NOT NULL,
    dealership_name VARCHAR(30),
    address_id CHAR(5) NOT NULL,
    PRIMARY KEY (dealership_id),
    FOREIGN KEY (address_id)
        REFERENCES address (address_id)
);

CREATE TABLE employee (
    employee_id CHAR(5) NOT NULL,
    person_id CHAR(5) NOT NULL,
    dealership_id CHAR(5) NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (person_id)
        REFERENCES person (person_id),
	FOREIGN KEY (dealership_id)
		REFERENCES dealership (dealership_id)
);

CREATE TABLE customer (
    customer_id CHAR(5) NOT NULL,
    person_id CHAR(5) NOT NULL,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (person_id)
        REFERENCES person (person_id)
);

CREATE TABLE customer_order (
    customer_id CHAR(5) NOT NULL,
    order_id CHAR(5) NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),
    FOREIGN KEY (order_id)
        REFERENCES order_info (order_id)
);

CREATE TABLE master_billing (
    customer_id CHAR(5) NOT NULL,
    balance_due DOUBLE,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE purchase_invoice (
    purchase_invoice_number CHAR(5) NOT NULL,
    dealership_id CHAR(5) NOT NULL,
    invoice_date DATE,
    cost_each DOUBLE,
    extended_cost DOUBLE,
    total_cost DOUBLE,
    PRIMARY KEY (purchase_invoice_number),
    FOREIGN KEY (dealership_id)
        REFERENCES dealership (dealership_id)
);



INSERT INTO company
VALUES ('00001', 'Honda'),
	   ('00002', 'Toyota'),
       ('00003', 'BMW'),
       ('00004', 'Audi'),
       ('00005', 'Lexus'),
       ('00006', 'Tesla'),
       ('00007', 'Mazda'),
       ('00008', 'Kia'),
       ('00009', 'Genesis'),
       ('00010', 'Infiniti');

INSERT INTO car
VALUES ('00010', 45000, '330i', 'BMW 330i, 4-door, panoramic sunroof, V4, MPG: 28/35', 'Sedan', 39000, '00003'),
	   ('00020', 48000, 'EV6', 'Kia EV6, 4-door, panoramic sunroof, Electric Range: 280mi', 'SUV', 40000, '00008'),
       ('00030', 33000, 'Camry', 'Toyota Camry, 4-door, V4, MPG: 30/38', 'Sedan', 27000, '00002'),
       ('00040', 28000, 'Civic', 'Honda Civic, 4-door, moonroof, V4, MPG: 32/39', 'Sedan', 21000, '00001'),
       ('00050', 67470, 'RC F', 'Lexus RC F, 2-door, moonroof, V8, MPG: 24/32', 'Sports', 58000, '00005'),
       ('00060', 73000, 'Q8', 'Audi Q8, 4-door, panoramic sunroof, V6, MPG: 18/22', 'SUV', 63000, '00004'),
       ('00070', 110000, 'Model S', 'Tesla Model S, 4-door, panoramic sunroof, Electric, Range: 395mi', 'Sedan', 98000, '00006'),
       ('00080', 36000, 'CX 5', 'Mazda CX 5, 4-door, Moonroof, V4, MPG: 28/32', 'SUV', 30000, '00007'),
       ('00090', 56000, 'GV80', 'Genesis GV80, 4-door, panoramic sunroof, V4, MPG: 20/24', 'SUV', 50000, '00009'),
       ('00100', 50000, 'QX60', 'Infiniti QX60, 4-door, panoramic sunroof V6, MPG: 23/26', 'SUV', 43000, '00010');
       
INSERT INTO inventory
VALUES ('00010', 7, 5, 15),
	   ('00020', 12, 0, 10),
       ('00030', 3, 9, 12),
       ('00040', 0, 10, 20),
       ('00050', 3, 4, 10),
       ('00060', 1, 6, 9),
       ('00070', 0, 2, 5),
       ('00080', 5, 5, 10),
       ('00090', 2, 16, 20),
       ('00100', 1, 2, 3);

INSERT INTO order_info
VALUES ('10000', 1, 45000, '2022-10-09', '00010'),
	   ('20000', 2, 96000, '2022-10-31', '00020'),
       ('30000', 1, 33000, '2022-11-01', '00030'),
       ('40000', 3, 84000, '2022-11-11', '00040'),
       ('50000', 1, 67470, '2022-11-29', '00050');

INSERT INTO address
VALUES ('12345', '1334 Saratoga Ave.', 'San Jose', 'CA', '95129'),
	   ('12346', '731 Teresi Ct.', 'San Jose', 'CA', '95050'),
       ('12347', '123 7th St.', 'San Jose', 'CA', '95050'),
       ('12348', '122 Greendale Ave.', 'Mountain View', 'CA', '94040'),
       ('12349', '175 Cabrillo Ave.', 'Santa Clara', 'CA', '95051'),
       ('12350', '4239 El Camino Real', 'Santa Clara', 'CA', '95051'),
       ('12351', '1334 Stevens Creek Blvd.', 'San Jose', 'CA', '95129'),
	   ('12352', '1453 El Camino Real', 'Mountain View', 'CA', '94040'),
       ('12353', '45 4th St.', 'San Jose', 'CA', '95050'),
       ('12354', '1203 Saratoga Ave.', 'San Jose', 'CA', '95129'),
	   ('12355', '1400 Teresi Ct.', 'San Jose', 'CA', '95050'),
       ('12356', '1122 El Camino Real', 'Santa Clara', 'CA', '95051'),
       ('12357', '3326 Stevens Creek Blvd.', 'San Jose', 'CA', '95050'),
       ('12358', '2593 7th St.', 'San Jose', 'CA', '95050'),
       ('12359', '324 2nd St.', 'San Jose', 'CA', '95050');

INSERT INTO person
VALUES ('98765', 'David', 'Lee', '12345', '6692222233'),
	   ('98766', 'Andrew', 'Johnson', '12346', '6509993321'),
       ('98767', 'Mary', 'White', '12347', '6694993021'),
       ('98768', 'Angela', 'Smith', '12348', '4089876677'),
       ('98769', 'Michael', 'Williams', '12349', '4081233332'),
       ('98770', 'Chris', 'Brown', '12350', '6502239495'),
	   ('98771', 'William', 'Xu', '12354', '5103994099'),
       ('98772', 'Shyla', 'Smith', '12355', '6699495550'),
       ('98773', 'Danny', 'Cho', '12356', '4083882888'),
       ('98774', 'Allen', 'Jones', '12357', '6504324522'),
       ('98775', 'Mike', 'Jackson', '12358', '5109998332'),
       ('98776', 'Jimmy', 'Miller', '12359', '4084392029');

INSERT INTO dealership
VALUES ('56780', 'San Jose Autosale', '12353');

SET FOREIGN_KEY_CHECK=0;

INSERT INTO employee
VALUES ('23450', '98765', '12353'),
	   ('23451', '98766', '12353'),
       ('23452', '98767', '12353'),
       ('23453', '98768', '12353'),
       ('23454', '98769', '12353'),
       ('23455', '98770', '12353');

SET FOREIGN_KEY_CHECK=1;       

INSERT INTO customer
VALUES ('34560', '98771'),
	   ('34561', '98772'),
       ('34562', '98773'),
       ('34563', '98774'),
       ('34564', '98775'),
       ('34565', '98776');

INSERT INTO customer_order
VALUES ('34560', '10000'),
	   ('34561', '20000'),
       ('34562', '30000'),
       ('34563', '40000'),
       ('34564', '50000');

INSERT INTO master_billing
VALUES ('34560', 5000),
	   ('34561', 30000),
       ('34562', 8000),
       ('34563', 40000),
       ('34560', 12000);

INSERT INTO purchase_invoice
VALUES ('78900', '56780', '2022-10-09', 39000, 2000, 41000),
       ('78901', '56780', '2022-10-31', 40000, 3000, 83000),
       ('78902', '56780', '2022-11-01', 27000, 1500, 28500),
       ('78903', '56780', '2022-11-11', 21000, 4000, 67000),
       ('78904', '56780', '2022-11-29', 58000, 2000, 60000);


# Display tables
select * from company;

select * from car;

select * from inventory;

select * from order_info;

select * from address;

select * from person;

select * from dealership;

select * from employee;

select * from customer;

select * from customer_order;

select * from master_billing;

select * from purchase_invoice;