SELECT
customer.first_name,customer.last_name,
contact.email,contact.phone

FROM customer

INNER JOIN contact ON customer.customer_id =contact.FK_customer_id;

----------------------------------------------------------------------

SELECT
customer.first_name,customer.last_name,
contact.email,contact.phone,
reserve.pickup_date,reserve.dropoff_date,location.location_address,
car.car_name,
model.car_model,
pay.price as daily_cost



FROM customer

INNER JOIN contact ON customer.customer_id =contact.FK_customer_id
INNER JOIN reserve ON reserve.FK_customer_id =customer.customer_id
INNER JOIN car ON car.FK_reserve_id=reserve.reserve_id
INNER JOIN model ON model.FK_car_id=car.car_id
INNER JOIN location ON location.location_id=model.FK_location_id
INNER JOIN pay ON pay.FK_model_id=model.model_id


-----------------------------------------------------------------------


SELECT
reserve.reserve_id as ID,
customer.first_name,customer.last_name,
car.car_name,car.car_color,
model.car_model,
pay.price as daily_cost,
insurance.insurance_price as insurance_Coverage,
additional.tank_price,additional.damage_price,
invoice.total



FROM customer
INNER JOIN reserve ON reserve.FK_customer_id =customer.customer_id
INNER JOIN car ON car.FK_reserve_id=reserve.reserve_id
INNER JOIN model ON model.FK_car_id=car.car_id
INNER JOIN pay ON pay.FK_model_id=model.model_id
INNER JOIN insurance ON pay.FK_insurance_id=insurance.insurance_id
INNER JOIN additional ON additional.FK_pay_id=pay.pay_id
INNER JOIN invoice ON invoice.FK_adc_id=additional.adc_id

GROUP BY reserve.reserve_id;
------------------------------------------------------------

SELECT
location.location_address As Branch,
employee.firstname,employee.lastname,title.emp_title as position,salaries.salary



FROM location
INNER JOIN employee ON employee.FK_location_id =location.location_id
INNER JOIN title ON title.title_id=employee.FK_title_id
INNER join salaries ON salaries.FK_emp_id=employee.emp_id
where location.location_id=1 and salaries.salary>5000.00
-------------------------------------------------------------------
SELECT
location.location_address As Branch,
car.car_name,model.car_model,car.car_color,model.model_year,model.model_fuel



FROM model
INNER JOIN car on car.car_id=model.FK_car_id
INNER JOIN  location on location.location_id=model.FK_location_id

where location.location_id=1


------------------------------------------------------------------


SELECT
location.location_address As Branch,
employee.firstname,employee.lastname,title.emp_title as position,salaries.salary



FROM location
INNER JOIN employee ON employee.FK_location_id =location.location_id
INNER JOIN title ON title.title_id=employee.FK_title_id
INNER join salaries ON salaries.FK_emp_id=employee.emp_id
where location.location_id=1 and salaries.salary > 40000

---------------------------------all tables-----------------------------------

SELECT
customer.first_name,customer.last_name,
contact.country as customer_country,
reserve.pickup_date,return_car.dropoff_date,location.location_address,return_car.dropoff_location,
car.car_name,
model.car_model, available.available_date,
pay.price as daily_cost,
employee.firstname as emp_name,title.emp_title,salaries.salary,
insurance.insurance_typ,additional.tank_amount,additional.damage_type,invoice.total,paid.payment_date



FROM customer

INNER JOIN contact ON customer.customer_id =contact.FK_customer_id
INNER JOIN reserve ON reserve.FK_customer_id =customer.customer_id
INNER JOIN car ON car.FK_reserve_id=reserve.reserve_id
INNER JOIN model ON model.FK_car_id=car.car_id
INNER JOIN return_car ON return_car.FK_model_id=model.model_id
INNER JOIN available on available.FK_model_id=model.model_id
INNER JOIN location ON location.location_id=model.FK_location_id
INNER JOIN employee ON employee.FK_location_id =location.location_id
INNER JOIN title ON title.title_id=employee.FK_title_id
INNER join salaries ON salaries.FK_emp_id=employee.emp_id
INNER JOIN pay ON pay.FK_model_id=model.model_id
INNER JOIN insurance ON pay.FK_insurance_id=insurance.insurance_id
INNER JOIN additional ON additional.FK_pay_id=pay.pay_id
INNER JOIN invoice ON invoice.FK_adc_id=additional.adc_id
INNER JOIN paid ON paid.FK_invoice_id=invoice.invoice_id

WHERE title.emp_title='branch manager'
GROUP BY reserve.reserve_id ;

---------------------------------customer didnt pay yet-------------------------------------
SELECT
reserve.reserve_id,model.model_id,
customer.first_name,customer.last_name,
contact.country as customer_country,
reserve.dropoff_date,return_car.dropoff_location,`return_car`.dropoff_date,
car.car_name,
model.car_model, available.available_date,
pay.price as daily_cost,
insurance.insurance_typ,
invoice.total 




FROM customer

INNER JOIN contact ON customer.customer_id =contact.FK_customer_id
INNER JOIN reserve ON reserve.FK_customer_id =customer.customer_id
INNER JOIN car ON car.FK_reserve_id=reserve.reserve_id
INNER JOIN model ON model.FK_car_id=car.car_id
INNER JOIN return_car ON return_car.FK_model_id=model.model_id
INNER JOIN available on available.FK_model_id=model.model_id
INNER JOIN location ON location.location_id=model.FK_location_id
INNER JOIN pay ON pay.FK_model_id=model.model_id
INNER JOIN insurance ON pay.FK_insurance_id=insurance.insurance_id
INNER JOIN additional ON additional.FK_pay_id=pay.pay_id
INNER JOIN invoice ON invoice.FK_adc_id=additional.adc_id
INNER JOIN paid ON paid.FK_invoice_id=invoice.invoice_id
WHERE paid.payment_date IS null
GROUP BY reserve.reserve_id ;

-----------------------------------------availabel check now ---------------

SELECT

car.car_name,
model.car_model,model.model_year,model.model_fuel,available.available_date,location.location_address



FROM model
INNER JOIN car ON car.car_id=model.model_id
INNER JOIN available on available.FK_model_id=model.model_id
INNER JOIN location on location.location_id=model.FK_location_id


WHERE available.available_date <= CURRENT_DATE;