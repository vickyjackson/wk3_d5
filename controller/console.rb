require('pry')
require_relative('../model/film')
require_relative('../model/customer')

# Create a new instance of the Film class and pass it data
# Call the save method on that instance
film1 = Film.new({ 'title' => 'Conair', 'price' => 10 })
film1.save()

# Create a new instance of the Customer class and pass it data
# Call the save method on that instance
customer1 = Customer.new({ 'name' => 'Vicky McJack', 'funds' => 20 })
customer1.save()

# Create a new instance of the Ticket class and pass it data
# Call the save method on that instance
# ticket1 = Ticket.new({ 'film_id' => film.id, 'customer_id' => customer.id })
# ticket1.save()
