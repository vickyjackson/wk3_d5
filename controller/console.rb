require('pry')
require_relative('../model/film')
require_relative('../model/customer')
require_relative('../model/ticket')
require_relative('../model/screening')


# Create a new instance of the Film class and pass it data
# Call the save method on that instance
film1 = Film.new({ 'title' => 'Conair', 'price' => 5 })
film1.save()

film2 = Film.new({ 'title' => 'Conair 2', 'price' => 10 })
film2.save()

# Create a new instance of the Customer class and pass it data
# Call the save method on that instance
customer1 = Customer.new({ 'name' => 'Vicky McJack', 'funds' => 20 })
customer1.save()

customer2 = Customer.new({ 'name' => 'Alfie McAlfie', 'funds' => 20 })
customer2.save()

# Create a new instance of the Screening class and pass it data
# Call the save method on that instance
screening1 = Screening.new({ 'screening' => '10:00', 'screen' => 4, 'film_id' => film1.id })
screening1.save()
screening2 = Screening.new({ 'screening' => '13:00', 'screen' => 4, 'film_id' => film1.id })
screening2.save()
screening3 = Screening.new({ 'screening' => '16:00', 'screen' => 4, 'film_id' => film1.id })
screening3.save()
screening4 = Screening.new({ 'screening' => '20:00', 'screen' => 4, 'film_id' => film1.id })
screening4.save()
screening5 = Screening.new({ 'screening' => '23:00', 'screen' => 4, 'film_id' => film1.id })
screening5.save()

# Create a new instance of the Ticket class and pass it data
# Call the save method on that instance
ticket1 = Ticket.new({ 'screening' => screening1, 'customer' => customer2 })
ticket1.save()
ticket2 = Ticket.new({ 'screening' => screening2, 'customer' => customer2 })
ticket2.save()
ticket3 = Ticket.new({ 'screening' => screening3, 'customer' => customer2 })
ticket3.save()
ticket4 = Ticket.new({ 'screening' => screening4, 'customer' => customer2 })
ticket4.save()
ticket5 = Ticket.new({ 'screening' => screening4, 'customer' => customer2 })
ticket5.save()
ticket6 = Ticket.new({ 'screening' => screening4, 'customer' => customer2 })
ticket6.save()
ticket7 = Ticket.new({ 'screening' => screening3, 'customer' => customer2 })
ticket7.save()

# Update an existing instance of the Film class
film1.title = ('Con Air')
film1.update()

# Update an existing instance of the Customer class
customer1.name = ('Vicky Jackson')
customer1.funds = 500
customer1.update()

# Update an existing instance of the Ticket class
# ticket1.customer_id = 1
# ticket1.update()

# # Delete a single existing film from the database via the relevant object
# film1.delete()
#
# # Delete a single existing customer from the database via the relevant object
# customer1.delete()
#
# # Delete a single existing ticket from the database via the relevant object
# ticket1.delete()
#
# # Delete all customers by calling a Customer class method
# Customer.delete_all()
#
# # Delete all films by calling a Film class method
# Film.delete_all()
#
# # Delete all tickets by calling a Ticket class method
# Ticket.delete_all()

# p film1.customers()
# p customer1.films()
 p film1.count_tickets()
# p screening1.tickets()
# p customer2.count_tickets()
# p screening1.film()
# p ticket1.customer()
p film1.find_most_popular_screening()
