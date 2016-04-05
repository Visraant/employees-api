json.id employee.id
json.first_name employee.first_name
json.last_name employee.last_name
json.full_name employee.full_name
json.birthdate employee.birthdate
json.email employee.email
json.ssn employee.ssn
json.addresses employee.addresses do |address|
 json.address1 address.address_1
 json.address2 address.address_2
 json.city address.city
 json.state address.state
 json.zip address.zip
 json.employeeid address.employee_id
end