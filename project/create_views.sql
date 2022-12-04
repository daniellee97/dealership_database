# Creating views
# customer view
CREATE VIEW customer_info_vw AS
    SELECT 
        c.customer_id,
        p.first_name,
        p.last_name,
        p.phone,
        a.street_address,
        a.city,
        a.state,
        a.zipcode
    FROM
        customer AS c
            JOIN
        person AS p ON c.person_id = p.person_id
            JOIN
        address AS a ON a.address_id = p.address_id;

# customer billing information view with personal information and balance
CREATE VIEW customer_billing_info_vw AS
    SELECT 
        c.customer_id,
        p.first_name,
        p.last_name,
        p.phone,
        a.street_address,
        a.city,
        a.state,
        a.zipcode,
        m.balance_due
    FROM
        customer AS c
            JOIN
        person AS p ON c.person_id = p.person_id
            JOIN
        master_billing AS m ON m.customer_id = c.customer_id
            JOIN
        address AS a ON a.address_id = p.address_id
    ORDER BY p.last_name;
    
select * from customer_billing_info_vw;

# car inventory view
CREATE VIEW car_inv_vw AS
    SELECT 
        c.car_model,
        comp.company_name,
        c.car_type,
        i.quantity_on_hand,
        i.quantity_on_order,
        i.recommended_quantity
    FROM
        car AS c
            JOIN
        company AS comp ON c.company_id = comp.company_id
            JOIN
        inventory AS i ON c.car_id = i.car_id
    ORDER BY c.car_model;