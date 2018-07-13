require('pry')
require_relative('../model/film')
require_relative('../model/customer')
require_relative('../model/ticket')

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

# Create a new instance of the Ticket class and pass it data
# Call the save method on that instance
ticket1 = Ticket.new({ 'film_id' => film2.id, 'customer_id' => customer2.id })
ticket1.save()

# Update an existing instance of the Film class
film1.title = ('Con Air')
film1.update()

# Update an existing instance of the Customer class
customer1.name = ('Vicky Jackson')
customer1.update()

# Delete a single existing film from the database via the relevant object
film1.delete()

# Delete a single existing customer from the database via the relevant object
customer1.delete()

# Delete all customers by calling a Customer class method
# Customer.delete_all()

# Delete all films by calling a Film class method
# Film.delete_all()
